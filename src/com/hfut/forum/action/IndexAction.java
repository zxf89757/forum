package com.hfut.forum.action;


import java.util.List;


import com.hfut.forum.domain.Department;
import com.hfut.forum.domain.Thread;
import com.hfut.forum.service.DepartmentService;
import com.hfut.forum.service.ThreadService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class IndexAction extends ActionSupport{
	// 注入Service
	private DepartmentService departmentService;
	private ThreadService threadService;
	
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	public void setThreadService(ThreadService threadService) {
		this.threadService = threadService;
	}
	/**
	 * 执行的访问首页的方法:
	 */
	public String execute(){
		List<Department> dList = departmentService.findAll();
		ActionContext.getContext().getSession().put("dList", dList);
		List<Thread> tList = threadService.findTop();
		ActionContext.getContext().getValueStack().set("tList", tList);
		List<Thread> nList = threadService.findNew();
		ActionContext.getContext().getValueStack().set("nList", nList);
		return "index";
	}
}
