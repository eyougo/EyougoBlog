package com.eyougo.blog.comm;

import com.eyougo.blog.base.cache.ObjectCache;
import com.eyougo.blog.base.cache.exception.CacheException;

public class ConfigCache extends ObjectCache {
	public static final String CACHE_NAME = "BLOGCONFIG";
	public ConfigCache() {
		super(CACHE_NAME);
	}
	
	@Override
	public void loadData() throws CacheException {
		// TODO Auto-generated method stub
		
	}

}
