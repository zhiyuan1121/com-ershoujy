package com.ershoujy.service;

import com.ershoujy.pojo.SHDZB;

import java.util.List;

public interface ISHDZService {
    //添加收获地址
    public int Addshdz(SHDZB shdz);
    //查看收获地址
    public List<SHDZB> finshdz(int uid);
    //修改收获地址
    public int updeteshdz(SHDZB shdz);
    //删除收获地址
    public int delshdz(int shid,int uid);
}
