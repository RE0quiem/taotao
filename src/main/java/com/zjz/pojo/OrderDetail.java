package com.zjz.pojo;

import java.util.List;


public class OrderDetail {
    private String odId;
    private Order order;
    private Product product;

    public String getOdId() {
        return odId;
    }

    public void setOdId(String odId) {
        this.odId = odId;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }


    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "odId='" + odId + '\'' +
                ", order=" + order +
                ", product=" + product +
                '}';
    }
}
