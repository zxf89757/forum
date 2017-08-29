package com.hfut.forum.domain;

import java.util.Date;

/**
 * @author Administrator
 * 发帖
 */
public class Thread {
	private Integer tid;
	private Date dateCreated;
	private Course course;
	private User user;
	private String title;
	private String content;
	private Integer hit;
	private Integer replyCount;
	private Integer topped;
	public Thread() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Thread(Integer tid, Date dateCreated, Course course, User user,
			String title, String content, Integer hit, Integer replyCount,
			Integer topped) {
		super();
		this.tid = tid;
		this.dateCreated = dateCreated;
		this.course = course;
		this.user = user;
		this.title = title;
		this.content = content;
		this.hit = hit;
		this.replyCount = replyCount;
		this.topped = topped;
	}
	@Override
	public String toString() {
		return "Thread [tid=" + tid + ", dateCreated=" + dateCreated
				+ ", course=" + course + ", user=" + user + ", title=" + title
				+ ", content=" + content + ", hit=" + hit + ", replyCount="
				+ replyCount + ", topped=" + topped +  "]";
	}

	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getHit() {
		return hit;
	}
	public void setHit(Integer hit) {
		this.hit = hit;
	}
	public Integer getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(Integer replyCount) {
		this.replyCount = replyCount;
	}
	public Integer getTopped() {
		return topped;
	}
	public void setTopped(Integer topped) {
		this.topped = topped;
	}
}
