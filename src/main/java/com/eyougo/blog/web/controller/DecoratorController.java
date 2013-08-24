package com.eyougo.blog.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.eyougo.blog.biz.*;
import com.eyougo.blog.entity.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DecoratorController {

	private BlogBiz blogBiz;

	private CommentBiz commentBiz;

	private MessageBiz messageBiz;
	
	private CategoryBiz categoryBiz;
	
	private BlogConfigBiz blogConfigBiz;

    private LinkBiz linkBiz;

    private EyougoCounterBiz eyougoCounterBiz;

	@RequestMapping(value="/vistors")
	@ResponseBody
	public String vistors(){
		String counterInfo = eyougoCounterBiz.getCounterInfo();
		String visitCount = StringUtils.split(counterInfo, ":")[3];
		return visitCount;
	}
	
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
		List<Link> linkList = linkBiz.getLinkListForMain(6);
        model.addAttribute("linkList", linkList);

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
    public void setLinkBiz(LinkBiz linkBiz) {
        this.linkBiz = linkBiz;
    }

    @Autowired
	@Required
	public void setBlogConfigBiz(BlogConfigBiz blogConfigBiz) {
		this.blogConfigBiz = blogConfigBiz;
	}
	@Autowired
	@Required
	public void setCounterBiz(EyougoCounterBiz eyougoCounterBiz) {
		this.eyougoCounterBiz = eyougoCounterBiz;
	}
	
	
}
