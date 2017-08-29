package com.hfut.forum.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Administrator
 * 用户
 */
public class User {
	private Integer uid;
	private Date dateCreated;
	private String username;
	private String password;
	private String name;
	private String sex;
	private String email;
	private Date dateLastActived;
	private String ipCreated;
	private String ipLastActived;
	private String image;
	private Set<CourseUser> userCourseUsers = new HashSet<CourseUser>();
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(Integer uid, Date dateCreated, String username,
			String password, String name, String sex, String email,
			Date dateLastActived, String ipCreated, String ipLastActived,
			String image, Set<CourseUser> userCourseUsers) {
		super();
		this.uid = uid;
		this.dateCreated = dateCreated;
		this.username = username;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.email = email;
		this.dateLastActived = dateLastActived;
		this.ipCreated = ipCreated;
		this.ipLastActived = ipLastActived;
		this.image = image;
		this.userCourseUsers = userCourseUsers;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", dateCreated=" + dateCreated
				+ ", username=" + username + ", password=" + password
				+ ", name=" + name + ", sex=" + sex + ", email=" + email
				+ ", dateLastActived=" + dateLastActived + ", ipCreated="
				+ ipCreated + ", ipLastActived=" + ipLastActived + ", image="
				+ image + "]";
	}

	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getDateLastActived() {
		return dateLastActived;
	}
	public void setDateLastActived(Date dateLastActived) {
		this.dateLastActived = dateLastActived;
	}
	public String getIpCreated() {
		return ipCreated;
	}
	public void setIpCreated(String ipCreated) {
		this.ipCreated = ipCreated;
	}
	public String getIpLastActived() {
		return ipLastActived;
	}
	public void setIpLastActived(String ipLastActived) {
		this.ipLastActived = ipLastActived;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Set<CourseUser> getUserCourseUsers() {
		return userCourseUsers;
	}
	public void setUserCourseUsers(Set<CourseUser> userCourseUsers) {
		this.userCourseUsers = userCourseUsers;
	}
}
