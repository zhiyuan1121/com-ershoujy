package com.ershoujy.pojo;

import java.io.Serializable;

public class SHDZB implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer shid;
    private Integer uid;
    private String shdz;
    private UserB uidd;

    public Integer getShid() {
        return shid;
    }

    public void setShid(Integer shid) {
        this.shid = shid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public UserB getUidd() {
        return uidd;
    }

    public void setUidd(UserB uidd) {
        this.uidd = uidd;
    }

    @Override
    public String toString() {
        return "SHDZB{" +
                "shid=" + shid +
                ", uid=" + uid +
                ", shdz='" + shdz + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }


    public String getShdz() {
        return shdz;
    }

    public void setShdz(String shdz) {
        this.shdz = shdz;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    private String phone;
}
