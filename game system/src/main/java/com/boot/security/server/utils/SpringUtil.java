package com.boot.security.server.utils;

import com.boot.security.server.model.Img;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * spring获取bean工具类
 * 
 * @author luoluo
 *
 */
@Component
public class SpringUtil implements ApplicationContextAware {

	private static ApplicationContext applicationContext = null;

	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		SpringUtil.applicationContext = applicationContext;
	}

	public static <T> T getBean(Class<T> cla) {
		return applicationContext.getBean(cla);
	}

	public static <T> T getBean(String name, Class<T> cal) {
		return applicationContext.getBean(name, cal);
	}

	public static String getProperty(String key) {
		return applicationContext.getBean(Environment.class).getProperty(key);
	}


	//手动解析img list
	public static List<Img> StrToListImg(String imgs){
		List<Img> lstImg = new LinkedList<>();
		if(imgs == null || (imgs+"").trim().isEmpty()){
			return lstImg;
		}

		String[] arrImgs = imgs.split("&&&&");
		for (String strImg: arrImgs
		) {
			try {
				if (strImg == null || (strImg + "").trim().isEmpty()) {
					continue;
				}
				String[] attrs = strImg.split(",");
				Img img = new Img();
				if (attrs.length > 2) {
					for (String attr : attrs
					) {
						if (attr == null || (attr + "").trim().isEmpty()) {
							continue;
						}
						String[] info = attr.split(":");
						if (info.length == 2) {
							switch (info[0].toLowerCase()) {
								case "uid":
									img.setUid(info[1] + "");
									break;
								case "dbrmc":
									img.setDbrmc(info[1] + "");
									break;
								case "imgtype":
									img.setImgtype(info[1] + "");
									break;
								case "imgpath":
									img.setImgpath(info[1] + "");
									break;
								case "zjhm":
									img.setZjhm(info[1] + "");
									break;
								case "cjbm":
									img.setCjbm(info[1] + "");
									break;
								case "xjbm":
									img.setXjbm(info[1] + "");
									break;
								case "x":
									double x = 0;
									try {
										x = Double.parseDouble(info[1] + "");
									} catch (Exception e) {
									}
									img.setX(x);
									break;
								case "y":
									double y = 0;
									try {
										y = Double.parseDouble(info[1] + "");
									} catch (Exception e) {
									}
									img.setY(y);
									break;
								case "createtime":
									long timenum = 0;
									try{
										timenum = Long.valueOf(info[1] + "");
										img.setCreateTime(new Date(timenum));
									}catch (Exception ex){
										ex.printStackTrace();
									}

								case "syrmc":
									img.setSyrmc(info[1]+"");
									break;

								case "syrzjhm":
									img.setSyrzjhm(info[1]+"");
									break;


							}


						}
					}


				}

				if(img.getUid()!= null && img.getUid().length()>0){
					lstImg.add(img);
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return lstImg;
	}



}
