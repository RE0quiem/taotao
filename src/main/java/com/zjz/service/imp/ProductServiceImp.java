package com.zjz.service.imp;

import com.zjz.dao.ProductDao;
import com.zjz.pojo.Product;
import com.zjz.pojo.TranRecord;
import com.zjz.pojo.VoPro;
import com.zjz.service.ProductService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;


@Transactional
@Service("productService")
public class ProductServiceImp implements ProductService {
    @Resource(name = "productDao")
    private ProductDao productDao;
    @Override
    public void insertProduct(Product product) {
        productDao.productInsert(product);
    }

    @Override
    public List<Product> queryAll() {
        return productDao.queryAll();
    }

    @Override
    public List<Product> fuzzySearch(String fuzzyProName) {
        return productDao.fuzzySearch(fuzzyProName);
    }

    @Override
    public List<Product> queryById(String userId) {
        return productDao.queryById(userId);
    }

    @Override
    public void batchDeletePro(String[] proIds) {
        productDao.batchDeletePro(proIds);
    }

    @Override
    public List<Product> queryByArray(String[] proIds) {
        return productDao.queryByArray(proIds);
    }

    @Override
    public Product queryByProId(String proId) {
        return productDao.queryByProId(proId);
    }

}
