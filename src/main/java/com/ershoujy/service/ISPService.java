package com.ershoujy.service;

import com.ershoujy.pojo.SPB;

import java.util.List;

public interface ISPService {
    //添加商品
    public int Addsp(SPB sp);
    //修改商品
    public int updetesp(SPB sp);
    //上架商品
    public int sjsp(int spid,int uid);
    //下架商品
    public int xjsp(int spid,int uid);
    //迈出商品
    public int mcsp(int spid);
    //删除商品
    public int delsp(int spid);
    //查看商品页数
    public int yemaMax(String str,int count);
    //搜索商品
    public List<SPB> finall(String str,int yema,int count);
    //查看自己发布的商品
    public List<SPB> finbyuid(int uid,int yema,int count);
    //自己发布商品的页码
    public int yemabyuid(int uid,int count);
    //商品详情
    public SPB finbyspid(int spid);
}
