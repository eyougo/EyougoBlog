package com.eyougo.blog.biz.impl;

import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.dao.BlogDao;
import com.eyougo.blog.dao.CommentDao;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Comment;

public class CommentBizImpl {
	private static final Log log = LogFactory.getLog(CommentBizImpl.class);
	private CommentDao commentDao;
	private BlogDao blogDao;
	
	public Comment saveComment(Comment comment) throws InternalException{
		try{
			comment = commentDao.saveComment(comment);
			Blog blog = blogDao.findBlogById(comment.getBlog().getId());
			Integer num = blog.getCommentsNum();
			blog.setCommentsNum(num+1);
			return comment;
		}catch(Exception e) {
			throw new InternalException(e);
		}	
	}
	
	public Comment getCommentById(Integer commentId){
			Comment comment = this.getCommentDao().findCommentById(commentId);
			return comment;
	}
	
	public List<Comment> getCommentsByBlog(Blog blog,Pager pager) {
			if (pager.getTotalNum() == -1) {
				pager.setTotalNum(this.getCommentDao().getCommentNumByBlog(blog));
			}
			List<Comment> comments = this.getCommentDao().findCommentsByBlog(blog, null, pager.getOffset(), pager.getPerPageNum());
			return comments;
	}
	
	public List<Comment> getRecentComments(int recentNum){
			OrderProperty[] op = {new OrderProperty("commentDate",EyougoConstant.ORDER_DESC)};
			List<Comment> comments = this.getCommentDao().findCommentsByBlog(null, op, 0, recentNum);
			return comments;
	}
	
	public int deleteComments(List<String> commentIds) throws InternalException{
		int sucNum = 0;
		try {
			for (Iterator<String> iterator = commentIds.iterator(); iterator.hasNext();) {
				String commentIdStr = iterator.next();
				Integer commentId = null;
				if (!commentIdStr.equals("false")) {
					commentId = Integer.parseInt(commentIdStr);
				}	
				boolean suc = this.deleteCommentById(commentId);
				if(suc){
					sucNum ++;
				}
			}
			return sucNum;
		} catch (Exception e) {
			throw new InternalException(e);
		}	
	}
	
	public boolean deleteCommentById(Integer commentId) throws InternalException{
		boolean deleteSuccess = false;
		try{
			Comment comment= this.getCommentDao().findCommentById(commentId);
			if(comment!=null){
				this.getCommentDao().deleteComment(comment);
				Integer num = comment.getBlog().getCommentsNum();
				comment.getBlog().setCommentsNum(num-1);
				deleteSuccess = true;
			}
			return deleteSuccess;
		}catch(Exception e) {
			throw new InternalException(e);
		}	
	}
	
	public Comment updateCommentForReply(Integer commentId,String reply) throws InternalException{
		try{
			Comment comment= this.getCommentDao().findCommentById(commentId);
			if(comment!=null){
				StringBuffer contentSb = new StringBuffer(comment.getContent());
				contentSb = contentSb.append("<h3>ADMIN Reply:").append(reply).append("</h3>");
				comment.setContent(contentSb.toString());
			}
			return comment;
		}catch(Exception e) {
			throw new InternalException(e);
		}	
	}
	
	public CommentDao getCommentDao() {
		return commentDao;
	}

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	public BlogDao getBlogDao() {
		return blogDao;
	}

	public void setBlogDao(BlogDao blogDao) {
		this.blogDao = blogDao;
	}
	
}
