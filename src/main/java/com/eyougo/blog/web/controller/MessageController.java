package com.eyougo.blog.web.controller;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.MessageBiz;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.entity.Message;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/message")
public class MessageController extends BaseController{
	private static final Log LOG = LogFactory.getLog(MessageController.class);
	
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
	

	@RequestMapping(value="/add")
	public String add(Message message, @RequestParam(required=false) String replyTo, @RequestParam String captcha, HttpSession session, Model model){
		try{
			if (this.validateCaptcha(session, captcha)) {
				if (StringUtils.isNotEmpty(replyTo)) {
					String reply = "REPLY TO "+ replyTo + ": <br>" + message.getContent();
					message.setContent(reply);
				}
				message.setMessageDate(new Date());
				messageBiz.saveMessage(message);
			}
		} catch (InternalException e) {
			LOG.error(e.getMessage(), e);
		}
		return "redirect:/message/list/1";
	}
	
	@Autowired
	@Required
	public void setMessageBiz(MessageBiz messageBiz) {
		this.messageBiz = messageBiz;
	}
	
}
