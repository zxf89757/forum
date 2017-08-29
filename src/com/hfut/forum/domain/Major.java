package com.hfut.forum.domain;

/**
 * @author Administrator
 * 专业
 */
public class Major {
	private Integer mid;
	private String mname;
	private Department department;

	public Major() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Major(Integer mid, String mname, Department department) {
		super();
		this.mid = mid;
		this.mname = mname;
		this.department = department;
	}
	@Override
	public String toString() {
		return "Major [mid=" + mid + ", mname=" + mname + ", department="
				+ department + "]";
	}
	public Integer getMid() {
		return mid;
	}
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
}
