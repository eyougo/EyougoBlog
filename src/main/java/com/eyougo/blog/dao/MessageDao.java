package com.eyougo.blog.dao;

import java.util.List;

import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.entity.Message;
/**
 * 留言持久层
 * @author Mei
 *
 */
public interface MessageDao {
	/**
	 * 根据ID查找留言
	 * @param messageId
	 * @return Message
	 */
	Message findMessageById(Integer messageId);
	/**
	 * 保存留言
	 * @param message
	 * @return Message
	 */
	Message saveMessage(Message message);
	/**
	 * 删除留言
	 * @param message
	 */
	void deleteMessage(Message message);
	/**
	 * 获得所有留言数量
	 * @return long
	 */
	long getAllMessageNum();
	/**
	 * 根据排序和分页条件查询留言列表
	 * @param op
	 * @param firstResult
	 * @param maxResults
	 * @return List<Message>
	 */
	List<Message> findMessageList(OrderProperty[] op,
			int firstResult, int maxResults);
	/**
	 * 获得所有留言列表（暂未实现）
	 * @return
	 */
	List<Message> findAllMessages();
}
