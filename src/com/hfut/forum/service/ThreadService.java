package com.hfut.forum.service;

import java.util.List;


import com.hfut.forum.dao.ThreadDao;
import com.hfut.forum.domain.Thread;
import com.hfut.forum.utils.PageBean;


public class ThreadService{
	//注入dao
	private ThreadDao threadDao;
	public void setThreadDao(ThreadDao threadDao) {
		this.threadDao = threadDao;
	}
	
	public List<Thread> findTop() {
		return threadDao.findTop();
	}

	public List<Thread> findNew() {
		return threadDao.findNew();
	}

	public PageBean<Thread> findByPageUid(Integer uid, int page) {
		PageBean<Thread> pageBean=new PageBean<Thread>();
		pageBean.setPage(page);
		int limit = 10;
		pageBean.setLimit(limit);
		int totalCount = 0;
		totalCount=threadDao.findCountUid(uid);
		pageBean.setTotalCount(totalCount);
		int begin = (page - 1) * limit;
		List<Thread> list=threadDao.findByPageUid(uid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public Thread findByTid(Integer tid) {
		return threadDao.findByTid(tid);
	}

	public void delete(Thread thread) {
		threadDao.delete(thread);
	}

	public void update(Thread thread) {
		threadDao.update(thread);
	}

	public PageBean<Thread> findByPageCid(Integer cid, int page, int totalCount) {
		PageBean<Thread> pageBean=new PageBean<Thread>();
		pageBean.setPage(page);
		int limit = 20;
		pageBean.setLimit(limit);
		pageBean.setTotalCount(totalCount);
		int begin = (page - 1) * limit;
		List<Thread> list=threadDao.findByPageCid(cid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public List<Thread> findByCidTop(Integer cid) {
		return threadDao.findByCidTop(cid);
	}

	public void save(Thread thread) {
		threadDao.save(thread);
	}

	public PageBean<Thread> search(String searchValue, int page) {
		PageBean<Thread> pageBean=new PageBean<Thread>();
		pageBean.setPage(page);
		int limit = 20;
		pageBean.setLimit(limit);
		int totalCount = 0;
		totalCount=threadDao.searchCount(searchValue);
		pageBean.setTotalCount(totalCount);
		int begin = (page - 1) * limit;
		List<Thread> list=threadDao.search(searchValue,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

}
