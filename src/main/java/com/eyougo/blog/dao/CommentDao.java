package com.eyougo.blog.dao;

import java.util.List;

import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Comment;

/**
 * 评论持久层
 * @author MeiHongyuan
 *
 */
public interface CommentDao {
	
	/**
	 * 根据id查找评论
	 * @param id
	 * 				Integer	
	 * @return Comment
	 */
	Comment findCommentById(Integer commentId);
	
	/**
	 * 保存评论
	 * @param comment
	 * 				Comment
	 * @return Comment
	 */
	Comment saveComment(Comment comment);
	
	/**
	 * 按照排序条件和分页查找某个日志下的评论
	 * @param blog
	 * 				Blog
	 * @param op
	 * 				OrderProperty[]
	 * @param firstResult
	 * 				int
	 * @param maxResults
	 * 				int
	 * @return List<Comment>
	 */
	List<Comment> findCommentsByBlog(Blog blog,OrderProperty[] op,
			int firstResult, int maxResults);
	
	/**
	 * 查找某个日志下评论的数量
	 * @param blog
	 * 				Blog
	 * @return long
	 */
	long getCommentNumByBlog(Blog blog);
	
	/**
	 * 删除某个评论
	 * @param comment
	 * 				Comment
	 */
	void deleteComment(Comment comment);
}
