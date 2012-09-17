package com.eyougo.blog.comm;

import java.util.List;

import com.eyougo.blog.base.cache.ObjectCache;
import com.eyougo.blog.base.cache.exception.CacheException;
import com.eyougo.blog.biz.BlogConfigBiz;
import com.eyougo.blog.entity.BlogConfig;

public class ConfigCache extends ObjectCache<String,String> {
	public static final String CACHE_NAME = "BLOGCONFIG";
	private BlogConfigBiz blogConfigBiz;
	public ConfigCache() {
		super(CACHE_NAME);
	}
	
	@Override
	public void loadData() throws CacheException {
		
		List<BlogConfig> blogConfigs = this.blogConfigBiz.getAllBlogConfigs();
		
		for (BlogConfig blogConfig : blogConfigs) {
			this.collection.put(blogConfig.getId(), blogConfig.getConfigValue());
		}
	}

}
