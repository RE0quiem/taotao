package com.zjz.dao;
import com.zjz.pojo.User;

public interface UserDao {
    User login(User user);
    void register(User user);

    User queryById(String userId);

    void updatePerson(User user);
}
