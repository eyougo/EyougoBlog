package com.eyougo.blog.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.eyougo.blog.biz.BlogConfigBiz;
import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.comm.ServerInfo;

@Controller
@RequestMapping(value="/admin/index")
public class AdminIndexController {
	private BlogConfigBiz blogConfigBiz;

	@RequestMapping(method=RequestMethod.GET)
	public String get(){
		return "admin/admin_index.ftl";
	}
	
	@RequestMapping(value="/left")
	public String left(Model model){
		String blogName = blogConfigBiz.getBlogName();
		model.addAttribute("blogName", blogName);
		model.addAttribute("version", EyougoConstant.VERSION);
		return "admin/admin_index_left.ftl";
	}
	
	@RequestMapping(value="/top")
	public String top(Model model){
		return "admin/admin_index_top.ftl";
	}

	@RequestMapping(value="/main")
	public String main(Model model){
		model.addAttribute("version", EyougoConstant.VERSION);
		model.addAttribute("serverInfo", ServerInfo.getInstance());
		return "admin/admin_index_main.ftl";
	}
	
	@Autowired
	@Required
	public void setBlogConfigBiz(BlogConfigBiz blogConfigBiz) {
		this.blogConfigBiz = blogConfigBiz;
	}
}
