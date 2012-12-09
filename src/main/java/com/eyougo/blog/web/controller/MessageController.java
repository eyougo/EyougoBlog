package com.eyougo.blog.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.eyougo.blog.biz.MessageBiz;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.entity.Message;

@Controller
@RequestMapping("/message")
public class MessageController {
	private MessageBiz messageBiz;
	@RequestMapping(value="/list/{page}")
	public String list(@PathVariable Integer page, Model model){
		Pager pager = new Pager();
		pager.setPage(page);
		List<Message> messageList = messageBiz.getMessageList(pager);
		model.addAttribute("messageList", messageList);
		model.addAttribute("pager", pager);
		return "/message_list.ftl";
	}
	@Autowired
	@Required
	public void setMessageBiz(MessageBiz messageBiz) {
		this.messageBiz = messageBiz;
	}
	
}
