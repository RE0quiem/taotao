package com.zjz.pojo;


public class VoMsg {
    private String userId;
    private String userName;
    private String proId;
    private String msg;
    private String mId;

    public String getmId() {
        return mId;
    }

    public void setmId(String mId) {
        this.mId = mId;
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

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    @Override
    public String toString() {
        return "VoMsg{" +
                "userId='" + userId + '\'' +
                ", userName='" + userName + '\'' +
                ", proId='" + proId + '\'' +
                ", msg='" + msg + '\'' +
                ", mId='" + mId + '\'' +
                '}';
    }
}
