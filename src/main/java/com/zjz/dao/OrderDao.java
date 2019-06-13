package com.zjz.dao;

import com.zjz.pojo.Order;


public interface OrderDao {
    //用户下订单
    void insertOrder(Order order);
}
