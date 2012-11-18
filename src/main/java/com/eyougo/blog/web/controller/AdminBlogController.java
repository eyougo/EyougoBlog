package com.eyougo.blog.web.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.BlogBiz;
import com.eyougo.blog.biz.CategoryBiz;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Category;

@Controller
@RequestMapping(value="/admin/blog")
public class AdminBlogController {
	private static final Log LOG = LogFactory.getLog(AdminBlogController.class);
	private CategoryBiz categoryBiz;
	private BlogBiz blogBiz;
	
	@RequestMapping(value="/list")
	public String list(@RequestParam(required=false, defaultValue="0") Integer categoryId, 
			@RequestParam(required=false, defaultValue="") String stype,
			@RequestParam(required=false, defaultValue="") String keywords, 
			@RequestParam(required=false, defaultValue="1") Integer page, 
			Model model){
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
	
	@RequestMapping(value="/manage")
	public String manage(@RequestParam(required=false) List<String> blogIds, 
			@RequestParam(required=false) String operation,
			@RequestParam(required=false) Integer toCategoryId,
			@RequestParam(required=false, defaultValue="0") Integer categoryId,
			@RequestParam(required=false, defaultValue="") String stype,
			@RequestParam(required=false, defaultValue="") String keywords, 
			@RequestParam(required=false, defaultValue="1") Integer page, RedirectAttributes redirectAttributes) throws InternalException{
		try {
			if(operation!=null && blogIds !=null){
				if(StringUtils.equals(operation, "delmore")){
					this.blogBiz.deleteBlogs(blogIds);
				}else if (StringUtils.equals(operation, "moveto") && toCategoryId != null) {
					this.blogBiz.updateBlogsToCategory(blogIds, toCategoryId);
				}else if (StringUtils.equals(operation, "publish")) {
					this.blogBiz.updateBlogsToPublish(blogIds);
				}			
			}
		} catch (InternalException e) {
			e.printStackTrace();
			LOG.error(e.getMessage(), e);
			throw e;
		}
		redirectAttributes.addAttribute("categoryId", categoryId);
		redirectAttributes.addAttribute("page", page);
		redirectAttributes.addAttribute("stype", stype);
		redirectAttributes.addAttribute("keywords", keywords);
		return "redirect:/admin/blog/list";
	}

	@RequestMapping(value="/delete")
	public String delete(@RequestParam(required=false) Integer blogId,
			@RequestParam(required=false, defaultValue="0") Integer categoryId,
			@RequestParam(required=false, defaultValue="") String stype,
			@RequestParam(required=false, defaultValue="") String keywords, 
			@RequestParam(required=false, defaultValue="1") Integer page, RedirectAttributes redirectAttributes) throws InternalException{
		try {
			if (blogId != null) {
				this.blogBiz.deleteBlogById(blogId);
			}
		} catch (InternalException e) {
			e.printStackTrace();
			LOG.error(e.getMessage(), e);
			throw e;
		}
		redirectAttributes.addAttribute("categoryId", categoryId);
		redirectAttributes.addAttribute("page", page);
		redirectAttributes.addAttribute("stype", stype);
		redirectAttributes.addAttribute("keywords", keywords);
		return "redirect:/admin/blog/list";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String getAdd(Model model){
		List<Category> categories = categoryBiz.getAllCategorys();
		model.addAttribute("categories",categories);
		return "admin/admin_blog_add.ftl";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String postAdd(Blog blog, @RequestParam(required=false, defaultValue="false") Boolean isAutoSummary, Model model) throws InternalException{
		try {
			if (isAutoSummary == true) {
				this.blogBiz.createBlogWithAutoSummary(blog);
			}else {
				this.blogBiz.createBlog(blog);
			}
		} catch (InternalException e) {
			LOG.error(e.getMessage(), e);
			throw e;
		}
		return "redirect:/admin/blog/addok";
	}
	
	@RequestMapping(value="/addok")
	public String addOk(){
		return "admin/admin_blog_addok.ftl";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public String getEdit(@RequestParam Integer blogId, Model model){
		Blog blog = blogBiz.getBlogById(blogId);
		model.addAttribute("blog", blog);
		List<Category> categories = categoryBiz.getAllCategorys();
		model.addAttribute("categories",categories);
		return "admin/admin_blog_add.ftl";
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
