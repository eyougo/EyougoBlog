package com.eyougo.blog.biz.impl;

import java.util.List;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.BlogConfigBiz;
import com.eyougo.blog.dao.BlogConfigDao;
import com.eyougo.blog.entity.BlogConfig;

public class BlogConfigBizImpl implements BlogConfigBiz{
	private BlogConfigDao blogConfigDao;
	
	@Override
	public List<BlogConfig> getAllBlogConfigs() {
		List<BlogConfig> blogConfigs = this.blogConfigDao.findAllBlogConfigs();
		return blogConfigs;
	}

	@Override
	public BlogConfig findBlogConfig(String id) {
		BlogConfig blogConfig = this.blogConfigDao.findBlogConfigById(id);
		return blogConfig;
	}

	@Override
	public String findBlogConfigValueById(String id) {
		BlogConfig blogConfig = this.blogConfigDao.findBlogConfigById(id);
		return blogConfig.getConfigValue();
	}

	@Override
	public void saveBlogConfigs(List<BlogConfig> blogConfigList)
			throws InternalException {
		// TODO Auto-generated method stub
		
	}

}
