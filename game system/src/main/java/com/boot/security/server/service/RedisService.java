package com.boot.security.server.service;


public interface RedisService  {

    boolean save(String key, String value,int seconds);
    boolean save(String key, String value);
    boolean del(String key);
    String get(String key);
    boolean reflash(String key, String value);

    boolean hasKey(String key);
}
