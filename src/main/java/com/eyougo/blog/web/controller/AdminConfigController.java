package com.eyougo.blog.web.controller;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.BlogConfigBiz;
import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.entity.BlogConfig;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value="/admin/config")
public class AdminConfigController {
	private static final Log LOG = LogFactory.getLog(AdminConfigController.class); 
	private BlogConfigBiz blogConfigBiz;
	@RequestMapping(method = RequestMethod.GET)
	public String get(Model model){
		List<BlogConfig> blogConfigs = blogConfigBiz.getAllBlogConfigs();
		for (BlogConfig blogConfig : blogConfigs) {
			model.addAttribute(blogConfig.getId(), blogConfig.getConfigValue());
		}
		return "/admin/admin_config.ftl";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String post(@RequestParam String blogName, @RequestParam String blogTitle, 
			@RequestParam String blogCopyright, @RequestParam String originalNote){
		List<BlogConfig> configList = new ArrayList<BlogConfig>();
		this.blogConfigBiz
			.setBlogConfigValue(EyougoConstant.BLOG_NAME, blogName, configList)
			.setBlogConfigValue(EyougoConstant.BLOG_TITLE, blogTitle, configList)
			.setBlogConfigValue(EyougoConstant.BLOG_COPYRIGHT, blogCopyright, configList)
			.setBlogConfigValue(EyougoConstant.ORIGINAL_NOTE, originalNote, configList);
		try {
			this.blogConfigBiz.saveBlogConfigs(configList);
		} catch (InternalException e) {
			LOG.error("save blog configs error", e);
		}
		return "redirect:/admin/config";
	}
	
	@Autowired
	@Required
	public void setBlogConfigBiz(BlogConfigBiz blogConfigBiz) {
		this.blogConfigBiz = blogConfigBiz;
	}
	
}
