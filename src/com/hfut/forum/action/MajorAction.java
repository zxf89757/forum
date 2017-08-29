package com.hfut.forum.action;

import java.util.ArrayList;
import java.util.List;

import com.hfut.forum.domain.MajorCourse;
import com.hfut.forum.service.MajorCourseService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class MajorAction extends ActionSupport{
	//属性驱动
	private Integer mid;
	public void setMid(Integer mid) {
		this.mid = mid;
	}
	
	private MajorCourseService majorCourseService;
	public void setMajorCourseService(MajorCourseService majorCourseService) {
		this.majorCourseService = majorCourseService;
	}
	/**
	 * 按专业显示课程目录
	 */
	public String findByMid(){
		List<MajorCourse> mcList = majorCourseService.findByMid(mid);
		if (mcList == null || mcList.size()==0) {
			// 查询失败
			this.addActionError("该专业暂未开设课程!请等待后续更新！");
			return ERROR;
		}
		List<MajorCourse> mcList1=new ArrayList<MajorCourse>();
		List<MajorCourse> mcList2=new ArrayList<MajorCourse>();
		List<MajorCourse> mcList3=new ArrayList<MajorCourse>();
		List<MajorCourse> mcList4=new ArrayList<MajorCourse>();
		for(MajorCourse mc : mcList){
			if(mc.getGrade().equals("freshman")){
				mcList1.add(mc);
			}
			else if(mc.getGrade().equals("sophomore")){
				mcList2.add(mc);
			}
			else if(mc.getGrade().equals("junior")){
				mcList3.add(mc);
			}
			else if(mc.getGrade().equals("senior")){
				mcList4.add(mc);
			}
		}
		ActionContext.getContext().getValueStack().set("mcList1", mcList1);
		ActionContext.getContext().getValueStack().set("mcList2", mcList2);
		ActionContext.getContext().getValueStack().set("mcList3", mcList3);
		ActionContext.getContext().getValueStack().set("mcList4", mcList4);
		return "findByMid";
	}
}
