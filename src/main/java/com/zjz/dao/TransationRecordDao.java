package com.zjz.dao;

import com.zjz.pojo.TranRecord;
import com.zjz.pojo.TranRecordDetail;


public interface TransationRecordDao {
    //保存交易记录表
    void saveRecord(TranRecord tr);
    //保存交易详情表
    void saveRecordDetail(TranRecordDetail trd);
}
