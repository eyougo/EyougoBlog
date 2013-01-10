package com.eyougo.blog.entity;

/**
 * 联系方式类，与用户类分开，方便单独管理
 * @author Mei
 */
public class Contact {
	private String nickname; //昵称
	private String email;	//email
	private String qq;	//qq
	private String msn;	//msn
	private String homepage; //主页
	public Contact() {
		super();
	}
	public Contact(String nickname, String email, String qq, String msn,String homepage) {
		super();
		this.nickname = nickname;
		this.email = email;
		this.qq = qq;
		this.msn = msn;
		this.homepage = homepage;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getMsn() {
		return msn;
	}
	public void setMsn(String msn) {
		this.msn = msn;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	
}
