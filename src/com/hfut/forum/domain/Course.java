package com.hfut.forum.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * @author Administrator
 * 课程版块
 */
public class Course {
	private Integer cid;
	private String describe;
	private String name;
	private Integer threadCount;
	private String image;
	private Set<CourseUser> courseCourseUsers = new HashSet<CourseUser>();
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Course(Integer cid, String describe, String name,
			Integer threadCount, String image,
			Set<CourseUser> courseCourseUsers) {
		super();
		this.cid = cid;
		this.describe = describe;
		this.name = name;
		this.threadCount = threadCount;
		this.image = image;
		this.courseCourseUsers = courseCourseUsers;
	}
	@Override
	public String toString() {
		return "Course [cid=" + cid + ", describe=" + describe + ", name="
				+ name + ", threadCount=" + threadCount + ", image=" + image
				+ ", courseCourseUsers=" + courseCourseUsers + "]";
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getThreadCount() {
		return threadCount;
	}
	public void setThreadCount(Integer threadCount) {
		this.threadCount = threadCount;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Set<CourseUser> getCourseCourseUsers() {
		return courseCourseUsers;
	}
	public void setCourseCourseUsers(Set<CourseUser> courseCourseUsers) {
		this.courseCourseUsers = courseCourseUsers;
	}
}
