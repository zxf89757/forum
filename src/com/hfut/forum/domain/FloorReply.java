package com.hfut.forum.domain;

import java.util.Date;

/**
 * @author Administrator
 * 楼中楼
 */
public class FloorReply {
	private Integer ruid;
	private Integer rid;
	private Integer uid;
	private String contents;
	private Date dateCreated;
	public Integer getRuid() {
		return ruid;
	}
	public void setRuid(Integer ruid) {
		this.ruid = ruid;
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	@Override
	public String toString() {
		return "FloorReply [ruid=" + ruid + ", rid=" + rid + ", uid=" + uid
				+ ", contents=" + contents + ", dateCreated=" + dateCreated
				+ "]";
	}
	public FloorReply(Integer ruid, Integer rid, Integer uid, String contents,
			Date dateCreated) {
		super();
		this.ruid = ruid;
		this.rid = rid;
		this.uid = uid;
		this.contents = contents;
		this.dateCreated = dateCreated;
	}
	public FloorReply() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
