package com.eyougo.blog.entity;

import java.util.Date;

public class Message {
	private Integer id;
	private String title;
	private String content;
	private Date messageDate;
	private Contact contact;

	public Message() {
		super();
	}
	public Message(String title, String content, Date messageDate) {
		super();
		this.title = title;
		this.content = content;
		this.messageDate = messageDate;
	}
	
	public Date getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Contact getContact() {
		return contact;
	}
	public void setContact(Contact contact) {
		this.contact = contact;
	}
}
