package com.eyougo.blog.dao.hbimpl;

import java.util.List;

import org.hibernate.SessionFactory;

import com.eyougo.blog.dao.BlogConfigDao;
import com.eyougo.blog.entity.BlogConfig;

public class BlogConfigDaoImpl implements BlogConfigDao {
	private final static String LOAD_ALL="from BlogConfig";
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<BlogConfig> findAllBlogConfigs() {
		List<BlogConfig> blogConfigs = this.getSessionFactory().getCurrentSession()
			.createQuery(LOAD_ALL).list();
		return blogConfigs;
	}

	public BlogConfig findBlogConfigById(String id) {
		BlogConfig blogConfig = (BlogConfig)this.getSessionFactory()
			.getCurrentSession().get(BlogConfig.class, id);
		return blogConfig;
	}

	public BlogConfig updateBlogConfig(BlogConfig blogConfig) {
		this.getSessionFactory().getCurrentSession().update(blogConfig);
		return blogConfig;
	}

}
