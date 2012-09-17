package com.eyougo.blog.biz;

import java.util.List;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.entity.Message;

public interface MessageBiz {

	Message saveMessage(Message message) throws InternalException;

	long getAllMessageNum();

	List<Message> getMessageList(Pager pager) throws InternalException;

	boolean deleteMessageById(Integer messageId) throws InternalException;

	List<Message> getRecentMessages(int recentNum);

}