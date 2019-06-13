package com.zjz.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjz.pojo.Product;
import com.zjz.pojo.User;
import com.zjz.pojo.VoUser;
import com.zjz.service.ProductService;
import com.zjz.service.UserService;
import com.zjz.utils.MD5Utils;
import com.zjz.utils.UploadUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;


@Controller
@RequestMapping("/user")
public class UserController {
    @Resource(name = "userService")
    private UserService userService;
    @Resource(name = "productService")
    private ProductService productService;
    @RequestMapping("/login")
    public String login(User user, HttpSession session, HttpServletRequest request){
        user.setUserPassword(MD5Utils.md5(user.getUserPassword()));
        User loginUser=userService.login(user);
        if(loginUser!=null){
            System.out.println(loginUser);
            session.setAttribute("loginUser",loginUser);
            return "forward:queryAll";
        }
        request.setAttribute("msg","账户名或密码错误");
        return  "forward:/login.jsp";
    }
    @RequestMapping("/register")
    public String register(User user,HttpServletRequest request){
        String dormitory1=request.getParameter("dormitory1");
        String dormitory2=request.getParameter("dormitory2");
        user.setUserDor(dormitory1+"-"+dormitory2);
        //得到UUID作为主键
        String[] ids = UUID.randomUUID().toString().split("-");
        user.setUserId(ids[0]);
        //密码加密
        user.setUserPassword(MD5Utils.md5(user.getUserPassword()));
        System.out.println(user);
        userService.register(user);
        request.setAttribute("msg","注册成功请登录");
        return "forward:/login.jsp";
    }
    //分页查询所有商品
    @RequestMapping("/queryAll")
    public String queryAll(Model model,@RequestParam(required = false,defaultValue = "1",value = "pageNum") Integer pageNum){
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
    //跳转到商品添加页面
    @RequestMapping("/toInsertProduct")
    public String toInsertProduct(){
        return "productInsert";
    }
    //商品添加
    @RequestMapping("/insertProduct")
    public String insertProduct(HttpSession session, MultipartFile img,HttpServletRequest request){
        Product product=new Product();
        product.setProductName(request.getParameter("productName"));
        product.setPrice(Double.valueOf(request.getParameter("price")));
        product.setProductIntro(request.getParameter("productIntro"));
        product.setTip(request.getParameter("tip"));
        //得到UUID作为主键
        String[] ids = UUID.randomUUID().toString().split("-");
        product.setProductId(ids[0]);
        //set时间
        Calendar nowTime = Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        product.setStartTime(format.format(nowTime.getTime()));
        nowTime.add(Calendar.MONTH,1);
        product.setEndTime(format.format(nowTime.getTime()));
        //setUseId
        User loginUser = (User) session.getAttribute("loginUser");
        product.setFromUser(loginUser);
        //set img
        String uuidFileName = UploadUtils.getUuidFileName(img.getOriginalFilename());
        String relativePath = UploadUtils.getPath(uuidFileName);
        String path="F:\\idea_workSpace\\taotao\\src\\main\\webapp\\img"+relativePath;
        File file=new File(path);
        if(!file.exists()){
            file.mkdirs();
        }
        String uri = path+ uuidFileName;
        File imgFile=new File(uri);
        /*未处理异常******************************************/
        try {
            img.transferTo(imgFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        product.setImg("http://localhost:8080/img"+relativePath+uuidFileName);

        productService.insertProduct(product);
        return "redirect:queryAll";
    }

    //跳转到更新页面
    @RequestMapping("/toUpdatePerson")
    public String toUpdatePerson(String userId,Model model){
        User user=userService.queryById(userId);
        String[] dors = user.getUserDor().split("-");
        VoUser voUser=new VoUser();
        voUser.setUser(user);
        voUser.setDor1(dors[0]);
        voUser.setDor2(dors[1]);
        model.addAttribute("userUpdate",voUser);
        return  "personCenter";
    }
    @RequestMapping("/updatePerson")
    public String updatePerson(User user,HttpServletRequest request,HttpSession session){
        user.setUserPassword(MD5Utils.md5(user.getUserPassword()));
        String dormitory1 = request.getParameter("dormitory1");
        String dormitory2 = request.getParameter("dormitory2");
        user.setUserDor(dormitory1+"-"+dormitory2);
        User loginUser = (User) session.getAttribute("loginUser");
        user.setUserId(loginUser.getUserId());
        System.out.println(user);
        userService.updatePerson(user);
        return "redirect:queryAll";
    }
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session){
        session.invalidate();
        return "redirect:/login.jsp";
    }
    @RequestMapping("/toAccountMoney")
    public String toAccountMoney(){
        //直接跳转到账户页面
        return  "accountMoney";
    }
    @RequestMapping("/rechargeMoney")
    public String rechargeMoney(HttpSession session,String rechargeMoney){
        User loginUser = (User) session.getAttribute("loginUser");
        String userId = loginUser.getUserId();
        Double money=Double.valueOf(rechargeMoney);
        User user = userService.queryById(userId);
        user.setUserMoney(money+user.getUserMoney());
        userService.updatePerson(user);
        session.removeAttribute("loginUser");
        session.setAttribute("loginUser",user);
        return "redirect:toAccountMoney";
    }
}
