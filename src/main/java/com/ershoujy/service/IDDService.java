package com.ershoujy.service;

import com.ershoujy.pojo.DDB;

import java.util.List;

public interface IDDService {
    //创建订单
    public int cjdd(DDB dd);
    //发货
    public int fhdd(int uid,int ddid,String wldh);
    //收货
    public int shdd(int uid,int ddid);
    //查看购买的订单
    public List<DDB> gmdd(int uid,int yema,int count);
    //查看上架的订单
    public List<DDB> sjdd(int uid,int yema,int count);
    //计算发货方订单页数
    public int yemaMaxF(int uid,int count);
    //计算收获方订单页数
    public int yemaMaxH(int uid,int count);
    //计算总订单页数
    public int yemaMax(int count);
    //购买购物车中的商品
    public int GM(int uid,int spid,int shdzid);
}
