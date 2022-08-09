package com.boot.security.server.service.impl;

import com.boot.security.server.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
public class RedisServiceImpl implements RedisService {
    @Autowired
    RedisTemplate<String,String> redisTemplate;

    @Override
    public boolean save(String key, String value, int seconds) {
        boolean result = false;
        try {
            redisTemplate.opsForValue().set(key, value,seconds, TimeUnit.SECONDS);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public boolean save(String key, String value) {
        boolean result = false;
        try {
            redisTemplate.opsForValue().set(key, value);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public boolean del(String key) {
        boolean result = false;
        try {
            redisTemplate.delete(key);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public String get(String key) {
        return redisTemplate.opsForValue().get(key);
    }

    @Override
    public boolean  reflash(String key, String value) {

        boolean result = false;
        try {
            redisTemplate.opsForValue().getAndSet(key, value);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Override
    public boolean hasKey(String key) {
        boolean result = false;
        try {
            redisTemplate.hasKey(key);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
