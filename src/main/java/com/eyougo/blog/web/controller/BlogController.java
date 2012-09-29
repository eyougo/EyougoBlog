package com.eyougo.blog.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.eyougo.blog.biz.BlogBiz;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Category;

@Controller
@RequestMapping(value="/blog")
public class BlogController {

	@Autowired
	private BlogBiz blogBiz;
	
	@RequestMapping(value="/list/{categoryId}-{page}")
	public String list(@PathVariable Integer categoryId, @PathVariable Integer page, Model model){
		Pager pager = new Pager();
		pager.setPage(page);
		Blog blog = new Blog();
		blog.setIsDraft(false);
		Category category = new Category();
		if (categoryId != 0) {
			category.setId(categoryId);
			blog.setCategory(category);
		}else{
			category.setCategory("BLOG");
		}
		List<Blog> blogList = blogBiz.getBlogsLikeBlog(blog, pager);
		model.addAttribute("blogList", blogList);
		model.addAttribute("category", category);
		return "/blog_list.ftl";
	}
	
	
	
	@RequestMapping(value="/hello")
	@ResponseBody
	public String hello(){
		return "hello";
	}

	public void setBlogBiz(BlogBiz blogBiz) {
		this.blogBiz = blogBiz;
	}
	
}
