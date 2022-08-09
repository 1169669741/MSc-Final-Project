package com.boot.security.server.dto;

import com.boot.security.server.dto.ImgVO;
import com.boot.security.server.model.Img;

import java.util.LinkedList;
import java.util.List;

public class ImgResult {

    int code = 0;
    int count = 0;
    String msg = "";
    String pict="";


    public String getPict() {
        return pict;
    }

    public void setPict(String pict) {
        this.pict = pict;
    }


    List<ImgVO> data = new LinkedList<>();

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<ImgVO> getData() {
        return data;
    }

    public void setData(List<ImgVO> data) {
        this.data = data;
    }



}
