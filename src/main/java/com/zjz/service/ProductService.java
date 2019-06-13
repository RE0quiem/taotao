package com.zjz.service;

import com.zjz.pojo.Product;
import com.zjz.pojo.TranRecord;

import java.util.List;


public interface ProductService {
    void insertProduct(Product product);

    List<Product> queryAll();

    List<Product> fuzzySearch(String fuzzyProName);

    List<Product> queryById(String userId);

    void batchDeletePro(String[] proIds);

    List<Product> queryByArray(String[] proIds);

    Product queryByProId(String proId);
}
