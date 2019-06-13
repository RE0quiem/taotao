package com.zjz.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import com.zjz.pojo.*;
import com.zjz.service.OrderService;
import com.zjz.service.ProductService;
import com.zjz.service.TransationRecord;
import com.zjz.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/order")
public class OrderController {
    @Resource(name = "orderService")
    private OrderService orderService;
    @Resource(name = "productService")
    private ProductService productService;
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "transationRecord")
    private TransationRecord transationRecord;
    @RequestMapping("/insertOrder")
    @ResponseBody
    public Map<String,String> insertOrder(String userId, String proId, HttpServletResponse response){
        //插入到Order表
        String[] ids = UUID.randomUUID().toString().split("-");
        Order order=new Order();
        order.setOrderId(ids[0]);

        Calendar nowTime = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        order.setOrderTime(format.format(nowTime.getTime()));

        order.setUser(new User(userId));

        orderService.insertOrder(order);
        //插入到order详情表
        String[] ids2 = UUID.randomUUID().toString().split("-");
        OrderDetail od=new OrderDetail();
        od.setOdId(ids2[0]);
        od.setOrder(order);
        od.setProduct(new Product(proId));
        orderService.insertOrderDetail(od);
        Map<String,String> stateCode=new HashMap<>();
        stateCode.put("code","200");
        return stateCode;
    }
    //分页查询所有商品
    @RequestMapping("/queryAll")
    public String queryAll(Model model, @RequestParam(required = false,defaultValue = "1",value = "pageNum") Integer pageNum){
        //当前页，每页8size
        PageHelper.startPage(pageNum,8);
        List<Product> products=productService.queryAll();
        //4是连续显示的个数
        PageInfo<Product> pageInfo=new PageInfo<>(products,4);
        model.addAttribute("productsList",products);
        model.addAttribute("pageInfo",pageInfo);
        //返回到商品首页
        return "productIndex";
    }
    //跳转到购物车
    @RequestMapping("/toShoppingCar")
    public String toShoppingCar(Model model,String userId){
        //先查
        Double sum=0.0;
        User user=orderService.selectAllInUser(userId);
        Map<Product,String> productMap=new HashMap<>();
        try{
            List<Order> orders = user.getOrders();
            for (Order order : orders) {
                String orderTime = order.getOrderTime();
                List<OrderDetail> orderDetails = order.getOrderDetails();
                for (OrderDetail orderDetail : orderDetails) {
                    Product product = orderDetail.getProduct();
                    sum+=product.getPrice();
                    productMap.put(product,orderTime);
                }
            }
        }finally {
            model.addAttribute("productMap",productMap);
            model.addAttribute("sum",sum);
            return "shoppingCar";
        }
    }
    @RequestMapping("/delete")
    public @ResponseBody Map<String,String> batchDelete(String proIds[]){
        //根据id删除
        //1先查到orderid
        //2删order
        //3删details
        List<OrderDetail> orderDetailList=orderService.queryByProIds(proIds);
        List<String> odList=new ArrayList<>();
        for (OrderDetail orderDetail : orderDetailList) {
            odList.add(orderDetail.getOrder().getOrderId());
        }
        orderService.batchDeleteOrder(odList);
        orderService.batchDelete(proIds);
        Map<String,String> stateCode=new HashMap<>();
        stateCode.put("code","200");
        return stateCode;
    }

    @RequestMapping("/buy")
    @ResponseBody
    public Map<String,String> buy(String[] proIds, HttpSession session,String sum){
        Map<String,String> stateCode=new HashMap<>();
        //首先扣钱加钱
        //再删订单
        //再查商品信息到新表
        //再商品下架
        User loginUser = (User) session.getAttribute("loginUser");
        if(loginUser.getUserMoney()<Double.valueOf(sum)){
            stateCode.put("code","300");
            return stateCode;
        }
        //买方扣钱
        User outUser = userService.queryById(loginUser.getUserId());
        outUser.setUserMoney(outUser.getUserMoney()-Double.valueOf(sum));
        userService.updatePerson(outUser);
        //卖方们加钱
        List<Product> productsList = productService.queryByArray(proIds);
        for (Product product : productsList) {
            //fromUserId对象只有Id
            User fromUserId = product.getFromUser();
            String userId = fromUserId.getUserId();
            User fromUser = userService.queryById(userId);
            fromUser.setUserMoney(fromUser.getUserMoney()+product.getPrice());
            userService.updatePerson(fromUser);
        }
        //删除订单详情
        List<OrderDetail> orderDetailList=orderService.queryByProIds(proIds);
        List<String> odList=new ArrayList<>();
        for (OrderDetail orderDetail : orderDetailList) {
            odList.add(orderDetail.getOrder().getOrderId());
        }
        orderService.batchDeleteOrder(odList);
        orderService.batchDelete(proIds);
        //保存交易记录
        //1首先根据outuserid生成交易表
        String[] ids = UUID.randomUUID().toString().split("-");
        TranRecord tr=new TranRecord();
        tr.setTrId(ids[0]);
        tr.setUser(outUser);
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        String dateFormat = format.format(new Date());
        tr.setBuyTime(dateFormat);
        transationRecord.saveRecord(tr);
        //2根据保存的表单号保存交易详情到表中
        TranRecordDetail trd=new TranRecordDetail();
        for (Product product : productsList) {
            product.setOutUser(outUser);
            //每个product对应一个交易详情,放入tr对象
            trd.setTrdId(UUID.randomUUID().toString().split("-")[0]);
            trd.setTr(tr);
            trd.setProduct(product);
            transationRecord.saveRecordDetail(trd);
        }
        //商品下架
        productService.batchDeletePro(proIds);
        stateCode.put("code","200");
        return  stateCode;
    }
}
