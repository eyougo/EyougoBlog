package com.eyougo.blog.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eyougo.blog.biz.BlogBiz;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Category;

@Controller
@RequestMapping(value="/")
public class IndexController {
	private BlogBiz blogBiz;
	
	@RequestMapping(method=RequestMethod.GET)
	public String get(Model model){
		Pager pager = new Pager();
		pager.setPage(1);
		Blog blog = new Blog();
		blog.setIsDraft(false);
		Category category = new Category();
		category.setCategory("BLOG");
		category.setId(0);
		List<Blog> blogList = blogBiz.getBlogsLikeBlog(blog, pager);
		model.addAttribute("blogList", blogList);
		model.addAttribute("category", category);
		model.addAttribute("pager", pager);
		return "/blog_list.ftl";
	}
	@Autowired
	@Required
	public void setBlogBiz(BlogBiz blogBiz) {
		this.blogBiz = blogBiz;
	}
}
