package com.hfut.forum.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hfut.forum.domain.Course;

@SuppressWarnings("unchecked")
public class CourseDao extends HibernateDaoSupport{

	public Course findByCid(int cid) {
		String hql = "from Course where cid = ?";
		List<Course> list = this.getHibernateTemplate().find(hql, cid);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}
