package com.eyougo.blog.dao;

import com.eyougo.blog.entity.BlogView;

public interface BlogViewDao {
	/**
	 * 保存日志浏览量
	 * @param blog Blog
	 * @return BlogView
	 */
	BlogView saveBlogView(BlogView blogView);
}
