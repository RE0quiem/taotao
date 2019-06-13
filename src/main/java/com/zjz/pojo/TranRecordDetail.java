package com.zjz.pojo;

import com.zjz.service.TransationRecord;


public class TranRecordDetail {
    private String trdId;
    private TranRecord tr;
    private Product product;

    public String getTrdId() {
        return trdId;
    }

    public void setTrdId(String trdId) {
        this.trdId = trdId;
    }

    public TranRecord getTr() {
        return tr;
    }

    public void setTr(TranRecord tr) {
        this.tr = tr;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "TranRecordDetail{" +
                "trdId='" + trdId + '\'' +
                ", tr=" + tr +
                ", product=" + product +
                '}';
    }
}
