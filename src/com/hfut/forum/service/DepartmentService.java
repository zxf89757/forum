package com.hfut.forum.service;

import java.util.List;

import com.hfut.forum.dao.DepartmentDao;
import com.hfut.forum.domain.Department;


public class DepartmentService{
	//注入dao
	private DepartmentDao departmentDao;
	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	public List<Department> findAll() {
		return departmentDao.findAll();
	}

}
