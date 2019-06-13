package com.zjz.controller;

import com.zjz.pojo.Message;
import com.zjz.pojo.Product;
import com.zjz.pojo.User;
import com.zjz.pojo.VoMsg;
import com.zjz.service.MessageService;
import com.zjz.service.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/message")
public class MessageController {
    @Resource(name = "messageService")
    private MessageService messageService;
    @Resource(name = "productService")
    private ProductService productService;
    //插入对商品的评论
    @RequestMapping("/insertMessage")
    @ResponseBody
    public Map<String,String> insertMessage(@RequestBody VoMsg voMsg){
        Message m=new Message();
        m.setmId(UUID.randomUUID().toString().split("-")[0]);
        m.setmProId(voMsg.getProId());
        //首次插入无
       /* m.setmParentId();*/
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        m.setmTime(format.format(new Date()));
        m.setmFromId(voMsg.getUserId());
        m.setmState("false");
        m.setmContent(voMsg.getMsg());
        m.setmFromName(voMsg.getUserName());
        messageService.saveMessage(m);
        Map<String,String> stateCode=new HashMap<>();
        stateCode.put("code","200");
        return stateCode;
    }
    //评论回复
    @RequestMapping("/insertComment")
    @ResponseBody
    public Map<String,String> insertComment(@RequestBody VoMsg voMsg){
        System.out.println(voMsg);
        Message m=new Message();
        m.setmId(UUID.randomUUID().toString().split("-")[0]);
        m.setmParentId(voMsg.getmId());
        //插入回复，有父留言Id,but no proId
        SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
        m.setmTime(format.format(new Date()));
        m.setmFromId(voMsg.getUserId());
        m.setmState("false");
        m.setmContent(voMsg.getMsg());
        m.setmFromName(voMsg.getUserName());
        messageService.saveMessage(m);
        Map<String,String> stateCode=new HashMap<>();
        stateCode.put("code","200");
        return stateCode;
    }
    //子评论查找
    //返回json的messageMap
    @RequestMapping("/findChildMsg")
    @ResponseBody
    public List<Message> findChildMsg(String parentId){
        List<Message> childMessageList=messageService.findChild(parentId);
        for (Message message : childMessageList) {
            System.out.println(message.toString());
        }
        return childMessageList;
    }
    //跳转到消息中心
    @RequestMapping("/toMessageCenter")
    public String toMessageCenter(HttpSession session, Model model){
        //查找数据
        //查到所有该用户评论
        User loginUser = (User) session.getAttribute("loginUser");
        List<Message> msgList=messageService.findAllMsgByUserId(loginUser.getUserId());
        //遍历。查父消息的发送者
        for (Message message : msgList) {
            if(message.getmParentId()!=null){
                Message fatherMessage=messageService.findFatherById(message.getmParentId());
                message.setmParentName(fatherMessage.getmFromName());
            }
            //根据proId查商品
            if(message.getmProId()!=null){
                Product product = productService.queryByProId(message.getmProId());
                message.setmProName(product.getProductName());
            }
        }
        model.addAttribute("msgList",msgList);
        return "messageCenter";
    }
    @RequestMapping("/deleteMsg")
    @ResponseBody
    public Map<String,String> deleteMsg(String[] ids){
        messageService.batchDelete(ids);
        Map<String,String> stateCode=new HashMap<>();
        stateCode.put("code","200");
        return stateCode;
    }
}
