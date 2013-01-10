package com.eyougo.blog.base.cache;

import java.util.HashMap;
import java.util.Map;

import com.eyougo.blog.base.cache.exception.CacheException;

/**
 * 单例模式
 * 储存所有继承了ObjectCache类的Cache对象
 * 任何继承ObjectCache类的Cache对象在初始化时即可加入到该类的单例对象中
 * 之后可通过该类单例对象访问
 * @author mei
 *
 */
public class CacheList {
	
	private static CacheList instance = null;
	private Map<String, ObjectCache> caches;
	
	private CacheList() {
		caches = new HashMap();
	}

	public static CacheList getInstance() throws CacheException{
		if (instance == null)
        {
            synchronized (CacheList.class)
            {
				if (instance == null)
                {
                    instance = new CacheList();
                }
            }
        }
        return instance;
    }
	
	public CacheList addCache(ObjectCache objectCache) throws CacheException{
		instance.caches.put(objectCache.getCacheName(), objectCache);
		return instance;
    }
	
	/*
	 * Return an object within the named cache identified by the key
	 */
	public Object getObject(String cacheName, Object key) throws CacheException {
		ObjectCache cache = getCache(cacheName);
		return cache.get(key);
	}

	/*
	 * Store an object in the named cache with the given key
	 */
	//TODO 锁机制可以改进
	public synchronized void putObject(String cacheName, Object key,
			Object value) throws CacheException {
		ObjectCache cache = getCache(cacheName);
		cache.put(key, value);
	}

	/*
	 * Remove an object in the named cache with the given key
	 */
	public synchronized void removeObject(String cachename, Object key)
			throws CacheException {
		ObjectCache cache = getCache(cachename);
		cache.remove(key);
	}

	public synchronized void reloadObject(String cachename, Object key,
			Object value) throws CacheException {
		ObjectCache cache = getCache(cachename);
		cache.remove(key);
		cache.put(key, value);
	}

	public ObjectCache getCache(String cacheName) throws CacheException {
		ObjectCache cache = caches.get(cacheName);
		if (cache == null) {
			throw new CacheException("The cache named '" + cacheName + "' in CacheList is null, please check if the cache initialize success", 
					null);
		}
		return cache;
	}
}
