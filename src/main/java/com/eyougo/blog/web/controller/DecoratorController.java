package com.eyougo.blog.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DecoratorController {
	@RequestMapping(value="/frame")
	public String frame(){
		return "/decorators/frame.ftl";
	}
}
