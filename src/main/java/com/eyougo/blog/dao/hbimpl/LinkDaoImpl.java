package com.eyougo.blog.dao.hbimpl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Expression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.dao.LinkDao;
import com.eyougo.blog.entity.Link;

public class LinkDaoImpl implements LinkDao {
	private final static String LOAD_ALL_COUNT="select count(*) from Link link";
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	public void deleteLink(Link link) {
		this.getSessionFactory().getCurrentSession().delete(link);
	}

	public Link findLinkById(Integer linkId) {
		Link link = (Link)this.getSessionFactory().getCurrentSession().get(Link.class, linkId);
		return link;
	}

	public Link saveLink(Link link) {
		this.getSessionFactory().getCurrentSession().saveOrUpdate(link);
		return link;
	}

	public long getAllLinkNum() {
		List l = this.getSessionFactory().getCurrentSession()
			.createQuery(LOAD_ALL_COUNT).list();
		if (l==null ||l.isEmpty()) {
			return 0;
		} else {
			return ((Long)l.get(0)).longValue();
		}
	}

	public List<Link> findAllLinks(OrderProperty[] op){
		Criteria criteria = this.getSessionFactory().getCurrentSession()
			.createCriteria(Link.class);
		if(op != null && op.length>0){
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
		List<Link> list = criteria.list();
		return list;
	}
	
	public List<Link> findLinkList(Boolean show, OrderProperty[] op, int firstResult,
			int maxResults) {
		Criteria criteria = this.getSessionFactory().getCurrentSession()
		.createCriteria(Link.class);
		if(show != null){
			criteria.add(Restrictions.eq("show", show));
		}
		//这段应该抽出来一个方法
		criteria.setFirstResult(firstResult);
		criteria.setMaxResults(maxResults);
		if(op != null && op.length>0){
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
        criteria.setCacheable(true);
        criteria.setCacheRegion("linkCache");
		List<Link> list = criteria.list();
		return list;
	}
}
