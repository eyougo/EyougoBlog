package com.eyougo.blog.biz;

import java.util.List;

import com.eyougo.blog.entity.BlogConfig;

public interface BlogConfigBiz {
	/**
	 * 读取数据库中所有设置信息
	 */
	List<BlogConfig> getAllBlogConfigs();
	
	BlogConfig findBlogConfig(String id);
	
	String findBlogConfigValueById(String id);
}
