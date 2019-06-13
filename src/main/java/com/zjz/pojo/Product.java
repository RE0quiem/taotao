package com.zjz.pojo;

import java.util.Date;

/**
 * @author zjz
 * @version 1.0
 * @description com.zjz.pojo
 * @date 2019/5/26
 */
public class Product {
    private String productId;
    private String productName;
    private String tip;
    private String productIntro;
    private Double price;
    private String img;
    private String startTime;
    private String endTime;
    private User fromUser;
    private User outUser;

    public Product(String productId) {
        this.productId = productId;
    }

    public Product() {
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getProductIntro() {
        return productIntro;
    }

    public void setProductIntro(String productIntro) {
        this.productIntro = productIntro;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public User getFromUser() {
        return fromUser;
    }

    public void setFromUser(User fromUser) {
        this.fromUser = fromUser;
    }

    public User getOutUser() {
        return outUser;
    }

    public void setOutUser(User outUser) {
        this.outUser = outUser;
    }

    @Override
    public String toString() {
        return "Product{" +
                "productId='" + productId + '\'' +
                ", productName='" + productName + '\'' +
                ", tip='" + tip + '\'' +
                ", productIntro='" + productIntro + '\'' +
                ", price=" + price +
                ", img='" + img + '\'' +
                ", startTime='" + startTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", fromUser=" + fromUser +
                ", outUser=" + outUser +
                '}';
    }
}
