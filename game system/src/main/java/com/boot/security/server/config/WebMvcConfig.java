package com.boot.security.server.config;

import java.io.File;
import java.util.List;

import com.boot.security.server.utils.StrUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.ResourceUtils;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.boot.security.server.page.table.PageTableArgumentResolver;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	/**
	 * 跨域支持
	 * 
	 * @return
	 */
	@Bean
	public WebMvcConfigurer corsConfigurer() {
		return new WebMvcConfigurer() {
			@Override
			public void addCorsMappings(CorsRegistry registry) {
				registry.addMapping("/**").allowedMethods("*");
			}
		};
	}

	/**
	 * datatable分页解析
	 * 
	 * @return
	 */
	@Bean
	public PageTableArgumentResolver tableHandlerMethodArgumentResolver() {
		return new PageTableArgumentResolver();
	}

	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
		argumentResolvers.add(tableHandlerMethodArgumentResolver());
	}

	/**
	 * 上传文件根路径
	 */
	@Value("${files.path}")
	private String filesPath;

	/**
	 * 上传照片根路径
	 */
	@Value("${mice.path}")
	private String micePath;


	/**
	 * 外部文件访问
	 */
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/statics/**")
				.addResourceLocations(ResourceUtils.FILE_URL_PREFIX + filesPath + File.separator);

		registry.addResourceHandler("/mice/**")
				.addResourceLocations(ResourceUtils.FILE_URL_PREFIX + micePath + File.separator);

		registry.addResourceHandler("/pic/**")
				.addResourceLocations(ResourceUtils.FILE_URL_PREFIX + System.getProperty("user.dir") + File.separator);
	}

}
