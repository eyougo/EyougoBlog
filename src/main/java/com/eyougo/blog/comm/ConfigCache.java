package com.eyougo.blog.comm;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.eyougo.blog.base.cache.ObjectCache;
import com.eyougo.blog.base.cache.exception.CacheException;
import com.eyougo.blog.biz.BlogConfigBiz;
import com.eyougo.blog.entity.BlogConfig;

public class ConfigCache extends ObjectCache<String,String> {
	private static final Log LOG = LogFactory.getLog(ConfigCache.class);
	public static final String CACHE_NAME = "BLOGCONFIG";
	private BlogConfigBiz blogConfigBiz;
	public ConfigCache(BlogConfigBiz blogConfigBiz) {
		super(CACHE_NAME);
		this.blogConfigBiz = blogConfigBiz;
		try {
			this.loadData();
		} catch (CacheException e) {
			e.printStackTrace();
			LOG.error(e.getMessage(), e);
		}
	}
	
	@Override
	public void loadData() throws CacheException {
		
		List<BlogConfig> blogConfigs = this.blogConfigBiz.getAllBlogConfigs();
		
		for (BlogConfig blogConfig : blogConfigs) {
			this.collection.put(blogConfig.getId(), blogConfig.getConfigValue());
		}
	}
}
