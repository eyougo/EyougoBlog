package com.eyougo.blog.web.controller;

import com.eyougo.blog.comm.EyougoConstant;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpSession;

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
