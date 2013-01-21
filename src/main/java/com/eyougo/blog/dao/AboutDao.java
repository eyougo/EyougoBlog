package com.eyougo.blog.dao;

import java.util.List;

import com.eyougo.blog.entity.About;

public interface AboutDao {
	List<About> findBaseAbouts();
	
	About findAboutById(String id);
	
	About updateAbout(About about);
	
	About saveAbout(About about);
	
	void deleteAbout(About about);
}
