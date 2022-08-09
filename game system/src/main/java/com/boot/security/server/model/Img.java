package com.boot.security.server.model;

import java.util.Date;

/**
 * 证件照片实体
 */
public class Img {

    int id ;         //id唯一值

    public String getUid() {
        return uid;
    }

    public void setUid(String uid) {
        this.uid = uid;
    }

    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public String getLicense() {
        return license;
    }

    public void setLicense(String license) {
        this.license = license;
    }

    String uid;
    String zjhm;        //身份证号码
    String dbrmc;       //低保人名称
    String imgtype;     //证件类型
    String imgpath;     //证件地址
    String xjbm;        //乡级代码
    String cjbm;        //村级代码
    String uploader;    //上传人
    Date    updateTime;  //更新时间
    Date    createTime;  //创建时间

    public String getSyrmc() {
        return syrmc;
    }

    public void setSyrmc(String syrmc) {
        this.syrmc = syrmc;
    }

    public String getSyrzjhm() {
        return syrzjhm;
    }

    public void setSyrzjhm(String syrzjhm) {
        this.syrzjhm = syrzjhm;
    }

    String syrmc;
    String syrzjhm;

    double x = 0;
    double y = 0;
    String license;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getZjhm() {
        return zjhm;
    }

    public void setZjhm(String zjhm) {
        this.zjhm = zjhm;
    }

    public String getDbrmc() {
        return dbrmc;
    }

    public void setDbrmc(String dbrmc) {
        this.dbrmc = dbrmc;
    }

    public String getImgtype() {
        return imgtype;
    }

    public void setImgtype(String imgtype) {
        this.imgtype = imgtype;
    }

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }

    public String getXjbm() {
        return xjbm;
    }

    public void setXjbm(String xjbm) {
        this.xjbm = xjbm;
    }

    public String getCjbm() {
        return cjbm;
    }

    public void setCjbm(String cjbm) {
        this.cjbm = cjbm;
    }

    public String getUploader() {
        return uploader;
    }

    public void setUploader(String uploader) {
        this.uploader = uploader;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Img{" +
                "id='" + id + '\'' +
                ", zjhm='" + zjhm + '\'' +
                ", dbrmc='" + dbrmc + '\'' +
                ", imgtype='" + imgtype + '\'' +
                ", imgpath='" + imgpath + '\'' +
                ", xjbm='" + xjbm + '\'' +
                ", cjbm='" + cjbm + '\'' +
                ", uploader='" + uploader + '\'' +
                ", updateTime=" + updateTime +
                ", createTime=" + createTime +
                '}';
    }
}
