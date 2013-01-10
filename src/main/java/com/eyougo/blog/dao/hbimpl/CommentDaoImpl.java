package com.eyougo.blog.dao.hbimpl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.dao.CommentDao;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Comment;

public class CommentDaoImpl implements CommentDao {
	private final static String LOAD_ALL_COUNT="select count(*) from Comment comment";

	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	public Comment findCommentById(Integer commentId) {
		Comment comment= (Comment)this.getSessionFactory().getCurrentSession()
		.get(Comment.class, commentId);
		return comment;
	}
	
	@SuppressWarnings("unchecked")
	public List<Comment> findCommentsByBlog(Blog blog, OrderProperty[] op,
			int firstResult, int maxResults) {
		Criteria c = this.getSessionFactory().getCurrentSession()
		.createCriteria(Comment.class);
		if (blog != null) {
			c.add(Restrictions.eq("blog", blog));
		}
		if (op != null && op.length > 0) {
			for (int i = 0; i < op.length; i++) {
				if (StringUtils.isNotBlank(op[i].getOrderBy())) {
					if (op[i].getAscOrDesc() == EyougoConstant.ORDER_ASC) {
						c.addOrder(Order.asc(op[i].getOrderBy()));
					}
					if (op[i].getAscOrDesc() == EyougoConstant.ORDER_DESC) {
						c.addOrder(Order.desc(op[i].getOrderBy()));
					}
				}
			}
		}
		c.setFirstResult(firstResult);
		c.setMaxResults(maxResults);
		return c.list();
	}

	public Comment saveComment(Comment comment) {
		this.getSessionFactory().getCurrentSession().saveOrUpdate(comment);
		this.getSessionFactory().getCurrentSession().flush();
		return comment;
	}

	@SuppressWarnings("unchecked")
	public long getCommentNumByBlog(Blog blog) {
		String hql=LOAD_ALL_COUNT;
		if(blog!=null){
			hql=hql+" where comment.blog=:blog";
		}
		List l = this.getSessionFactory().getCurrentSession()
			.createQuery(hql).setEntity("blog", blog).list();
		if (l == null || l.isEmpty()) {
			return 0;
		} else {
			return ((Long)l.get(0)).longValue();
		}
	}

	public void deleteComment(Comment comment) {
		this.getSessionFactory().getCurrentSession().delete(comment);
	}

}
