package com.zjz.service.imp;

import com.zjz.dao.TransationRecordDao;
import com.zjz.pojo.TranRecord;
import com.zjz.pojo.TranRecordDetail;
import com.zjz.service.TransationRecord;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


@Transactional
@Service("transationRecord")
public class TransationRecordImp implements TransationRecord {
    @Resource
    private TransationRecordDao transationRecordDao;
    @Override
    public void saveRecord(TranRecord tr) {
        transationRecordDao.saveRecord(tr);
    }

    @Override
    public void saveRecordDetail(TranRecordDetail trd) {
        transationRecordDao.saveRecordDetail(trd);
    }
}
