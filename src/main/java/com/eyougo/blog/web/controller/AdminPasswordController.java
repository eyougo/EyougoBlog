package com.eyougo.blog.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.BlogConfigBiz;
import com.eyougo.blog.entity.BlogConfig;
import com.eyougo.blog.util.EyougoStringUtil;

@Controller
@RequestMapping(value="/admin/password")
public class AdminPasswordController {
	private static final Log LOG = LogFactory.getLog(AdminPasswordController.class); 
	private BlogConfigBiz blogConfigBiz;
	@RequestMapping(method = RequestMethod.GET)
	public String get(Model model){
		List<BlogConfig> blogConfigs = blogConfigBiz.getAllBlogConfigs();
		for (BlogConfig blogConfig : blogConfigs) {
			model.addAttribute(blogConfig.getId(), blogConfig.getConfigValue());
		}
		return "/admin/admin_password.ftl";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String post(@RequestParam String formerPassword, @RequestParam String password){
		String vAdminPassword = blogConfigBiz.getAdminPassword();
		if(StringUtils.isNotEmpty(formerPassword) && 
				EyougoStringUtil.hash(formerPassword).equals(vAdminPassword)){
			List<BlogConfig> configList = new ArrayList<BlogConfig>();
			this.blogConfigBiz
				.setBlogConfigValue("ADMINPASSWORD", EyougoStringUtil.hash(password), configList);
			try {
				this.blogConfigBiz.saveBlogConfigs(configList);
			} catch (InternalException e) {
				LOG.error("save blog configs error", e);
			}
		}
		return "redirect:/admin/password";
	}
	
	@Autowired
	@Required
	public void setBlogConfigBiz(BlogConfigBiz blogConfigBiz) {
		this.blogConfigBiz = blogConfigBiz;
	}
	
}
