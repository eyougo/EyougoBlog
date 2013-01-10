package com.eyougo.blog.biz.impl;

import com.eyougo.blog.biz.CounterBiz;
import com.eyougo.blog.biz.EyougoCounterBiz;

public class EyougoCounterBizImpl implements EyougoCounterBiz {
	private CounterBiz counterBiz;
	private String username;
	private String password;
	
	public void setCounterBiz(CounterBiz counterBiz) {
		this.counterBiz = counterBiz;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public boolean counter() {
		return counterBiz.counter(username, password);
	}

	@Override
	public String getCounterInfo() {

		return counterBiz.getCounterInfo(username, password);
	}

}
