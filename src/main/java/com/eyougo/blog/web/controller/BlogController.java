package com.eyougo.blog.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eyougo.blog.base.cache.CacheList;
import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.BlogBiz;
import com.eyougo.blog.biz.BlogConfigBiz;
import com.eyougo.blog.biz.CategoryBiz;
import com.eyougo.blog.comm.ConfigCache;
import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Category;

@Controller
@RequestMapping(value="/blog")
public class BlogController {
	private final static Log LOG = LogFactory.getLog(BlogController.class);
	private BlogBiz blogBiz;
	
	private CategoryBiz categoryBiz;
	
	private BlogConfigBiz blogConfigBiz;
	
	@RequestMapping(value="/list/{categoryId}-{page}")
	public String list(@PathVariable Integer categoryId, @PathVariable Integer page, Model model){
		Pager pager = new Pager();
		pager.setPage(page);
		Blog blog = new Blog();
		blog.setIsDraft(false);
		Category category = new Category();
		if (categoryId != 0) {
			category = categoryBiz.getCategoryById(categoryId);
			blog.setCategory(category);
		}else{
			category.setCategory("BLOG");
		}
		List<Blog> blogList = blogBiz.getBlogsLikeBlog(blog, pager);
		model.addAttribute("blogList", blogList);
		model.addAttribute("category", category);
		return "/blog_list.ftl";
	}
	
	@RequestMapping(value="/view/{blogId}")
	public String view(@PathVariable Integer blogId, HttpSession session, Model model){
		Blog blog = this.blogBiz.getBlogById(blogId);
		if(blog.getIsDraft()==false
				|| session.getAttribute(EyougoConstant.ADMIN_SESSION_KEY)!=null ){
			blog.setBit(blog.getBit()+1);
			try {
				this.blogBiz.saveBlog(blog);
			} catch (InternalException e) {
				LOG.error(e.getMessage(), e);
			}
			model.addAttribute("blog", blog);
			Blog previousBlog = this.blogBiz.getBlogBeforeThisBlog(blog);
			model.addAttribute("previousBlog", previousBlog);
			Blog nextBlog = this.blogBiz.getBlogAfterThisBlog(blog);
			model.addAttribute("nextBlog", nextBlog);
			if (blog.getCopyright()) {
				String originalNote = this.blogConfigBiz.getOriginalNote();
				model.addAttribute("originalNote", originalNote);
			}
		}else{
			return "redirect:/blog/list/0-1";
		}
		return "/blog_view.ftl";
	}

	@Autowired
	@Required
	public void setBlogBiz(BlogBiz blogBiz) {
		this.blogBiz = blogBiz;
	}

	@Autowired
	@Required
	public void setCategoryBiz(CategoryBiz categoryBiz) {
		this.categoryBiz = categoryBiz;
	}
	
}
