package com.eyougo.blog.entity;

import java.util.Date;

public class Comment {
	private Integer id;
	private String content;
	private Contact contact;
	private Date commentDate;
	private Comment quotedComment;
	private Blog blog;
	
	public Comment() {
		super();
	}
	public Comment(String content, Contact contact, Date commentDate, Comment quotedComment) {
		super();
		this.content = content;
		this.contact = contact;
		this.commentDate = commentDate;
		this.quotedComment = quotedComment;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public Blog getBlog() {
		return blog;
	}
	public void setBlog(Blog blog) {
		this.blog = blog;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public Comment getQuotedComment() {
		return quotedComment;
	}
	public void setQuotedComment(Comment quotedComment) {
		this.quotedComment = quotedComment;
	}
}
