package com.eyougo.blog.dao.hbimpl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.dao.BlogDao;
import com.eyougo.blog.entity.Blog;
import com.eyougo.blog.entity.Category;

public class BlogDaoImpl implements BlogDao {
	private final static String LOAD_ALL_COUNT="select count(*) from Blog blog";
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Blog findBlogById(Integer blogId) {
		Blog blog = (Blog)this.getSessionFactory().getCurrentSession()
			.get(Blog.class, blogId);
		return blog;
	}

	public List<Blog> findAllBlogList(final OrderProperty[] op,
			final int firstResult, final int maxResults) {
		List<Blog> list = this.findBlogListByCategory(null,op,firstResult, maxResults);
		return list;
	}

	public long getAllBlogNum() {
		return this.getBlogNumByCategory(null);
	}

	public Blog saveBlog(Blog blog) {
		this.getSessionFactory().getCurrentSession().saveOrUpdate(blog);
		return blog;
	}

	@SuppressWarnings("unchecked")
	public long getBlogNumByCategory(Category category) {
		String hql=LOAD_ALL_COUNT;
		if(category!=null){
			hql=hql+" where blog.category=:category";
		}
		List l = this.getSessionFactory().getCurrentSession()
			.createQuery(hql).setEntity("category", category).list();
		if (l == null || l.isEmpty()) {
			return 0;
		} else {
			return ((Long)l.get(0)).longValue();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Blog> findBlogListByCategory(final Category category,
			final OrderProperty[] op, int firstResult, int maxResults) {
		Criteria c = this.getSessionFactory().getCurrentSession()
				.createCriteria(Blog.class);
		if (category != null) {
			c.add(Restrictions.eq("category", category));
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

	public void deleteBlog(Blog blog) {
		this.getSessionFactory().getCurrentSession().delete(blog);
	}

	public List<Blog> findBlogListLikeBlog(Blog blog, OrderProperty[] op,
			int firstResult, int maxResults) {
		Criteria criteria = this.getSessionFactory().getCurrentSession().createCriteria(Blog.class);
		if(blog!=null){
			Example example = Example.create(blog).excludeNone().excludeZeroes();
			example.enableLike(MatchMode.ANYWHERE);
			criteria.add(example);
			if(blog.getCategory()!=null){
				criteria.add(Restrictions.eq("category", blog.getCategory()));
			}
		}
		
		if (op != null && op.length > 0) {
			for (int i = 0; i < op.length; i++) {
				if (StringUtils.isNotBlank(op[i].getOrderBy())) {
					if (op[i].getAscOrDesc() == EyougoConstant.ORDER_ASC) {
						criteria.addOrder(Order.asc(op[i].getOrderBy()));
					}
					if (op[i].getAscOrDesc() == EyougoConstant.ORDER_DESC) {
						criteria.addOrder(Order.desc(op[i].getOrderBy()));
					}
				}
			}
		}
		criteria.setFirstResult(firstResult);
		criteria.setMaxResults(maxResults);
		List<Blog> list = criteria.list();
		return list;
	}

	public long findBlogNumLikeBlog(Blog blog) {
		Criteria criteria = this.getSessionFactory().getCurrentSession().createCriteria(Blog.class);
		if(blog!=null){
			Example example = Example.create(blog).excludeNone().excludeZeroes();
			example.enableLike(MatchMode.ANYWHERE);
			criteria.add(example);
			if(blog.getCategory()!=null){
				criteria.add(Restrictions.eq("category", blog.getCategory()));
			}
		}
		
		criteria.setProjection(Projections.rowCount());
		return (Integer)criteria.uniqueResult();
	}
	
	public List findLikeBlogNumGroupByProperties(Blog blog,String[] propertyNames ){
		Criteria criteria = this.getSessionFactory().getCurrentSession().createCriteria(Blog.class);
		if(blog!=null){
			Example example = Example.create(blog).excludeNone().excludeZeroes();
			example.enableLike(MatchMode.ANYWHERE);
			criteria.add(example);
		}
		ProjectionList projectionList = Projections.projectionList();
		projectionList.add(Projections.count("id"));
		if (propertyNames!=null&&propertyNames.length>0) {
			for (int i = 0; i < propertyNames.length; i++) {
				projectionList.add( Projections.groupProperty(propertyNames[i]));
			}	
		}
		criteria=criteria.setProjection( projectionList ) ;
		List list = criteria.list();
		return list;
	}
	
	public Blog findBlogBeforeThisBlog(Blog blog,OrderProperty[] op){
		Criteria criteria = this.getSessionFactory().getCurrentSession().createCriteria(Blog.class);
		criteria.add(Restrictions.lt("date",blog.getDate()));
		criteria.add(Restrictions.eq("isDraft", false));
		if (op != null && op.length > 0) {
			for (int i = 0; i < op.length; i++) {
				if (StringUtils.isNotBlank(op[i].getOrderBy())) {
					if (op[i].getAscOrDesc() == EyougoConstant.ORDER_ASC) {
						criteria.addOrder(Order.asc(op[i].getOrderBy()));
					}
					if (op[i].getAscOrDesc() == EyougoConstant.ORDER_DESC) {
						criteria.addOrder(Order.desc(op[i].getOrderBy()));
					}
				}
			}
		}
		criteria.setFirstResult(0);
		criteria.setMaxResults(1);
		Blog aBlog = (Blog)criteria.uniqueResult();
		return aBlog;
	}
	
	public Blog findBlogAfterThisBlog(Blog blog,OrderProperty[] op){
		Criteria criteria = this.getSessionFactory().getCurrentSession().createCriteria(Blog.class);
		criteria.add(Restrictions.gt("date",blog.getDate()));
		criteria.add(Restrictions.eq("isDraft", false));
		if (op != null && op.length > 0) {
			for (int i = 0; i < op.length; i++) {
				if (StringUtils.isNotBlank(op[i].getOrderBy())) {
					if (op[i].getAscOrDesc() == EyougoConstant.ORDER_ASC) {
						criteria.addOrder(Order.asc(op[i].getOrderBy()));
					}
					if (op[i].getAscOrDesc() == EyougoConstant.ORDER_DESC) {
						criteria.addOrder(Order.desc(op[i].getOrderBy()));
					}
				}
			}
		}
		criteria.setFirstResult(0);
		criteria.setMaxResults(1);
		Blog aBlog = (Blog)criteria.uniqueResult();
		return aBlog;
	}
	
}
