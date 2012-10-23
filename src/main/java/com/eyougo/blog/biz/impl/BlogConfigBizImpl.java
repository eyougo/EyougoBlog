package com.eyougo.blog.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Required;

import com.eyougo.blog.base.cache.CacheList;
import com.eyougo.blog.base.cache.exception.CacheException;
import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.BlogConfigBiz;
import com.eyougo.blog.comm.ConfigCache;
import com.eyougo.blog.comm.EyougoConstant;
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
		//先从缓存中找
		String configValue = null;
		try {
			configValue = (String)CacheList.getInstance().getObject(ConfigCache.CACHE_NAME, id);
		} catch (CacheException e) {
		}
		//缓存没有
		if (configValue == null) {
			BlogConfig blogConfig = this.blogConfigDao.findBlogConfigById(id);
			configValue = blogConfig.getConfigValue();
		}
		
		return configValue;
	}

	@Override
	public void saveBlogConfigs(List<BlogConfig> blogConfigList)
			throws InternalException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String getAdminPassword() {
		return this.findBlogConfigValueById("ADMINPASSWORD");
	}
	@Override
	public String getCopyRight(){
		return this.findBlogConfigValueById(EyougoConstant.BLOG_COPYRIGHT);
	}
	
	@Override
	public String getOriginalNote(){
		return this.findBlogConfigValueById(EyougoConstant.ORIGINAL_NOTE);
	}
	
	@Required
	public void setBlogConfigDao(BlogConfigDao blogConfigDao) {
		this.blogConfigDao = blogConfigDao;
	}

}
