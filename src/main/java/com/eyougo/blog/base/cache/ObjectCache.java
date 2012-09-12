package com.eyougo.blog.base.cache;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.eyougo.blog.base.cache.exception.CacheException;

public abstract class ObjectCache{
	private static final Log LOG = LogFactory.getLog(ObjectCache.class);
    private String name = null;
    protected Map collection = null;
    
    public ObjectCache(String cacheName) {
        this.name = cacheName;
        collection = new HashMap();
        try {
			CacheList.getInstance().addCache(this);
		} catch (CacheException e) {
			e.printStackTrace();
			LOG.error(e.getMessage(), e);
		}
    }
    
    public void put(Object key, Object value)
    {
        collection.put(key,value);
    }
    
    public Object get(Object key)
    {
        return collection.get(key);
    }
    
    public void remove(Object key){
    	collection.remove(key);
    }

    public Iterator valuesIterator()
    {
        return collection.values().iterator();
    }
    
    public Iterator keysIterator()
    {
        return collection.keySet().iterator();
    }
    
    public String getCacheName()
    {
        return name;
    }
    /*
     * Base class implementation is generic
     * and does not load any specific data.
     * This method can be overridden by subclasses.
     */
    public abstract void loadData() throws CacheException;
}