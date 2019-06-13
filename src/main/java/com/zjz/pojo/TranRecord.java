package com.zjz.pojo;

import java.util.List;


//交易详情表
public class TranRecord {
    private String trId;
    private User user;
    private List<TranRecordDetail> tranRecordDetailList;
    private String buyTime;

    public String getBuyTime() {
        return buyTime;
    }

    public void setBuyTime(String buyTime) {
        this.buyTime = buyTime;
    }

    public String getTrId() {
        return trId;
    }

    public void setTrId(String trId) {
        this.trId = trId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<TranRecordDetail> getTranRecordDetailList() {
        return tranRecordDetailList;
    }

    public void setTranRecordDetailList(List<TranRecordDetail> tranRecordDetailList) {
        this.tranRecordDetailList = tranRecordDetailList;
    }

    @Override
    public String toString() {
        return "TranRecord{" +
                "trId='" + trId + '\'' +
                ", user=" + user +
                ", tranRecordDetailList=" + tranRecordDetailList +
                ", buyTime='" + buyTime + '\'' +
                '}';
    }
}
