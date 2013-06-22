package com.eyougo.blog.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.eyougo.blog.biz.EyougoCounterBiz;
import com.eyougo.blog.comm.EyougoConstant;

public class CounterInterceptor extends HandlerInterceptorAdapter{
	private EyougoCounterBiz eyougoCounterBiz;
	private String counterSwitch;
	
	public void setEyougoCounterBiz(EyougoCounterBiz eyougoCounterBiz) {
		this.eyougoCounterBiz = eyougoCounterBiz;
	}

	public String getCounterSwitch() {
		return counterSwitch;
	}

	public void setCounterSwitch(String counterSwitch) {
		this.counterSwitch = counterSwitch;
	}

	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		if (StringUtils.equalsIgnoreCase("on", counterSwitch)) {
			HttpSession session = request.getSession();
			//从session中获取counter属性		
			Object counter_key= session.getAttribute(EyougoConstant.COUNTER_KEY);
			//如果session中没有counter属性
			if (counter_key == null) {
				eyougoCounterBiz.counter();
				//为了方便，上面这里将使用的计数器用户名和密码硬编码了，其实可以采用spring的配置将这两个字符串值注入进来。
				session.setAttribute(EyougoConstant.COUNTER_KEY, "counter_key");
			} 
		}
	}


}
