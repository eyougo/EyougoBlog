package com.eyougo.blog.biz;

import java.util.List;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.entity.Link;

public interface LinkBiz {

	Link getLinkById(Integer linkId);

    Link saveLink(Link link) throws InternalException;

	boolean deleteLinkById(Integer linkId) throws InternalException;

	long getAllLinkNum();

	/**
	 * @param pager
	 * @return
	 */
	List<Link> getLinkList(Pager pager);

	List<Link> getLinkListForMain(int recentNum);

	List<Link> getAllLinkList();

}