package com.eyougo.blog.dao;

import java.util.List;

import com.eyougo.blog.entity.BlogConfig;

/**
 * Blog配置持久层
 * @author MeiHongyuan
 *
 */
public interface BlogConfigDao {
	BlogConfig findBlogConfigById(String id);
	BlogConfig updateBlogConfig(BlogConfig blogConfig);
	List<BlogConfig> findAllBlogConfigs();
}
