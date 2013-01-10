package com.eyougo.blog.entity;

/**
 * Blog配置实体类，包含id（即配置名称）和configValue
 * @author MeiHongyuan
 *
 */
public class BlogConfig {
	private String id;
	private String configValue;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getConfigValue() {
		return configValue;
	}
	public void setConfigValue(String configValue) {
		this.configValue = configValue;
	}
	
	
}
