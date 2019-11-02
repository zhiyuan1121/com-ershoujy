package com.ershoujy.mapper;

import com.ershoujy.pojo.SHDZB;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

import java.util.List;

public interface SHDZBMapper{
    @Select("select * from shdz_b where uid=#{uid}")
    @Results(id="shdzMap",value = {
            @Result(id=true,column = "shid",property = "shid"),
            @Result(column = "shdz",property = "shdz"),
            @Result(column = "phone",property = "phone"),
            @Result(column = "uid",property = "uid"),
            @Result(column = "uid",property = "uidd",one=@One(select = "com.ershoujy.mapper.UserBMapper.login",fetchType = FetchType.LAZY))
    })
    public List<SHDZB> finall(int uid);

    @Select("select * from shdz_b where shid=#{shid}")
    @ResultMap("shdzMap")
    public SHDZB finbyid(int shid);

    @Insert("insert into shdz_b(uid,shdz,phone) values (#{uid},#{shdz},#{phone})")
    @SelectKey(keyColumn="shid",keyProperty="shid",resultType=Integer.class,before = false, statement = { "select last_insert_id()" })
    public int AddSHDZ(SHDZB shdzb);

    @Update("update shdz_b set shdz=#{shdz},phone=#{phone} where shid=#{shid} and uid=#{uid}")
    public int updateshdz(SHDZB shdz);

    @Delete("delete from shdz_b where shid=#{shid} and uid=#{uid}")
    public int delshdz(int shid,int uid);
}
