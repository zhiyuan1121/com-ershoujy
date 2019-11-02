package com.ershoujy.mapper;

import com.ershoujy.pojo.UserB;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;

public interface UserBMapper{
    @Insert("insert into user_b(uname,upaw,quanxian) values (#{uname},#{upaw},#{quanxian})")
    @SelectKey(keyColumn="userid",keyProperty="userid",resultType=Integer.class,before = false, statement = { "select last_insert_id()" })
    public int inset(UserB user);

    @Select("select * from user_b where userid = #{userid}")
    @Results(id="userMap",value = {
            @Result(id=true,column = "userid",property = "userid"),
            @Result(column = "uname",property = "uname"),
            @Result(column = "upaw",property = "upaw"),
            @Result(column = "quanxian",property = "quanxian"),
            @Result(column = "userid",property = "shdz",many = @Many(select = "com.ershoujy.mapper.SHDZBMapper.finall",fetchType = FetchType.LAZY))
    })
    public UserB login(int userid);

    @Update("update user_b set uname=#{uname},upaw=#{upad},quanxian=#{quanxian} where userid=#{userid}")
    public UserB update(UserB user);

}
