package com.eyougo.blog.biz;

import java.util.List;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Comment;

public interface CommentBiz {

	public abstract Comment saveComment(Comment comment) throws InternalException;

	public abstract Comment getCommentById(Integer commentId);

	public abstract List<Comment> getCommentsByBlog(Blog blog, Pager pager);

	public abstract List<Comment> getRecentComments(int recentNum);

	public abstract int deleteComments(List<String> commentIds) throws InternalException;

	public abstract boolean deleteCommentById(Integer commentId) throws InternalException;

}