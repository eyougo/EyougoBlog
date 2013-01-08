package com.eyougo.blog.web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.BlogBiz;
import com.eyougo.blog.biz.BlogConfigBiz;
import com.eyougo.blog.biz.BlogViewBiz;
import com.eyougo.blog.biz.CategoryBiz;
import com.eyougo.blog.biz.CommentBiz;
import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.BlogView;
import com.eyougo.blog.entity.Category;
import com.eyougo.blog.entity.Comment;

@Controller
@RequestMapping(value="/blog")
public class BlogController extends BaseController{
	private final static Log LOG = LogFactory.getLog(BlogController.class);
	private BlogBiz blogBiz;
	
	private CategoryBiz categoryBiz;
	
	private BlogConfigBiz blogConfigBiz;
	
	private CommentBiz commentBiz;
	
	private BlogViewBiz blogViewBiz;
	
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
			category.setId(0);
		}
		List<Blog> blogList = blogBiz.getBlogsLikeBlog(blog, pager);
		model.addAttribute("blogList", blogList);
		model.addAttribute("category", category);
		model.addAttribute("pager", pager);
		return "/blog_list.ftl";
	}
	
	@RequestMapping(value="/view/{blogId}")
	public String view(@PathVariable Integer blogId, HttpSession session, Model model){
		Blog blog = this.blogBiz.getBlogById(blogId);
		if(blog.getIsDraft()==false
				|| session.getAttribute(EyougoConstant.ADMIN_SESSION_KEY)!=null ){
			BlogView blogView = blogViewBiz.addBlogView(blog.getBlogView());
			blog.setBlogView(blogView);
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
	
	@RequestMapping(value="/addComment")
	public String addComment(Comment comment, @RequestParam String captcha, HttpSession session, Model model){
		try{
			if (this.validateCaptcha(session, captcha)) {
				comment.setCommentDate(new Date());
				commentBiz.saveComment(comment);
			}
		} catch (InternalException e) {
			LOG.error(e.getMessage(), e);
		}
		return "redirect:/blog/view/"+comment.getBlog().getId();
	}

	@Autowired
	public void setBlogBiz(BlogBiz blogBiz) {
		this.blogBiz = blogBiz;
	}

	@Autowired
	public void setCategoryBiz(CategoryBiz categoryBiz) {
		this.categoryBiz = categoryBiz;
	}

	@Autowired
	public void setBlogConfigBiz(BlogConfigBiz blogConfigBiz) {
		this.blogConfigBiz = blogConfigBiz;
	}
	
	@Autowired
	public void setCommentBiz(CommentBiz commentBiz) {
		this.commentBiz = commentBiz;
	}

	@Autowired
	public void setBlogViewBiz(BlogViewBiz blogViewBiz) {
		this.blogViewBiz = blogViewBiz;
	}
	
}
