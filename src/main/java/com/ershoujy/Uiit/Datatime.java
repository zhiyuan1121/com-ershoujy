package com.ershoujy.Uiit;

import org.springframework.stereotype.Component;

import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.Date;
@Component
public class Datatime {
    public String getDate(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat();// 格式化时间
        sdf.applyPattern("yyyy-MM-dd HH:mm:ss");// a为am/pm的标记
        return sdf.format(date);// 输出已经格式化的现在时间（24小时制）
    }
    public String getMd5(String paw){
        String result = "";
        try {
            MessageDigest m=MessageDigest.getInstance("MD5");
            m.update(paw.getBytes("UTF-8"));
            byte s[] = m.digest();
            for (int i=0; i<s.length;i++){
                result+=Integer.toHexString((0x000000ff & s[i]) | 0xffffff00).substring(6);
            }
        }catch (Exception e){

        }
        return result;
    }
}
