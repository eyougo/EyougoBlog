package com.eyougo.blog.comm;

/**
 * 分页信息封装
 * 
 * @author MeiHongyuan
 * 
 */
public class Pager {
	int page = 1; // 页号

	long totalNum = -1; // 记录总数

	int perPageNum = 6; // 每页显示记录数

	public Pager() {
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public long getTotalNum() {
		return totalNum;
	}

	public void setTotalNum(long totalNum) {
		this.totalNum = totalNum;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public int getAllPage() {
		int allPage = 0;
		if (totalNum != 0 && totalNum % perPageNum == 0) {
			allPage = (int)(totalNum / perPageNum);
		} else {
			allPage = (int)(totalNum / perPageNum) + 1;
		}
		return allPage;
	}

	public int getOffset() {
        return (page - 1) * perPageNum;
    }
	
    public boolean hasPrePage() {
        return page == 1 ? false : true;
    }
    
    public boolean hasNextPage() {
    	int allPage = 0;
		if (totalNum != 0 && totalNum % perPageNum == 0) {
			allPage = (int)(totalNum / perPageNum);
		} else {
			allPage = (int)(totalNum / perPageNum) + 1;
		}
        return page == allPage || allPage == 0 ? false : true;
    }

}
