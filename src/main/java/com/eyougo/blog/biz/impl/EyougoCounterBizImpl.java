package com.eyougo.blog.biz.impl;

import org.apache.commons.lang3.BooleanUtils;

import com.eyougo.blog.biz.CounterBiz;
import com.eyougo.blog.biz.EyougoCounterBiz;

public class EyougoCounterBizImpl implements EyougoCounterBiz {
	private CounterBiz counterBiz;
	private String username;
	private String password;
	private String counterSwitch;
	
	public void setCounterBiz(CounterBiz counterBiz) {
		this.counterBiz = counterBiz;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setCounterSwitch(String counterSwitch) {
		this.counterSwitch = counterSwitch;
	}

	@Override
	public boolean counter() {
		return counterBiz.counter(username, password);
	}

	@Override
	public String getCounterInfo() {
		if (!BooleanUtils.toBoolean(counterSwitch)){
			return "0:0:0:0:";
		}
		return counterBiz.getCounterInfo(username, password);
	}

}
