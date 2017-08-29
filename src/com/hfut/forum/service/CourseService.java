package com.hfut.forum.service;

import com.hfut.forum.dao.CourseDao;
import com.hfut.forum.domain.Course;

public class CourseService {
	private CourseDao courseDao;
	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
		
	}
	public Course findByCid(int cid) {
		return courseDao.findByCid(cid);
	}

}
