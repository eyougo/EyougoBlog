package com.eyougo.blog.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		String uri = request.getRequestURI();
		String redirectLocation = request.getContextPath()+"/admin/login";
        if (StringUtils.equalsIgnoreCase(uri, redirectLocation)) {
            return true;
        }
        HttpSession session = request.getSession();
        Object object = session.getAttribute("admin");
        if (object == null) {
            response.sendRedirect(redirectLocation);
        }
        return true;
    }


}
