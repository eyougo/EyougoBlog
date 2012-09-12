package com.eyougo.blog.entity;

import java.util.Set;

public class Category {
	private Integer id;
	private String category;
	private Integer orderNum;//排列顺序
	
	private Set<Blog> blogs;
	
	public Category() {
		super();
	}
	public Category(String category) {
		super();
		this.category = category;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Set<Blog> getBlogs() {
		return blogs;
	}
	public void setBlogs(Set<Blog> blogs) {
		this.blogs = blogs;
	}
	public Integer getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}
	
	
}
