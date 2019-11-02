package com.ershoujy.service;

import com.ershoujy.pojo.GWCB;

import java.util.List;

public interface IGWCService {
    //添加到购物车
    public int Addgwc(GWCB gwc);
    //查看购物车
    public List<GWCB> finall(int uid,int yema,int count);
    //删除购物车
    public int DelGwc(int uid,int spid);
    //计算购物车页数
    public int yemaMax(int uid,int count);
}
