package com.zjz.service.imp;

import com.zjz.dao.UserDao;
import com.zjz.pojo.User;
import com.zjz.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


@Transactional
@Service("userService")
public class UserServiceImp implements UserService {
    @Resource(name = "userDao")
    private UserDao userDao;
    @Override
    public User login(User user) {
        return userDao.login(user);
    }

    @Override
    public void register(User user) {
        userDao.register(user);
    }

    @Override
    public User queryById(String userId) {
        return userDao.queryById(userId);
    }

    @Override
    public void updatePerson(User user) {
        userDao.updatePerson(user);
    }
}
