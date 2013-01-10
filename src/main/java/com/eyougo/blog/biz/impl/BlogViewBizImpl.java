package com.eyougo.blog.biz.impl;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.eyougo.blog.biz.BlogViewBiz;
import com.eyougo.blog.dao.BlogViewDao;
import com.eyougo.blog.entity.BlogView;

public class BlogViewBizImpl implements BlogViewBiz {
	private static final Log LOG = LogFactory.getLog(BlogViewBizImpl.class);
	private BlogViewDao blogViewDao;
	@Override
	public BlogView addBlogView(BlogView blogView) {
		blogView.setView(blogView.getView()+1);
		try {
			blogView =  blogViewDao.saveBlogView(blogView);
		} catch (Exception e) {
			LOG.error("update blog view failed, blog id :" + blogView.getBlogId() + ", "+e.getMessage(), e); 
		}
		return blogView;
	}
	public void setBlogViewDao(BlogViewDao blogViewDao) {
		this.blogViewDao = blogViewDao;
	}

}
