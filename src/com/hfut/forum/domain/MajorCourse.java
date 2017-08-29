package com.hfut.forum.domain;

/**
 * @author Administrator
 * 专业课程
 */
public class MajorCourse {
	private Integer cmid;
	private Course course;
	private Major major;
	private String grade;
	public MajorCourse() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MajorCourse(Integer cmid, Course course, Major major, String grade) {
		super();
		this.cmid = cmid;
		this.course = course;
		this.major = major;
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "MajorCourse [cmid=" + cmid + ", course=" + course + ", major="
				+ major + ", grade=" + grade + "]";
	}
	public Integer getCmid() {
		return cmid;
	}
	public void setCmid(Integer cmid) {
		this.cmid = cmid;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	public Major getMajor() {
		return major;
	}
	public void setMajor(Major major) {
		this.major = major;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}
