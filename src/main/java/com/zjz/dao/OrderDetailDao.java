package com.zjz.dao;

import com.zjz.pojo.OrderDetail;
import com.zjz.pojo.Product;
import com.zjz.pojo.User;

import java.util.List;


public interface OrderDetailDao {
    //用户下完订单后插入订单详情
    void insertOrderDetail(OrderDetail od);
    //查询所有订单数据，在user对象中存放
    User selectAllInUser(String userId);
    //批量删除orderDetail
    void batchDelete(String[] proIds);
    //查到details对象
    List<OrderDetail> queryByProIds(String[] proIds);
    //批量删除order
    void batchDeleteOrder(List<String> odList);
}
