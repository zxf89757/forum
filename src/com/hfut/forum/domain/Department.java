package com.hfut.forum.domain;

import java.util.HashSet;
import java.util.Set;


/**
 * @author Administrator
 * 系
 */
public class Department {
	private Integer did;
	private String dname;
	private Set<Major> departmentMajors = new HashSet<Major>();
	
	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Department(Integer did, String dname, Set<Major> departmentMajors) {
		super();
		this.did = did;
		this.dname = dname;
		this.departmentMajors = departmentMajors;
	}
	@Override
	public String toString() {
		return "Department [did=" + did + ", dname=" + dname
				+ ", departmentMajors=" + departmentMajors + "]";
	}
	public Integer getDid() {
		return did;
	}
	public void setDid(Integer did) {
		this.did = did;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public Set<Major> getDepartmentMajors() {
		return departmentMajors;
	}
	public void setDepartmentMajors(Set<Major> departmentMajors) {
		this.departmentMajors = departmentMajors;
	}
}
