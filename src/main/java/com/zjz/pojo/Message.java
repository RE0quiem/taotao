package com.zjz.pojo;


public class Message {
    private String mId;
    private String mProId;
    private String mParentId;
    private String mTime;
    private String mFromId;
    private String mState;
    private String mContent;
    private String mFromName;
    private String mParentName;
    private String mProName;

    public String getmParentName() {
        return mParentName;
    }

    public void setmParentName(String mParentName) {
        this.mParentName = mParentName;
    }

    public String getmProName() {
        return mProName;
    }

    public void setmProName(String mProName) {
        this.mProName = mProName;
    }
    public String getmFromName() {
        return mFromName;
    }

    public void setmFromName(String mFromName) {
        this.mFromName = mFromName;
    }

    public String getmId() {
        return mId;
    }

    public void setmId(String mId) {
        this.mId = mId;
    }

    public String getmProId() {
        return mProId;
    }

    public void setmProId(String mProId) {
        this.mProId = mProId;
    }

    public String getmParentId() {
        return mParentId;
    }

    public void setmParentId(String mParentId) {
        this.mParentId = mParentId;
    }

    public String getmTime() {
        return mTime;
    }

    public void setmTime(String mTime) {
        this.mTime = mTime;
    }

    public String getmFromId() {
        return mFromId;
    }

    public void setmFromId(String mFromId) {
        this.mFromId = mFromId;
    }

    public String getmState() {
        return mState;
    }

    public void setmState(String mState) {
        this.mState = mState;
    }

    public String getmContent() {
        return mContent;
    }

    public void setmContent(String mContent) {
        this.mContent = mContent;
    }

    @Override
    public String toString() {
        return "Message{" +
                "mId='" + mId + '\'' +
                ", mProId='" + mProId + '\'' +
                ", mParentId='" + mParentId + '\'' +
                ", mTime='" + mTime + '\'' +
                ", mFromId='" + mFromId + '\'' +
                ", mState='" + mState + '\'' +
                ", mContent='" + mContent + '\'' +
                ", mFromName='" + mFromName + '\'' +
                ", mParentName='" + mParentName + '\'' +
                ", mProName='" + mProName + '\'' +
                '}';
    }
}
