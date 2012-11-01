package com.eyougo.blog.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eyougo.blog.biz.BlogConfigBiz;
import com.eyougo.blog.entity.BlogConfig;

@Controller
@RequestMapping(value="/admin/config")
public class AdminConfigController {
	private BlogConfigBiz blogConfigBiz;
	@RequestMapping(method = RequestMethod.GET)
	public String get(Model model){
		List<BlogConfig> blogConfigs = blogConfigBiz.getAllBlogConfigs();
		for (BlogConfig blogConfig : blogConfigs) {
			model.addAttribute(blogConfig.getId(), blogConfig.getConfigValue());
		}
		return "/admin/admin_config.ftl";
	}
	@Autowired
	@Required
	public void setBlogConfigBiz(BlogConfigBiz blogConfigBiz) {
		this.blogConfigBiz = blogConfigBiz;
	}
	
}
