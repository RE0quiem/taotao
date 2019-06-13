package com.zjz.service.imp;

import com.zjz.dao.MessageDao;
import com.zjz.pojo.Message;
import com.zjz.service.MessageService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Transactional
@Service("messageService")
public class MessageServiceImp implements MessageService {
    @Resource
    private MessageDao messageDao;
    @Override
    public void saveMessage(Message m) {
        messageDao.saveMessage(m);
    }

    @Override
    public List<Message> queryFristMsg(String proId) {
        return messageDao.queryFristMsg(proId);
    }

    @Override
    public List<Message> findChild(String parentId) {
        return messageDao.findChild(parentId);
    }

    @Override
    public List<Message> findAllMsgByUserId(String userId) {
        return messageDao.findAllMsgByUserId(userId);
    }

    @Override
    public Message findFatherById(String parentId) {
        return messageDao.findFatherById(parentId);
    }

    @Override
    public void batchDelete(String[] ids) {
        messageDao.batchDelete(ids);
    }
}
