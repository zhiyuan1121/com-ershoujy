package com.ershoujy.pojo;


import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class SPB implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer spid;
    private Integer fbuid;
    private UserB fbuidd;
    private String spname;
    private BigDecimal spjg;
    private String spjpg;
    private String spxq;
    private String scsj;
    private String spzt;

    public Integer getSpid() {
        return spid;
    }

    public void setSpid(Integer spid) {
        this.spid = spid;
    }

    public Integer getFbuid() {
        return fbuid;
    }

    public void setFbuid(Integer fbuid) {
        this.fbuid = fbuid;
    }

    public UserB getFbuidd() {
        return fbuidd;
    }

    public void setFbuidd(UserB fbuidd) {
        this.fbuidd = fbuidd;
    }

    public String getSpname() {
        return spname;
    }

    public void setSpname(String spname) {
        this.spname = spname;
    }

    public BigDecimal getSpjg() {
        return spjg;
    }

    public void setSpjg(BigDecimal spjg) {
        this.spjg = spjg;
    }

    public String getSpjpg() {
        return spjpg;
    }

    public void setSpjpg(String spjpg) {
        this.spjpg = spjpg;
    }

    public String getSpxq() {
        return spxq;
    }

    public void setSpxq(String spxq) {
        this.spxq = spxq;
    }

    public String getScsj() {
        return scsj;
    }

    public void setScsj(String scsj) {
        this.scsj = scsj;
    }

    public String getSpzt() {
        return spzt;
    }

    public void setSpzt(String spzt) {
        this.spzt = spzt;
    }
}
