package com.eyougo.blog.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eyougo.blog.biz.BlogBiz;
import com.eyougo.blog.biz.BlogConfigBiz;
import com.eyougo.blog.biz.CategoryBiz;
import com.eyougo.blog.biz.CommentBiz;
import com.eyougo.blog.biz.MessageBiz;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.BlogConfig;
import com.eyougo.blog.entity.Category;
import com.eyougo.blog.entity.Comment;
import com.eyougo.blog.entity.Message;

@Controller
public class DecoratorController {

	private BlogBiz blogBiz;

	private CommentBiz commentBiz;

	private MessageBiz messageBiz;
	
	private CategoryBiz categoryBiz;
	
	private BlogConfigBiz blogConfigBiz;
	
	@RequestMapping(value="/sidebar")
	public String sidebar(Model model){
		Map<Category, Integer> categoryMap = categoryBiz.getCategorysAndPublishedBlogNum();
		List<Category> categoryList = new ArrayList<Category>();
		Map<String, Integer> categoryNumMap = new HashMap<String, Integer>();
		for (Category category : categoryMap.keySet()) {
			categoryList.add(category);
			categoryNumMap.put(category.getCategory(), categoryMap.get(category));
		}
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("categoryNumMap", categoryNumMap);
		long messageNum = messageBiz.getAllMessageNum();
		model.addAttribute("messageNum", messageNum);
		List<Blog> recentBlogList = blogBiz.getRecentPublishedBlogs(8);
		model.addAttribute("recentBlogList", recentBlogList);
		List<Comment> recentCommentList =  commentBiz.getRecentComments(8);
		for (Iterator<Comment> iterator = recentCommentList.iterator(); iterator.hasNext();) {
			Comment comment = iterator.next();
			String content = comment.getContent();
			content = content.replaceAll("<p>", "").replaceAll("</p>", "")
				.replaceAll("<br />", "").replaceAll("<br/>", "").replaceAll("<br>", "");
			content = content.replaceAll("<h3>", "").replaceAll("</h3>", "");
			comment.setContent(content);
		}
		model.addAttribute("recentCommentList", recentCommentList);
		List<Message> recentMessageList = messageBiz.getRecentMessages(6);
		for (Iterator<Message> iterator = recentMessageList.iterator(); iterator.hasNext();) {
			Message message = iterator.next();
			String content = message.getContent();
			content = content.replaceAll("<p>", "").replaceAll("</p>", "")
				.replaceAll("<br />", "").replaceAll("<br/>", "").replaceAll("<br>", "");
			message.setContent(content);
		}
		model.addAttribute("recentMessageList", recentMessageList);
		return "/decorators/sidebar.ftl";
	}
	
	@RequestMapping(value="/main")
	public String main(Model model){
		List<Category> categoryList = categoryBiz.getAllCategorys();
		model.addAttribute("categoryList", categoryList);
		String blogTitle = blogConfigBiz.getBlogTitle();
		model.addAttribute("blogTitle", blogTitle);
		String blogCopyright = blogConfigBiz.getBlogCopyright();
		model.addAttribute("blogCopyright", blogCopyright);
		return "/decorators/main.ftl";
	}

	@Autowired
	@Required
	public void setBlogBiz(BlogBiz blogBiz) {
		this.blogBiz = blogBiz;
	}
	@Autowired
	@Required
	public void setCommentBiz(CommentBiz commentBiz) {
		this.commentBiz = commentBiz;
	}
	@Autowired
	@Required
	public void setMessageBiz(MessageBiz messageBiz) {
		this.messageBiz = messageBiz;
	}
	@Autowired
	@Required
	public void setCategoryBiz(CategoryBiz categoryBiz) {
		this.categoryBiz = categoryBiz;
	}
	@Autowired
	@Required
	public void setBlogConfigBiz(BlogConfigBiz blogConfigBiz) {
		this.blogConfigBiz = blogConfigBiz;
	}
	
	
}
