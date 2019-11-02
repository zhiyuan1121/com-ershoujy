package com.ershoujy.pojo;

import org.apache.ibatis.annotations.Insert;

import java.io.Serializable;
import java.util.Date;

public class GWCB implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer uid;
    private Integer spid;
    private UserB uidd;
    private SPB spidd;
    private String addtime;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getSpid() {
        return spid;
    }

    public void setSpid(Integer spid) {
        this.spid = spid;
    }

    public UserB getUidd() {
        return uidd;
    }

    public void setUidd(UserB uidd) {
        this.uidd = uidd;
    }

    public SPB getSpidd() {
        return spidd;
    }

    public void setSpidd(SPB spidd) {
        this.spidd = spidd;
    }

    public String getAddtime() {
        return addtime;
    }

    public void setAddtime(String addtime) {
        this.addtime = addtime;
    }
}
