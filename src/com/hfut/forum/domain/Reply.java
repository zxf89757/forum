package com.hfut.forum.domain;

import java.util.Date;

/**
 * @author Administrator
 * 回复
 */
public class Reply {
	private Integer rid;
	private Date dateCreated;
	private Thread thread;
	private User user;
	private String content;
	private Integer floor;
	private Integer floorReplyCount; 
	
	public Reply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Reply(Integer rid, Date dateCreated, Thread thread, User user,
			String content, Integer floor, Integer floorReplyCount) {
		super();
		this.rid = rid;
		this.dateCreated = dateCreated;
		this.thread = thread;
		this.user = user;
		this.content = content;
		this.floor = floor;
		this.floorReplyCount = floorReplyCount;
	}
	@Override
	public String toString() {
		return "Reply [rid=" + rid + ", dateCreated=" + dateCreated
				+ ", thread=" + thread + ", user=" + user + ", content="
				+ content + ", floor=" + floor + ", floorReplyCount="
				+ floorReplyCount + "]";
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	public Thread getThread() {
		return thread;
	}
	public void setThread(Thread thread) {
		this.thread = thread;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getFloor() {
		return floor;
	}
	public void setFloor(Integer floor) {
		this.floor = floor;
	}
	public void setFloorReplyCount(Integer floorReplyCount) {
		this.floorReplyCount = floorReplyCount;
	}
	public Integer getFloorReplyCount() {
		return floorReplyCount;
	}
}
