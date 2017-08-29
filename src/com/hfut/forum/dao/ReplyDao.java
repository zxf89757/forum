package com.hfut.forum.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hfut.forum.domain.Reply;
import com.hfut.forum.utils.PageHibernateCallback;

@SuppressWarnings("unchecked")
public class ReplyDao extends HibernateDaoSupport{

	public List<Reply> findByPageTid(Integer tid, int begin, int limit) {
		String hql = "select r from Reply r join r.thread t where t.tid = ? order by r.dateCreated asc";
		List<Reply> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<Reply>(hql, new Object[]{tid}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

	public Reply findByRid(Integer rid) {
		return this.getHibernateTemplate().get(Reply.class,rid);
	}

	public void delete(Reply reply) {
		this.getHibernateTemplate().delete(reply);
	}

	public void save(Reply reply) {
		this.getHibernateTemplate().save(reply);
	}

}
