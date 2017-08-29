package com.hfut.forum.service;

import java.util.List;

import com.hfut.forum.dao.ReplyDao;
import com.hfut.forum.domain.Reply;
import com.hfut.forum.utils.PageBean;

public class ReplyService {
	private ReplyDao replyDao;
	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}
	public PageBean<Reply> findByPageTid(Integer tid, int page, int totalCount) {
		PageBean<Reply> pageReply=new PageBean<Reply>();
		pageReply.setPage(page);
		int limit = 20;
		pageReply.setLimit(limit);
		pageReply.setTotalCount(totalCount);
		int begin = (page - 1) * limit;
		List<Reply> list=replyDao.findByPageTid(tid,begin,limit);
		pageReply.setList(list);
		return pageReply;
	}
	public Reply findByRid(Integer rid) {
		return replyDao.findByRid(rid);
	}
	public void delete(Reply reply) {
		replyDao.delete(reply);
	}
	public void save(Reply reply) {
		replyDao.save(reply);
	}

}
