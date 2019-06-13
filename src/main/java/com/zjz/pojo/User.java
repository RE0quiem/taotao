package com.zjz.pojo;

import java.util.List;
import java.util.Set;

public class User {
    private String userId;
    private String userName;
    private String userPassword;
    private String userTel;
    private String userDor;
    private Double userMoney;
    private Set<Product> products;
    private List<Order> orders;

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }

    public User(String userId) {
        this.userId = userId;
    }

    public User() {
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserTel() {
        return userTel;
    }

    public void setUserTel(String userTel) {
        this.userTel = userTel;
    }

    public String getUserDor() {
        return userDor;
    }

    public void setUserDor(String userDor) {
        this.userDor = userDor;
    }

    public Double getUserMoney() {
        return userMoney;
    }

    public void setUserMoney(Double userMoney) {
        this.userMoney = userMoney;
    }

    public Set<Product> getProducts() {
        return products;
    }

    public void setProducts(Set<Product> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", userPassword='" + userPassword + '\'' +
                ", userTel='" + userTel + '\'' +
                ", userDor='" + userDor + '\'' +
                ", userMoney=" + userMoney +
                ", products=" + products +
                ", orders=" + orders +
                '}';
    }
}
