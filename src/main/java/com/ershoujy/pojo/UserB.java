package com.ershoujy.pojo;

import java.io.Serializable;
import java.util.List;

public class UserB implements Serializable {
    private static final long serialVersionUID = 1L;
    private Integer userid;
    private String uname;
    private String upaw;
    private String quanxian;
    private List<SHDZB> shdz;
/*    private List<SPB> fbsf;
    private List<DDB> fdd;
    private List<DDB> sdd;
    private List<GWCB> gwc;*/

/*    public List<DDB> getFdd() {
        return fdd;
    }

    public void setFdd(List<DDB> fdd) {
        this.fdd = fdd;
    }

    public List<DDB> getSdd() {
        return sdd;
    }

    public void setSdd(List<DDB> sdd) {
        this.sdd = sdd;
    }

    public List<GWCB> getGwc() {
        return gwc;
    }

    public void setGwc(List<GWCB> gwc) {
        this.gwc = gwc;
    }

    public List<SPB> getFbsf() {
        return fbsf;
    }

    public void setFbsf(List<SPB> fbsf) {
        this.fbsf = fbsf;
    }*/

    public List<SHDZB> getShdz() {
        return shdz;
    }

    public void setShdz(List<SHDZB> shdz) {
        this.shdz = shdz;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpaw() {
        return upaw;
    }

    public void setUpaw(String upaw) {
        this.upaw = upaw;
    }

    public String getQuanxian() {
        return quanxian;
    }

    public void setQuanxian(String quanxian) {
        this.quanxian = quanxian;
    }
}
