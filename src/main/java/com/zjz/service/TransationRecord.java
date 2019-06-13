package com.zjz.service;

import com.zjz.pojo.TranRecord;
import com.zjz.pojo.TranRecordDetail;


public interface TransationRecord {
    void saveRecord(TranRecord tr);

    void saveRecordDetail(TranRecordDetail trd);
}
