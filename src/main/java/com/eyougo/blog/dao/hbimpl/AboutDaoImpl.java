package com.eyougo.blog.dao.hbimpl;

import java.util.List;

import org.hibernate.SessionFactory;

import com.eyougo.blog.dao.AboutDao;
import com.eyougo.blog.entity.About;
import com.eyougo.blog.entity.BlogConfig;

public class AboutDaoImpl implements AboutDao {
	private final static String LOAD_BASE="from About where baseRank>-1 order by baseRank asc";
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@SuppressWarnings("unchecked")
	public List<About> findBaseAbouts() {
		List<About> abouts = this.getSessionFactory().getCurrentSession()
			.createQuery(LOAD_BASE).setCacheable(true).setCacheRegion("aboutCache").list();
		return abouts;
	}

	public About findAboutById(String id) {
		About about = (About)this.getSessionFactory()
			.getCurrentSession().get(About.class, id);
		return about;
	}

	public About updateAbout(About about) {
		this.getSessionFactory().getCurrentSession().update(about);
		return about;
	}

	@Override
	public About saveAbout(About about) {
		this.getSessionFactory().getCurrentSession().saveOrUpdate(about);
		return about;
	}

	@Override
	public void deleteAbout(About about) {
		this.getSessionFactory().getCurrentSession().delete(about);
	}

}
