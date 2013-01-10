package com.eyougo.blog.dao.hbimpl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;

import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.dao.MessageDao;
import com.eyougo.blog.entity.Message;

public class MessageDaoImpl implements MessageDao {

	public final static String LOAD_ALL_COUNT = "select count(*) from Message message";
	
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Message> findAllMessages() {
		// TODO Auto-generated method stub
		return null;
	}

	public Message findMessageById(Integer messageId) {
		Message message = (Message)this.getSessionFactory().getCurrentSession().get(Message.class, messageId);
		return message;
	}

	public List<Message> findMessageList(OrderProperty[] op,
			final int firstResult, final int maxResults) {
		Criteria criteria = this.getSessionFactory().getCurrentSession()
			.createCriteria(Message.class);
		//���Ӧ�ó����һ������
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
		List<Message> list = criteria.list();
		return list;
	}

	public Message saveMessage(Message message) {
		this.getSessionFactory().getCurrentSession().saveOrUpdate(message);
		return message;
	}

	
	public void deleteMessage(Message message) {
		this.getSessionFactory().getCurrentSession().delete(message);
	}

	@SuppressWarnings("unchecked")
	public long getAllMessageNum() {
		List l = this.getSessionFactory().getCurrentSession()
			.createQuery(LOAD_ALL_COUNT).list();
		if (l==null ||l.isEmpty()) {
			return 0;
		} else {
			return ((Long)l.get(0)).longValue();
		}
	}
	
}
