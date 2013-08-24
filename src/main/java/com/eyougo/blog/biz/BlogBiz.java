package com.eyougo.blog.biz;

import java.util.List;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.dao.BlogDao;
import com.eyougo.blog.dao.CategoryDao;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Category;

public interface BlogBiz {

	Blog saveBlog(Blog blog) throws InternalException;

	Blog updateBlog(Blog blog) throws InternalException;
	
	Blog createBlog(Blog blog) throws InternalException;
	
	Blog getBlogById(Integer blogId);

	List<Blog> getRecentPublishedBlogs(int recentNum);

	List<Blog> getBlogsByCategory(Category category, Pager pager);

	List<Blog> getBlogsLikeBlog(Blog blog, Pager pager);

	long getAllBlogNum();

	boolean deleteBlogById(Integer blogId) throws InternalException;

	int updateBlogsToPublish(List<Integer> blogIds) throws InternalException;

	int updateBlogsToCategory(List<Integer> blogIds, Integer categoryId) throws InternalException;

	int deleteBlogs(List<Integer> blogIds) throws InternalException;

	List<Blog> getBlogNumGroupByCategory();

	Blog getBlogBeforeThisBlog(Blog blog);

	Blog getBlogAfterThisBlog(Blog blog);
	
	Blog createBlogWithAutoSummary(Blog blog) throws InternalException;
}