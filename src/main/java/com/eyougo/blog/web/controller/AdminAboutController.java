package com.eyougo.blog.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.AboutBiz;
import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.entity.About;
import com.eyougo.blog.entity.BlogConfig;

@Controller
@RequestMapping(value="/admin/about")
public class AdminAboutController {
	private static final Log LOG = LogFactory.getLog(AdminAboutController.class); 
	private AboutBiz aboutBiz;
	@RequestMapping(method = RequestMethod.GET)
	public String get(Model model){
		List<About> baseAbouts = aboutBiz.getBaseAbouts();
		for (int i = 0; i < baseAbouts.size(); i++) {
			About baseAbout = baseAbouts.get(i);
			model.addAttribute("baseId"+i, baseAbout.getId());
			model.addAttribute("baseAboutValue"+i, baseAbout.getAboutValue());
		}
		model.addAttribute(EyougoConstant.ABOUT_ID_GRAVATAR, aboutBiz.getAboutValue(EyougoConstant.ABOUT_ID_GRAVATAR));
		model.addAttribute(EyougoConstant.ABOUT_ID_ME, aboutBiz.getAboutValue(EyougoConstant.ABOUT_ID_ME));
		model.addAttribute(EyougoConstant.ABOUT_ID_SITE, aboutBiz.getAboutValue(EyougoConstant.ABOUT_ID_SITE));
		
		return "/admin/admin_about.ftl";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String post(@RequestParam String aboutGavatar, @RequestParam String aboutMe, 
			@RequestParam String aboutSite, HttpServletRequest request){
		List<About> aboutList = new ArrayList<About>();
		aboutList.add(About.extraAbout(EyougoConstant.ABOUT_ID_GRAVATAR, aboutGavatar));
		aboutList.add(About.extraAbout(EyougoConstant.ABOUT_ID_ME, aboutMe));
		aboutList.add(About.extraAbout(EyougoConstant.ABOUT_ID_SITE, aboutSite));
		
		for (int i = 0; i < 6; i++) {
			String baseId = request.getParameter("baseId"+i);
			String baseAboutValue = request.getParameter("baseAboutValue"+i);
			if (StringUtils.isNotEmpty(baseId)) {
				aboutList.add(About.baseAbout(baseId, baseAboutValue, i));
			}
		}
		try {
			aboutBiz.saveAbouts(aboutList);
		} catch (InternalException e) {
			LOG.error("save abouts error", e);
		}
		return "redirect:/admin/about";
	}

	@Autowired
	@Required
	public void setAboutBiz(AboutBiz aboutBiz) {
		this.aboutBiz = aboutBiz;
	}
	
	
}
