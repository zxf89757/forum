package com.hfut.forum.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hfut.forum.domain.FloorReply;
import com.hfut.forum.utils.PageHibernateCallback;

@SuppressWarnings("unchecked")
public class FloorReplyDao extends HibernateDaoSupport{

	public void save(FloorReply floorReply) {
		this.getHibernateTemplate().save(floorReply);
	}

	
	public List<FloorReply> findByPageRid(Integer rid, int begin, int limit) {
		String hql = "select fr from FloorReply fr where fr.rid = ? order by fr.dateCreated asc";
		List<FloorReply> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<FloorReply>(hql, new Object[]{rid}, begin, limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}
}
