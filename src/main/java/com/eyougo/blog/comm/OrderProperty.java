package com.eyougo.blog.comm;

import org.apache.commons.lang3.StringUtils;

public class OrderProperty {
	private String orderBy = "";

	public static final int ASC = 0;
	
	public static final int DESC = 1;
	
	private int ascOrDesc = DESC;
	
	public OrderProperty() {
	}

	public OrderProperty(String orderBy){
		this.orderBy = orderBy;
	}
	
	public OrderProperty(String orderBy, int ascOrDesc) {
		this.orderBy = orderBy;
		this.ascOrDesc = ascOrDesc;
	}
	
	public OrderProperty(String orderBy, String ascOrDesc) {
		this.orderBy = orderBy;
		this.ascOrDesc = StringUtils.equals(ascOrDesc, "asc")?ASC:DESC;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public void setAscOrDesc(int ascOrDesc) {
		this.ascOrDesc = ascOrDesc;
	}

	public String getOrderBy() {
		return orderBy;
	}

	public int getAscOrDesc() {
		return ascOrDesc;
	}

}
