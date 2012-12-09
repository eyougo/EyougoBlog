package com.eyougo.blog.biz.impl;

import java.util.List;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.MessageBiz;
import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.dao.MessageDao;
import com.eyougo.blog.entity.Message;

public class MessageBizImpl implements MessageBiz {
	private MessageDao messageDao;

	public MessageDao getMessageDao() {
		return messageDao;
	}

	public void setMessageDao(MessageDao messageDao) {
		this.messageDao = messageDao;
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.MessageBiz#saveMessage(com.eyougo.blog.entity.Message)
	 */
	@Override
	public Message saveMessage(Message message) throws InternalException {
		try {
			this.getMessageDao().saveMessage(message);
			return message;
		} catch (Exception e) {
			throw new InternalException(e);
		}
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.MessageBiz#getAllMessageNum()
	 */
	@Override
	public long getAllMessageNum() {
		long l = this.getMessageDao().getAllMessageNum();
		return l;
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.MessageBiz#getMessageList(com.eyougo.blog.comm.Pager)
	 */
	@Override
	public List<Message> getMessageList(Pager pager) {
		OrderProperty[] op = { new OrderProperty("messageDate", EyougoConstant.ORDER_DESC) };
		// 设置分页总数
		if (pager == null) {
			pager = new Pager();
		}
		if (pager.getTotalNum() == -1) {
			pager.setTotalNum(this.getMessageDao().getAllMessageNum());
		}
		List<Message> messages = this.getMessageDao().findMessageList(op, pager.getOffset(), pager.getPerPageNum());
		return messages;
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.MessageBiz#deleteMessageById(java.lang.Integer)
	 */
	@Override
	public boolean deleteMessageById(Integer messageId) throws InternalException {
		boolean deleteSuccess = false;
		try {
			Message message = this.getMessageDao().findMessageById(messageId);
			if (message != null) {
				this.getMessageDao().deleteMessage(message);
				deleteSuccess = true;
			}
			return deleteSuccess;
		} catch (Exception e) {
			throw new InternalException(e);
		}
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.MessageBiz#getRecentMessages(int)
	 */
	@Override
	public List<Message> getRecentMessages(int recentNum) {
		OrderProperty[] op = { new OrderProperty("messageDate", EyougoConstant.ORDER_DESC) };
		List<Message> messageList = this.getMessageDao().findMessageList(op, 0, 5);
		return messageList;
	}
}
