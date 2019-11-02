package com.ershoujy.service;

public interface IUUidService {
    public int add(int uid);
    public String getuuid(int uid);
    public int setuuid(int uid,String uuid);
    public boolean yanzhen(int uid,String uuid);
}
