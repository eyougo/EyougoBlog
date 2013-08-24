package com.eyougo.blog.web.controller;

import com.eyougo.blog.biz.AboutBiz;
import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.entity.About;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/about")
public class AboutController {
	private AboutBiz aboutBiz;
	@RequestMapping(method=RequestMethod.GET)
	public String get(Model model){
		List<About> baseAbouts = aboutBiz.getBaseAbouts();
		model.addAttribute("baseAbouts", baseAbouts);
		model.addAttribute("gravatar", aboutBiz.getGravatarUrl());
		model.addAttribute(EyougoConstant.ABOUT_ID_ME, aboutBiz.getAboutValue(EyougoConstant.ABOUT_ID_ME));
		model.addAttribute(EyougoConstant.ABOUT_ID_SITE, aboutBiz.getAboutValue(EyougoConstant.ABOUT_ID_SITE));
		
		return "about.ftl";
	}
	
	@Autowired
	public void setAboutBiz(AboutBiz aboutBiz) {
		this.aboutBiz = aboutBiz;
	}
	
}
