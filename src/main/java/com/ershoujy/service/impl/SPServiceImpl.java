package com.ershoujy.service.impl;

import com.ershoujy.Uiit.Datatime;
import com.ershoujy.mapper.SPBMapper;
import com.ershoujy.pojo.SPB;
import com.ershoujy.service.ISPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class SPServiceImpl implements ISPService {
    @Autowired
    private SPBMapper spdao;
    @Autowired
    private Datatime uiit;
    @Override
    public int Addsp(SPB sp) {
        sp.setScsj(uiit.getDate(new Date()));
        sp.setSpzt("下架");
        return spdao.addsp(sp);
    }

    @Override
    public int updetesp(SPB sp) {
        return spdao.Updetesp(sp);
    }

    @Override
    public int sjsp(int spid,int uid) {
        SPB sp = new SPB();
        sp.setSpid(spid);
        sp.setFbuid(uid);
        sp.setSpzt("上架");
        return spdao.Updetespzt(sp);
    }

    @Override
    public int xjsp(int spid,int uid) {
        SPB sp = new SPB();
        sp.setSpid(spid);
        sp.setFbuid(uid);
        sp.setSpzt("下架");
        return spdao.Updetespzt(sp);
    }

    @Override
    public int mcsp(int spid) {
        SPB sp = new SPB();
        sp.setSpid(spid);
        sp.setSpzt("已售");
        return spdao.Updetespztdfh(sp);
    }

    @Override
    public int delsp(int spid) {
        return spdao.delSP(spid);
    }

    @Override
    public int yemaMax(String str, int count) {
        int coun = spdao.countall(str,"上架");
        int yema=coun/count+1;
        if(coun%count==0) yema--;
        return yema;
    }


    @Override
    public List<SPB> finall(String str, int yema, int count) {
        return spdao.finabyname(str,"上架",--yema*count,count);
    }

    @Override
    public List<SPB> finbyuid(int uid, int yema, int count) {
        return spdao.finall(uid,--yema*count,count);
    }

    @Override
    public int yemabyuid(int uid, int count) {
        int coun = spdao.countbyuid(uid);
        int yema=coun/count+1;
        if(coun%count==0) yema--;
        return yema;
    }

    @Override
    public SPB finbyspid(int spid) {
        return spdao.finbyid(spid);
    }

}
