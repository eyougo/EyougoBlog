package com.eyougo.blog.web.controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eyougo.blog.biz.EyougoCounterBiz;

@Controller
@RequestMapping(value="/admin/counter")
public class AdminCounterController {
	private EyougoCounterBiz eyougoCounterBiz;
	
	@RequestMapping(value="/info")
	public String info(Model model){
		String counterInfo = eyougoCounterBiz.getCounterInfo();
		String[] counterInfos = StringUtils.split(counterInfo, ":");
		
		model.addAttribute("dayCount", counterInfos[0]);
		model.addAttribute("weekCount", counterInfos[1]);
		model.addAttribute("monthCount", counterInfos[2]);
		model.addAttribute("allCount", counterInfos[3]);
		
		return "admin/admin_counter_info.ftl";
	}

	@Autowired
	public void setCounterBiz(EyougoCounterBiz eyougoCounterBiz) {
		this.eyougoCounterBiz = eyougoCounterBiz;
	}
	
}
