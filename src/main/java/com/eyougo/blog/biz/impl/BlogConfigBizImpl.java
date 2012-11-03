package com.eyougo.blog.biz.impl;

import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
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
		String configValue = findBlogConfigValueFromCacheList(id);
		//缓存没有
		if (configValue == null) {
			BlogConfig blogConfig = this.blogConfigDao.findBlogConfigById(id);
			configValue = blogConfig.getConfigValue();
		}
		
		return configValue;
	}
	
	private String findBlogConfigValueFromCacheList(String id) {
		//先从缓存中找
		String configValue = null;
		try {
			configValue = (String)CacheList.getInstance().getObject(ConfigCache.CACHE_NAME, id);
		} catch (CacheException e) {
		}
		return configValue;
	}

	@Override
	public void saveBlogConfigs(List<BlogConfig> blogConfigList)
			throws InternalException {
		try {
			Iterator<BlogConfig> it = blogConfigList.iterator();
			while (it.hasNext()) {
				BlogConfig blogConfig =  it.next();
				if (blogConfig != null) {
					blogConfig = this.blogConfigDao.updateBlogConfig(blogConfig);
					if (!StringUtils.equals(this.findBlogConfigValueFromCacheList(blogConfig.getId()), blogConfig.getConfigValue())){
						CacheList.getInstance().putObject(ConfigCache.CACHE_NAME, blogConfig.getId(), blogConfig.getConfigValue());
					}
				}	
			}
		}catch(Exception e){
			throw new InternalException(e.getMessage());
		}
		
	}

	public BlogConfigBiz setBlogConfigValue(String id,String configValue,List<BlogConfig> configList){
		String blogConfigValue= findBlogConfigValueById(id);
		//如果和原有设置信息不同，加入待保存列表中
		if (!configValue.equals(blogConfigValue)) {
			BlogConfig blogConfig = this.blogConfigDao.findBlogConfigById(id);
			blogConfig.setConfigValue(configValue);
			configList.add(blogConfig);
		}
		return this;
	}
	
	
	@Override
	public String getAdminPassword() {
		return this.findBlogConfigValueById("ADMINPASSWORD");
	}
	@Override
	public String getBlogCopyright(){
		return this.findBlogConfigValueById(EyougoConstant.BLOG_COPYRIGHT);
	}
	
	@Override
	public String getOriginalNote(){
		return this.findBlogConfigValueById(EyougoConstant.ORIGINAL_NOTE);
	}
	
	@Override
	public String getBlogName(){
		return this.findBlogConfigValueById(EyougoConstant.BLOG_NAME);
	}
	
	@Override
	public String getBlogTitle(){
		return this.findBlogConfigValueById(EyougoConstant.BLOG_TITLE);
	}
	
	@Required
	public void setBlogConfigDao(BlogConfigDao blogConfigDao) {
		this.blogConfigDao = blogConfigDao;
	}

}
