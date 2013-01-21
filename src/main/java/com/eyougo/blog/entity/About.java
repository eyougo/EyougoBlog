package com.eyougo.blog.entity;
/**
 * 关于
 * @author Mei
 *
 */
public class About {
	private String id;
	private String aboutValue;
	private Integer baseRank;
	
	public About() {
		super();
	}
	
	public About(String id, String aboutValue, Integer baseRank) {
		super();
		this.id = id;
		this.aboutValue = aboutValue;
		this.baseRank = baseRank;
	}
	public static About baseAbout(String id, String aboutValue, Integer baseRank) {
		return new About(id, aboutValue, baseRank);
	}
	public static About extraAbout(String id, String aboutValue){
		return new About(id, aboutValue, -1);
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAboutValue() {
		return aboutValue;
	}
	public void setAboutValue(String aboutValue) {
		this.aboutValue = aboutValue;
	}
	public Integer getBaseRank() {
		return baseRank;
	}
	public void setBaseRank(Integer baseRank) {
		this.baseRank = baseRank;
	}
	
}
