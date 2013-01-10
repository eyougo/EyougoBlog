package com.eyougo.blog.entity;
/**
 * 友情链接实体类
 * @author Mei
 *
 */
public class Link {
	private Integer id;
	private String linkname;
	private String linkurl;
	private String linklogo;
	private Boolean show;//是否在主页显示
	private Integer emotion;//置顶顺序，值越大越靠前，默认为0
	
	public Link() {
		super();
	}
	public Link(String linkname, String linkurl, String linklogo,
			Integer emotion) {
		super();
		this.linkname = linkname;
		this.linkurl = linkurl;
		this.linklogo = linklogo;
		this.emotion = emotion;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLinkname() {
		return linkname;
	}
	public void setLinkname(String linkname) {
		this.linkname = linkname;
	}
	public String getLinkurl() {
		return linkurl;
	}
	public void setLinkurl(String linkurl) {
		this.linkurl = linkurl;
	}
	public String getLinklogo() {
		return linklogo;
	}
	public void setLinklogo(String linklogo) {
		this.linklogo = linklogo;
	}
	public Boolean getShow() {
		return show;
	}
	public void setShow(Boolean show) {
		this.show = show;
	}
	public Integer getEmotion() {
		return emotion;
	}
	public void setEmotion(Integer emotion) {
		this.emotion = emotion;
	}
}
