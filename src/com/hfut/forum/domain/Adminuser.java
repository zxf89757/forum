package com.hfut.forum.domain;

/**
 * @author Administrator
 * 管理员用户
 */
public class Adminuser {
	private Integer uid;
	private String username;
	private String password;	
	public Adminuser() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Adminuser(Integer uid, String username, String password) {
		super();
		this.uid = uid;
		this.username = username;
		this.password = password;
	}
	@Override
	public String toString() {
		return "Adminuser [uid=" + uid + ", username=" + username
				+ ", password=" + password + "]";
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
}
