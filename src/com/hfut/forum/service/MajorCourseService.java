package com.hfut.forum.service;

import java.util.List;

import com.hfut.forum.dao.MajorCourseDao;
import com.hfut.forum.domain.MajorCourse;

public class MajorCourseService {
	//注入Dao
	private MajorCourseDao majorCourseDao;
	public void setMajorCourseDao(MajorCourseDao majorCourseDao) {
		this.majorCourseDao = majorCourseDao;
	}
	
	public List<MajorCourse> findByMid(Integer mid) {
		return majorCourseDao.findByMid(mid);
	}

}
