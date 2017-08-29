package com.hfut.forum.domain;

/**
 * @author Administrator
 * 版主
 */
public class CourseUser {
	private Integer cuid;
	private Course course;
	private User user;
	public CourseUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CourseUser(Integer cuid, Course course, User user) {
		super();
		this.cuid = cuid;
		this.course = course;
		this.user = user;
	}
	@Override
	public String toString() {
		return "CourseUser [cuid=" + cuid + ", course=" + course + ", user="
				+ user + "]";
	}
	public Integer getCuid() {
		return cuid;
	}
	public void setCuid(Integer cuid) {
		this.cuid = cuid;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
}
