package com.ershoujy.service;

import com.ershoujy.pojo.UserB;

public interface IUserService {
    //注册
    public int zc(UserB user);
    //登入
    public UserB login(int userid);
}
