package com.eyougo.blog.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="/admin/login")
public class AdminLoginController {
	@RequestMapping(value="/to")
	public String toLogin(){
		return "/admin/admin_login.ftl";
	}
	
	@RequestMapping(value="/do")
	public String doLogin(@RequestParam String adminPassword, HttpSession session){
		return "";
	}
}
