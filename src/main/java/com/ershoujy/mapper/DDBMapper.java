package com.ershoujy.mapper;


import com.ershoujy.pojo.DDB;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Service;

import java.util.List;

public interface DDBMapper{

    @Insert("insert into dd_b(spid,shdzid,xdsj,ddzt) values(#{spid},#{shdzid},#{xdsj},#{ddzt})")
    @SelectKey(keyColumn="ddid",keyProperty="ddid",resultType=Integer.class,before = false, statement = { "select last_insert_id()" })
    public int adddd(DDB dd);

    @Update("update dd_b,sp_b set wlbh=#{dd.wlbh},fhtime=#{dd.fhtime},ddzt=#{dd.ddzt} where sp_b.spid=dd_b.spid and ddid=#{dd.ddid} and fbuid=#{uid}")
    public int updatefh(DDB dd,int uid);

    @Update("update dd_b,shdz_b set shtime=#{dd.shtime},ddzt=#{dd.ddzt} where dd_b.shdzid=shdz_b.shid and ddid=#{dd.ddid} and uid=#{uid}")
    public int updatesh(DDB dd,int uid);

    @Delete("delete from dd_b where ddid=#{ddid}")
    public int deldd(int ddid);

    @Select("select dd_b.* from dd_b,shdz_b where dd_b.shdzid=shdz_b.shid and shdz_b.uid=#{uid} limit #{yema},#{count}")
    @Results(id="ddMap",value = {
            @Result(id=true,column = "ddid",property = "ddid"),
            @Result(column = "xdsj",property = "xdsj"),
            @Result(column = "wlbh",property = "wlbh"),
            @Result(column = "ddzt",property = "ddzt"),
            @Result(column = "fhtime",property = "fhtime"),
            @Result(column = "shtime",property = "shtime"),
            @Result(column = "spid",property = "spid"),
            @Result(column = "shdzid",property = "shdzid"),
            @Result(column = "spid",property = "spidd",one = @One(select = "com.ershoujy.mapper.SPBMapper.finbyid",fetchType = FetchType.LAZY)),
            @Result(column = "shdzid",property = "shdzidd",one = @One(select = "com.ershoujy.mapper.SHDZBMapper.finbyid",fetchType = FetchType.LAZY)),
    })
    public List<DDB> Sfinall(int uid,int yema,int count);

    @Select("select dd_b.* from dd_b,sp_b where sp_b.spid=dd_b.spid and sp_b.fbuid=#{uid} limit #{yema},#{count}")
    @ResultMap("ddMap")
    public List<DDB> Ffinall(int uid,int yema,int count);

    @Select("select * from dd_b where ddid=#{ddid}")
    @ResultMap("ddMap")
    public DDB funbyid(int ddid);

    @Select("select count(ddid) from dd_b,shdz_b where dd_b.shdzid=shdz_b.shid and shdz_b.uid=#{uid}")
    public int scount(int uid);
    @Select("select count(ddid) from dd_b,sp_b where sp_b.spid=dd_b.spid and sp_b.fbuid=#{uid}")
    public int fcount(int uid);
    @Select("select count(ddid) from dd_b")
    public int countall();
}
