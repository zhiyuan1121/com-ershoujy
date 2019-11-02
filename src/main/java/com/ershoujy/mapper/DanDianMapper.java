package com.ershoujy.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface DanDianMapper {
    @Insert("insert into dandian(uid) values(#{uid})")
    public int add(int uid);

    @Select("select dandianuuid from dandian where uid=#{uid}")
    public String getuuid(int uid);

    @Update("update dandian set dandianuuid=#{uuid} where uid=#{uid}")
    public int setuuid(int uid,String uuid);
}
