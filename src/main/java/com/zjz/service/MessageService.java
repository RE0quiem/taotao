package com.zjz.service;

import com.zjz.pojo.Message;

import java.util.List;


public interface MessageService {
    void saveMessage(Message m);

    List<Message> queryFristMsg(String proId);

    List<Message> findChild(String parentId);

    List<Message> findAllMsgByUserId(String userId);

    Message findFatherById(String parentId);

    void batchDelete(String[] ids);
}
