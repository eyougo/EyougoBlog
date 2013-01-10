package com.eyougo.blog.dao;

import java.util.List;

import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.entity.Link;

/**
 * 友情链接持久层
 * @author Mei
 *
 */
public interface LinkDao {
	/**
	 * 保存链接
	 * @param link
	 * @return
	 */
	Link saveLink(Link link);
	
	Link findLinkById(Integer linkId);
	
	void deleteLink(Link link);
	
	long getAllLinkNum();
	
	List<Link> findAllLinks(OrderProperty[] op);
	
	List<Link> findLinkList(Boolean show, OrderProperty[] op,
			int firstResult, int maxResults);
}
