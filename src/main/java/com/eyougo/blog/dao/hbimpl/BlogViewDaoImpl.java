package com.eyougo.blog.dao.hbimpl;

import org.hibernate.SessionFactory;

import com.eyougo.blog.dao.BlogViewDao;
import com.eyougo.blog.entity.BlogView;

public class BlogViewDaoImpl implements BlogViewDao {
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	@Override
	public BlogView saveBlogView(BlogView blogView) {
		this.getSessionFactory().getCurrentSession().saveOrUpdate(blogView);
		return blogView;
	}
}
