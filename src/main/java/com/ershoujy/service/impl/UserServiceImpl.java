package com.ershoujy.service.impl;

import com.ershoujy.mapper.UserBMapper;
import com.ershoujy.pojo.UserB;
import com.ershoujy.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements IUserService {
    @Autowired
    private UserBMapper userdao;

/*    public void add(UserB user){
        System.out.println(userdao.inset(user));
    }*/

    @Override
    public int zc(UserB user) {
        user.setQuanxian("用户");
        return userdao.inset(user);
    }
    @Override
    public UserB login(int userid){
        UserB user = userdao.login(userid);
        return user;
    }
}
