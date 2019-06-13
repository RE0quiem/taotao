package com.zjz.service;

import com.zjz.pojo.Order;
import com.zjz.pojo.OrderDetail;
import com.zjz.pojo.Product;
import com.zjz.pojo.User;

import java.util.List;


public interface OrderService {
    void insertOrder(Order order);

    void insertOrderDetail(OrderDetail od);

    User selectAllInUser(String userId);

    void batchDelete(String[] proIds);

    List<OrderDetail> queryByProIds(String[] proIds);

    void batchDeleteOrder(List<String> odList);
}
