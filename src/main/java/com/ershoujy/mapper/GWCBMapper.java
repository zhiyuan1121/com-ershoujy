package com.ershoujy.mapper;

import com.ershoujy.pojo.GWCB;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface GWCBMapper{
    @Select("select * from gwc_b where uid=#{uid} limit #{yema},#{count}")
    @Results(id="gwcMap",value = {
            @Result(column = "uid",property = "uid"),
            @Result(column = "spid",property = "spid"),
            @Result(column = "uid",property = "uidd",one=@One(select = "com.ershoujy.mapper.UserBMapper.login",fetchType = FetchType.LAZY)),
            @Result(column = "spid",property = "spidd",one = @One(select="com.ershoujy.mapper.SPBMapper.finbyid",fetchType = FetchType.LAZY)),
            @Result(column = "addtime",property = "addtime")
    })
    public List<GWCB> finall(int uid,int yema,int count);

    @Select("select * from gwc_b where uid=#{uid} and spid=#{spid}")
    @ResultMap("gwcMap")
    public GWCB finbyid(int uid,int spid);

    @Delete("delete from gwc_b where uid=#{uid} and spid=#{spid}")
    public int delgwc(int uid,int spid);

    @Insert("insert into gwc_b values (#{uid},#{spid},#{addtime})")
    public int addgwc(GWCB gwc);

    @Select("select count(spid) from gwc_b where uid=#{uid}")
    public int count(int uid);
}
