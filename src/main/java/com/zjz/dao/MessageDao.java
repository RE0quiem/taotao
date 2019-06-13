package com.zjz.dao;

import com.zjz.pojo.Message;

import java.util.List;


public interface MessageDao {
    void saveMessage(Message m);
    //查找一级留言
    List<Message> queryFristMsg(String proId);
    //查找子留言
    List<Message> findChild(String parentId);
    //查找
    List<Message> findAllMsgByUserId(String userId);

    Message findFatherById(String parentId);

    void batchDelete(String[] ids);
}
