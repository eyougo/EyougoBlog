package com.eyougo.blog.web.controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import com.eyougo.blog.comm.EyougoConstant;

public class BaseController {
	 /**
     * Validate the captcha response
     */
    protected boolean validateCaptcha(HttpSession session, String captcha){
    	String kaptcha = (String)session.getAttribute(EyougoConstant.KAPTCHA_SESSION_KEY);
      
		if (StringUtils.equalsIgnoreCase(kaptcha, captcha)) {
            return true; 
        }else {
			return false;
		}
    }
}
