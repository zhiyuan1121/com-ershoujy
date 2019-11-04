package com.ershoujy.service.impl;

import com.ershoujy.Uiit.Datatime;
import com.ershoujy.mapper.DDBMapper;
import com.ershoujy.mapper.GWCBMapper;
import com.ershoujy.pojo.DDB;
import com.ershoujy.service.IDDService;
import com.ershoujy.service.IGWCService;
import com.ershoujy.service.ISPService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;
@Service
public class DDServiceImpl implements IDDService {
    @Autowired
    private DDBMapper dddao;
    @Autowired
    private IGWCService gwcservice;
    @Autowired
    private ISPService spservice;
    @Autowired
    private Datatime uiit;
    @Override
    public int cjdd(DDB dd) {
        dd.setXdsj(uiit.getDate(new Date()));
        return dddao.adddd(dd);
    }

    @Override
    public int fhdd(int uid,int ddid,String wlbh) {
        DDB dd = new DDB();
        dd.setDdid(ddid);
        dd.setWlbh(wlbh);
        dd.setFhtime(uiit.getDate(new Date()));
        dd.setDdzt("待收货");
        return dddao.updatefh(dd,uid);
    }

    @Override
    public int shdd(int uid,int ddid) {
        DDB dd = new DDB();
        dd.setDdid(ddid);
        dd.setShtime(uiit.getDate(new Date()));
        dd.setDdzt("完成");
        return dddao.updatesh(dd,uid);
    }

    @Override
    public List<DDB> gmdd(int uid, int yema, int count) {

        return dddao.Sfinall(uid,count*--yema,count);
    }

    @Override
    public List<DDB> sjdd(int uid, int yema, int count) {
        return dddao.Ffinall(uid,--yema*count,count);
    }

    @Override
    public int yemaMaxF(int uid,int count) {
        int coun = dddao.fcount(uid);
        int yema=coun/count+1;
        if(coun%count==0){
            yema--;
        }
        return yema;
    }

    @Override
    public int yemaMaxH(int uid,int count) {
        int coun = dddao.scount(uid);
        int yema=coun/count+1;
        if(coun%count==0){
            yema--;
        }
        return yema;
    }

    @Override
    public int yemaMax(int count) {
        int coun = dddao.countall();
        int yema=coun/count+1;
        if(coun%count==0){
            yema--;
        }
        return yema;
    }

    @Override
    @Transactional
    public int GM(int uid, int spid, int shdzid) {
        DDB dd = new DDB();
        dd.setShdzid(shdzid);
        dd.setSpid(spid);
        dd.setDdzt("待发货");
        cjdd(dd);
        gwcservice.DelGwc(uid,spid);
        spservice.mcsp(spid);
        return 1;
    }
}
