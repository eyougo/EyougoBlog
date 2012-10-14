package com.eyougo.blog.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/admin/index")
public class AdminIndexController {
	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public String get(){
		return "admin/admin_index.ftl";
	}
}
