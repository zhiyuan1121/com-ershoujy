package com.ershoujy.service.impl;

import com.ershoujy.Uiit.Datatime;
import com.ershoujy.mapper.GWCBMapper;
import com.ershoujy.pojo.GWCB;
import com.ershoujy.service.IGWCService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class GWCServiceImpl implements IGWCService {
    @Autowired
    private GWCBMapper gwcdao;
    @Autowired
    private Datatime uiit;
    @Override
    public int Addgwc(GWCB gwc) {
        if(gwcdao.finbyid(gwc.getUid(),gwc.getSpid())!=null){
            return 0;
        }
        gwc.setAddtime(uiit.getDate(new Date()));
        return gwcdao.addgwc(gwc);
    }

    @Override
    public List<GWCB> finall(int uid, int yema, int count) {
        return gwcdao.finall(uid,--yema*count,count);
    }

    @Override
    public int DelGwc(int uid, int spid) {
        return gwcdao.delgwc(uid,spid);
    }

    @Override
    public int yemaMax(int uid,int count) {
        int coun = gwcdao.count(uid);
        int yema = coun/count+1;
        if(coun%count==0){
            yema--;
        }
        return yema;
    }
}
