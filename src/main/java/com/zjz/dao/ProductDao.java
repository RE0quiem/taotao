package com.zjz.dao;

import com.zjz.pojo.Product;
import com.zjz.pojo.TranRecord;
import com.zjz.pojo.VoPro;

import java.util.List;


public interface ProductDao {
    void productInsert(Product product);

    List<Product> queryAll();

    List<Product> fuzzySearch(String fuzzyProName);

    List<Product> queryById(String userId);

    //批量删除，下架 商品
    void batchDeletePro(String[] proIds);

    //根据id数组查询商品所有数据封装到list
    List<Product> queryByArray(String[] proIds);

    Product queryByProId(String proId);
}
