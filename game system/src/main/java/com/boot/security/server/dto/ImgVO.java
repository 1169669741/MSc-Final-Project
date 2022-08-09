package com.boot.security.server.dto;

import com.boot.security.server.model.Img;
import com.sun.jndi.toolkit.url.Uri;

public class ImgVO {

    Img img = new Img();
    public ImgVO(){}
    public ImgVO(Img img){
        this.img = img;
    }

    String iurl;
    String itype;
    String uid;



    public String getIurl() {

        if(img== null) return  "";

        //String fileName = System.getProperty("user.dir") + img.getImgpath();


        if(img.getImgpath().startsWith("/")){

            iurl = "/pic"+img.getImgpath();

        }else {

            iurl = "/pic/"+img.getImgpath();

        }
        return iurl;
    }

    public String getItype() {
        itype = img.getImgtype();
        return itype;
    }

    public String getUid() {
        itype = img.getUid();
        return uid;
    }
}
