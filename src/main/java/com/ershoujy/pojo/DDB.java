package com.ershoujy.pojo;

import java.io.Serializable;
import java.util.Date;

public class DDB implements Serializable {
    private static final long serialVersionUID = 1L;

    private Integer ddid;
    private SPB spidd;
    private SHDZB shdzidd;
    private Integer spid;
    private Integer shdzid;
    private String xdsj;
    private String wlbh;
    private String ddzt;
    private String fhtime;
    private String shtime;

    public Integer getDdid() {
        return ddid;
    }

    public void setDdid(Integer ddid) {
        this.ddid = ddid;
    }

    public SPB getSpidd() {
        return spidd;
    }

    public void setSpidd(SPB spidd) {
        this.spidd = spidd;
    }

    public SHDZB getShdzidd() {
        return shdzidd;
    }

    public void setShdzidd(SHDZB shdzidd) {
        this.shdzidd = shdzidd;
    }

    public Integer getSpid() {
        return spid;
    }

    public void setSpid(Integer spid) {
        this.spid = spid;
    }

    public Integer getShdzid() {
        return shdzid;
    }

    public void setShdzid(Integer shdzid) {
        this.shdzid = shdzid;
    }


    public String getWlbh() {
        return wlbh;
    }

    public void setWlbh(String wlbh) {
        this.wlbh = wlbh;
    }

    public String getDdzt() {
        return ddzt;
    }

    public void setDdzt(String ddzt) {
        this.ddzt = ddzt;
    }

    public String getXdsj() {
        return xdsj;
    }

    public void setXdsj(String xdsj) {
        this.xdsj = xdsj;
    }

    public String getFhtime() {
        return fhtime;
    }

    public void setFhtime(String fhtime) {
        this.fhtime = fhtime;
    }

    public String getShtime() {
        return shtime;
    }

    public void setShtime(String shtime) {
        this.shtime = shtime;
    }
}
