package com.eyougo.blog.entity;

public class BlogView {
	private Integer blogId;
	private Integer view;
	private Blog blog;
	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}
	public void setView(Integer view) {
		this.view = view;
	}
	public void setBlog(Blog blog) {
		this.blog = blog;
		blog.setBlogView(this);
	}
	public Integer getBlogId() {
		return blogId;
	}
	public Integer getView() {
		return view;
	}
	public Blog getBlog() {
		return blog;
	}
	
}
