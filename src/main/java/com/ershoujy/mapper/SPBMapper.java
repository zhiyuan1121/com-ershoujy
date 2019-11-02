package com.ershoujy.mapper;

import com.ershoujy.pojo.SPB;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface SPBMapper{
    @Insert("INSERT INTO `sp_b` (fbuid,spname,spjg,spjpg,spxq,scsj,spzt) values(#{fbuid},#{spname},#{spjg},#{spjpg},#{spxq},#{scsj},#{spzt})")
    @SelectKey(keyColumn="spid",keyProperty="spid",resultType=Integer.class,before = false, statement = { "select last_insert_id()" })
    public int addsp(SPB sp);

    @Select("select * from sp_b where fbuid=#{uid} limit #{yema},#{count}")
    @Results(id="spMap",value = {
            @Result(id=true,column = "spid",property = "spid"),
            @Result(column = "spname",property = "spname"),
            @Result(column = "spjg",property = "spjg"),
            @Result(column = "spjpg",property = "spjpg"),
            @Result(column = "spxq",property = "spxq"),
            @Result(column = "scsj",property = "scsj"),
            @Result(column = "spzt",property = "spzt"),
            @Result(column = "fbuid",property = "fbuid"),
            @Result(column = "fbuid",property = "fbuidd",one=@One(select = "com.ershoujy.mapper.UserBMapper.login",fetchType = FetchType.LAZY))
    })
    public List<SPB> finall(int uid,int yema,int count);

//    "select * from (select * from sp_b where spzt=#{zt}) where spname like %#{spname}% limit #{yema},#{count}"
    @Select("select * from sp_b where spzt=#{zt} and spname like CONCAT('%',#{spname},'%') limit #{yema},#{count}")
    @ResultMap("spMap")
    public List<SPB> finabyname(String spname,String zt,int yema,int count);

    @Update("update sp_b set spjg=#{spjg},spjpg=#{spjpg},spxq=#{spxq},spzt=#{spzt},spname=#{spname} where spid=#{sp.spid}")
    public int Updetesp(SPB sp);

    @Update("update sp_b set spzt=#{spzt} where spid=#{spid} and fbuid=#{fbuid}")
    public int Updetespzt(SPB sp);

    @Update("update sp_b set spzt=#{spzt} where spid=#{spid}")
    public int Updetespztdfh(SPB sp);

    @Select({"select * from sp_b where spid=#{spid}"})
    @ResultMap("spMap")
    public SPB finbyid(int spid);

    @Delete("delete from sp_b where spid=#{spid}")
    public int delSP(int spid);

    @Select("select count(spid) from sp_b where spzt=#{zt} and spname like CONCAT('%',#{spname},'%')")
    public int countall(String spname,String zt);
    @Select("select count(spid) from sp_b where fbuid=#{uid}")
    public int countbyuid(int uid);

}
