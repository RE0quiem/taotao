package com.zjz.service;

import com.zjz.pojo.User;


public interface UserService {
    User login(User user);
    void register(User user);

    User queryById(String userId);

    void updatePerson(User user);
}
