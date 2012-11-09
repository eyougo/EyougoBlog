package com.eyougo.blog.entity;

import java.util.Date;
import java.util.Set;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 日志类
 * @author MeiHongyuan
 *
 */
public class Blog {
	private Integer id;
	private String title;
	private String content;
	private String summary;
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss") 
	private Date date;	//发表时间
	private Integer bit;	//点击数
	private Integer commentsNum;//评论数
	private Integer top;//是否置顶，值越大越靠前
	private Integer emotion;//表情	
	private Boolean isDraft = false;//是否草稿
	private Category category;	//分类
	//下个版本实现日志标签
	private Integer cmtUser;	//可发表评论的角色，0为游客，1为用户，-1为不能评论
	private Boolean copyright = false;//是否包含版权声明
	private Set<Comment> comments;	//评论集合
	
	public Blog() {
		super();
	}
	
	public Blog(String title, String content,String summary, Date date, Category category) {
		super();
		this.title = title;
		this.content = content;
		this.summary = summary;
		this.date = date;
		this.category = category;
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

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	
	public void addComment(Comment comment){
		this.comments.add(comment);
		comment.setBlog(this);
	}
	
	public void removeComment(Comment comment){
		this.comments.remove(comment);
		comment.setBlog(null);
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public Integer getBit() {
		return bit;
	}

	public void setBit(Integer bit) {
		this.bit = bit;
	}

	public Integer getEmotion() {
		return emotion;
	}

	public void setEmotion(Integer emotion) {
		this.emotion = emotion;
	}

	public Integer getCmtUser() {
		return cmtUser;
	}

	public void setCmtUser(Integer cmtUser) {
		this.cmtUser = cmtUser;
	}

	public Integer getTop() {
		return top;
	}

	public void setTop(Integer top) {
		this.top = top;
	}

	public Boolean getIsDraft() {
		return isDraft;
	}

	public void setIsDraft(Boolean isDraft) {
		this.isDraft = isDraft;
	}

	public Boolean getCopyright() {
		return copyright;
	}

	public void setCopyright(Boolean copyright) {
		this.copyright = copyright;
	}

	public Integer getCommentsNum() {
		return commentsNum;
	}

	public void setCommentsNum(Integer commentsNum) {
		this.commentsNum = commentsNum;
	}
	
}
