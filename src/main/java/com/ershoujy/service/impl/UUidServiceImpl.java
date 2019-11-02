package com.ershoujy.service.impl;

import com.ershoujy.mapper.DanDianMapper;
import com.ershoujy.service.IUUidService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UUidServiceImpl implements IUUidService {

    @Autowired
    private DanDianMapper uuiddao;
    @Override
    public int add(int uid) {
        return uuiddao.add(uid);
    }

    @Override
    public String getuuid(int uid) {
        return uuiddao.getuuid(uid);
    }

    @Override
    public int setuuid(int uid, String uuid) {
        return uuiddao.setuuid(uid,uuid);
    }

    @Override
    public boolean yanzhen(int uid, String uuid) {
        String uiid=getuuid(uid);
        if(uiid.equals(uuid)) return true;
        return false;
    }
}
