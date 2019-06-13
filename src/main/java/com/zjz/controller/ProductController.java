package com.zjz.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjz.pojo.*;
import com.zjz.service.MessageService;
import com.zjz.service.OrderService;
import com.zjz.service.ProductService;
import com.zjz.service.TransationRecord;
import org.springframework.jms.support.converter.MappingJackson2MessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/product")
public class ProductController {
    @Resource(name = "productService")
    private ProductService productService;
    @Resource(name = "messageService")
    private MessageService messageService;
    @Resource(name = "transationRecord")
    private TransationRecord transationRecord;
    @RequestMapping("/fuzzySearch")
    public String fuzzySearch(Model model,String fuzzyProName, @RequestParam(required = false,defaultValue = "1",value = "pageNum") Integer pageNum){
        List<Product> productList=productService.fuzzySearch(fuzzyProName);
        PageHelper.startPage(pageNum,8);
        PageInfo<Product> pageInfo = new PageInfo(productList, 4);
        model.addAttribute("productsList",productList);
        model.addAttribute("pageInfo",pageInfo);
        return "productIndex";
    }
    //跳转到商品下架页面
    @RequestMapping("/toUnderShelf")
    public String toUnderShelf(HttpSession session,Model model, @RequestParam(required = false,defaultValue = "1",value = "pageNum") Integer pageNum){
        //先查再跳转
        User loginUser = (User) session.getAttribute("loginUser");
        String userId = loginUser.getUserId();
        //当前页，每页5size
        PageHelper.startPage(pageNum,4);
        List<Product> products=productService.queryById(userId);
        //4是连续显示的个数
        PageInfo<Product> pageInfo=new PageInfo<>(products,4);
        model.addAttribute("productsList",products);
        model.addAttribute("pageInfo",pageInfo);
        return "productOpration";
    }
    //商品下架
    @RequestMapping("/underShelf")
    @ResponseBody
    public Map<String,String> underShelf(String[] proIds){
        productService.batchDeletePro(proIds);
        Map<String,String> stateCode=new HashMap<>();
        stateCode.put("code","200");
        return stateCode;
    }

    //跳转到商品详情页面()
    @RequestMapping("/toProductDetails")
    public String toProductDetails(String proId, Model model, HttpSession session){
            Product product=productService.queryByProId(proId);
            model.addAttribute("productDetails",product);
            //查找一级留言
            List<Message> messageList=messageService.queryFristMsg(proId);
            model.addAttribute("messageList",messageList);
            return  "productDetails";
    }

//    //跳转到已购商品界面
//    @RequestMapping("/toBoughtProduct")
//    public String toBoughtProduct(Model model,HttpSession session){
//        User loginUser = (User) session.getAttribute("loginUser");
//        //通过userId查记录表
//        List<TranRecord> tranRecordList=transationRecord.queryByUserId(loginUser.getUserId());
//        //通过订单表号查详情
//        for (TranRecord tranRecord : tranRecordList) {
//            List<TranRecordDetail> orderDetailList=transationRecord.queryByOrderIdGetDetail(tranRecord.getTrId());
//        }
//        Map<List<>>
//        return null;
//    }
}
