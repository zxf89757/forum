package com.hfut.forum.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hfut.forum.domain.Department;

@SuppressWarnings("unchecked")
public class DepartmentDao extends HibernateDaoSupport {

	public List<Department> findAll() {
		String hql = "from Department";
		List<Department> list = this.getHibernateTemplate().find(hql);
		return list;
	}

}
