package com.hfut.forum.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hfut.forum.domain.MajorCourse;

@SuppressWarnings("unchecked")
public class MajorCourseDao extends HibernateDaoSupport{

	public List<MajorCourse> findByMid(Integer mid) {
		String hql="select mc from MajorCourse mc join mc.major m where m.mid=?";
		List<MajorCourse> list = this.getHibernateTemplate().find(hql, mid);
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

}
