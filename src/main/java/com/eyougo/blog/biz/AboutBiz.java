package com.eyougo.blog.biz;

import java.util.List;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.entity.About;

public interface AboutBiz {
	List<About> getBaseAbouts();
	
	String getAboutValue(String id);
	
	void saveAbouts(List<About> aboutList) throws InternalException;
	
	String getGravatarUrl();
	
}
