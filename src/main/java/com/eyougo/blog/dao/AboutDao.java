package com.eyougo.blog.dao;

import java.util.List;

import com.eyougo.blog.entity.About;

public interface AboutDao {
	List<About> findAllAbouts();
}
