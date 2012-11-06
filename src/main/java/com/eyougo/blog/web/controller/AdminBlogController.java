package com.eyougo.blog.web.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eyougo.blog.biz.BlogBiz;
import com.eyougo.blog.biz.CategoryBiz;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Category;

@Controller
@RequestMapping(value="/admin/blog")
public class AdminBlogController {
	private CategoryBiz categoryBiz;
	private BlogBiz blogBiz;
	
	@RequestMapping(value="/list")
	public String list(@RequestParam(required=false, defaultValue="0") Integer categoryId, @RequestParam(required=false, defaultValue="") String stype,
			@RequestParam(required=false, defaultValue="") String keywords, @RequestParam(required=false, defaultValue="1") Integer page, Model model){
		Pager pager = new Pager();
		pager.setPage(page);
		pager.setPerPageNum(10);
		Blog blog = new Blog();
		if (categoryId != 0) {
			Category category = categoryBiz.getCategoryById(categoryId);
			blog.setCategory(category);
		}
		
		if(StringUtils.isNotEmpty(keywords)){
			if("title".equals(stype)){	
				blog.setTitle(keywords);
			}
			if("content".equals(stype)){
				blog.setContent(keywords);
			}
		}
		
		List<Blog> blogList = blogBiz.getBlogsLikeBlog(blog, pager);
		model.addAttribute("blogList",blogList);
		
		List<Category> categories = categoryBiz.getAllCategorys();
		model.addAttribute("categories",categories);
		model.addAttribute("pager", pager);

		model.addAttribute("categoryId", categoryId);
		model.addAttribute("stype", stype);
		model.addAttribute("keywords", keywords);
		return "admin/admin_blog_list.ftl";
	}

	@Autowired
	public void setCategoryBiz(CategoryBiz categoryBiz) {
		this.categoryBiz = categoryBiz;
	}

	@Autowired
	public void setBlogBiz(BlogBiz blogBiz) {
		this.blogBiz = blogBiz;
	}
	
}
