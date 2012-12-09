package com.eyougo.blog.web.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eyougo.blog.biz.BlogConfigBiz;
import com.eyougo.blog.util.EyougoStringUtil;

@Controller
@RequestMapping(value="/admin/login")
public class AdminLoginController extends BaseController{
	private BlogConfigBiz blogConfigBiz;
	private ResourceBundleMessageSource messageSource;
	
	@Autowired
	@Required
	public void setBlogConfigBiz(BlogConfigBiz blogConfigBiz) {
		this.blogConfigBiz = blogConfigBiz;
	}
	
	@Autowired
	@Required
	public void setMessageSource(ResourceBundleMessageSource messageSource) {
		this.messageSource = messageSource;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public String get(){
		return "/admin/admin_login.ftl";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String post(@RequestParam String adminPassword, @RequestParam String captcha, HttpSession session, Model model){
		if (!this.validateCaptcha(session, captcha)) {
			model.addAttribute("captchaError",messageSource.getMessage("error.captcha", null, Locale.getDefault()));
			return "/admin/admin_login.ftl";
		}
		
		String vAdminPassword = blogConfigBiz.getAdminPassword();
		if (adminPassword!=null&&EyougoStringUtil.hash(adminPassword).equals(vAdminPassword)){
			session.setAttribute("admin", "admin");
			return "redirect:/admin/index";
		}else{
			model.addAttribute("adminPasswordError",messageSource.getMessage("error.adminPassword", null, Locale.getDefault()));
			return "/admin/admin_login.ftl";
		}
	}
}
