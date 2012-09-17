package com.eyougo.blog.biz.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.LinkBiz;
import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.comm.OrderProperty;
import com.eyougo.blog.comm.Pager;
import com.eyougo.blog.dao.LinkDao;
import com.eyougo.blog.entity.Link;

public class LinkBizImpl implements LinkBiz {
	private static final Log log = LogFactory.getLog(LinkBizImpl.class);
	private LinkDao linkDao;

	public Link saveLink(Link link) throws InternalException {
		try {
			link = this.getLinkDao().saveLink(link);
			return link;
		} catch (Exception e) {
			throw new InternalException(e);
		}
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.LinkBiz#getLinkById(java.lang.Integer)
	 */
	@Override
	public Link getLinkById(Integer linkId) {
		Link link = this.getLinkDao().findLinkById(linkId);
		return link;
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.LinkBiz#deleteLinkById(java.lang.Integer)
	 */
	@Override
	public boolean deleteLinkById(Integer linkId) throws InternalException {
		boolean deleteSuccess = false;
		try {
			Link link = this.getLinkById(linkId);
			if (link != null) {
				this.getLinkDao().deleteLink(link);
				deleteSuccess = true;
			}
			return deleteSuccess;
		} catch (Exception e) {
			throw new InternalException(e);
		}
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.LinkBiz#getAllLinkNum()
	 */
	@Override
	public long getAllLinkNum() {
		long l = this.getLinkDao().getAllLinkNum();
		log.info("Get all Link num = " + l);
		return l;
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.LinkBiz#getLinkList(com.eyougo.blog.comm.Pager)
	 */
	@Override
	public List<Link> getLinkList(Pager pager) {
		OrderProperty[] op = { new OrderProperty("emotion", EyougoConstant.ORDER_DESC) };
		if (pager == null) {
			pager = new Pager();
		}
		if (pager.getTotalNum() == -1) {
			pager.setTotalNum(this.getLinkDao().getAllLinkNum());
		}
		List<Link> links = this.getLinkDao().findLinkList(null, op, pager.getOffset(), pager.getPerPageNum());
		log.info("Get Link List Success");
		return links;
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.LinkBiz#getLinkListForMain(int)
	 */
	@Override
	public List<Link> getLinkListForMain(int recentNum) {
		OrderProperty[] op = { new OrderProperty("emotion", EyougoConstant.ORDER_DESC) };
		List<Link> links = this.getLinkDao().findLinkList(true, op, 0, recentNum);
		return links;
	}

	/* (non-Javadoc)
	 * @see com.eyougo.blog.biz.impl.LinkBiz#getAllLinkList()
	 */
	@Override
	public List<Link> getAllLinkList() {
		OrderProperty[] op = { new OrderProperty("emotion", EyougoConstant.ORDER_DESC) };
		List<Link> links = this.getLinkDao().findAllLinks(op);
		return links;
	}

	public LinkDao getLinkDao() {
		return linkDao;
	}

	public void setLinkDao(LinkDao linkDao) {
		this.linkDao = linkDao;
	}

}
