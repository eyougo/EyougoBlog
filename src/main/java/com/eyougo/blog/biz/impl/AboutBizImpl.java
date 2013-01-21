package com.eyougo.blog.biz.impl;

import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.eyougo.blog.base.exception.InternalException;
import com.eyougo.blog.biz.AboutBiz;
import com.eyougo.blog.comm.EyougoConstant;
import com.eyougo.blog.dao.AboutDao;
import com.eyougo.blog.entity.About;
import com.timgroup.jgravatar.Gravatar;
import com.timgroup.jgravatar.GravatarDefaultImage;
import com.timgroup.jgravatar.GravatarRating;

public class AboutBizImpl implements AboutBiz {
	private AboutDao aboutDao;
	@Override
	public List<About> getBaseAbouts() {
		return aboutDao.findBaseAbouts();
	}

	@Override
	public String getAboutValue(String id) {
		About about = aboutDao.findAboutById(id);
		if (about != null) {
			return StringUtils.trimToEmpty(about.getAboutValue());
		}else {
			return "";
		}
	}

	@Override
	public String getGravatarUrl() {
		String gravatarUser = this.getAboutValue(EyougoConstant.ABOUT_ID_GRAVATAR);
		Gravatar gravatar = new Gravatar().setSize(200).setRating(GravatarRating.GENERAL_AUDIENCES)
				.setDefaultImage(GravatarDefaultImage.IDENTICON);
		String url = gravatar.getUrl(gravatarUser);
		return url;
	}

	@Override
	public void saveAbouts(List<About> aboutList) throws InternalException {
		try {
			List<About> baseAbouts = this.aboutDao.findBaseAbouts();
			Iterator<About> it = aboutList.iterator();
			while (it.hasNext()) {
				About about =  it.next();
				if (about != null) {
					if (about.getBaseRank() > -1) {//baseinfo
						About originAbout = null;
						for (About origin : baseAbouts) {
							if (origin.getBaseRank().equals(about.getBaseRank())) {
								originAbout = origin;
								break;
							}
						}
						if (originAbout == null) {
							this.aboutDao.saveAbout(about);
						}else {
							if (StringUtils.equals(originAbout.getId(), about.getId()) 
									&& !StringUtils.equals(originAbout.getAboutValue(), about.getAboutValue())) {
								originAbout.setAboutValue(about.getAboutValue());
								this.aboutDao.updateAbout(originAbout);
							}else if (!StringUtils.equals(originAbout.getId(), about.getId())) {
								this.aboutDao.deleteAbout(originAbout);
								this.aboutDao.saveAbout(about);
							}
						}
					}else {
						About originAbout = aboutDao.findAboutById(about.getId());
						if (originAbout == null) {
							this.aboutDao.saveAbout(about);
						}else {
							if (!StringUtils.equals(originAbout.getAboutValue(), about.getAboutValue())) {
								originAbout.setAboutValue(about.getAboutValue());
								this.aboutDao.updateAbout(originAbout);
							}
						}
					}
				}	
			}
		}catch(Exception e){
			throw new InternalException(e.getMessage(), e);
		}

	}

	public void setAboutDao(AboutDao aboutDao) {
		this.aboutDao = aboutDao;
	}

}
