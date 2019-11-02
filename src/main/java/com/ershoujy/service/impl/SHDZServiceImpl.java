package com.ershoujy.service.impl;

import com.ershoujy.mapper.SHDZBMapper;
import com.ershoujy.pojo.SHDZB;
import com.ershoujy.service.ISHDZService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class SHDZServiceImpl implements ISHDZService {
    @Autowired
    private SHDZBMapper shdzdao;
    @Override
    public int Addshdz(SHDZB shdz) {
        return shdzdao.AddSHDZ(shdz);
    }

    @Override
    public List<SHDZB> finshdz(int uid) {
        return shdzdao.finall(uid);
    }

    @Override
    public int updeteshdz(SHDZB shdz) {
        return shdzdao.updateshdz(shdz);
    }

    @Override
    public int delshdz(int shid,int uid) {
        return shdzdao.delshdz(shid,uid);
    }
}
