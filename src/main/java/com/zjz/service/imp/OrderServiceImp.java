package com.zjz.service.imp;

import com.zjz.dao.OrderDao;
import com.zjz.dao.OrderDetailDao;
import com.zjz.pojo.Order;
import com.zjz.pojo.OrderDetail;
import com.zjz.pojo.Product;
import com.zjz.pojo.User;
import com.zjz.service.OrderService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Transactional
@Service("orderService")
public class OrderServiceImp implements OrderService {
    @Resource
    private OrderDao orderDao;
    @Resource
    private OrderDetailDao orderDetailDao;
    @Override
    public void insertOrder(Order order) {
        orderDao.insertOrder(order);
    }

    @Override
    public void insertOrderDetail(OrderDetail od) {
        orderDetailDao.insertOrderDetail(od);
    }

    @Override
    public User selectAllInUser(String userId) {
        return orderDetailDao.selectAllInUser(userId);
    }

    @Override
    public void batchDelete(String[] proIds) {
        orderDetailDao.batchDelete(proIds);
    }

    @Override
    public List<OrderDetail> queryByProIds(String[] proIds) {
        return orderDetailDao.queryByProIds(proIds);
    }

    @Override
    public void batchDeleteOrder(List<String> odList) {
        orderDetailDao.batchDeleteOrder(odList);
    }

}
