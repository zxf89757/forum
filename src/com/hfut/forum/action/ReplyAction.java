package com.hfut.forum.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.hfut.forum.domain.Reply;
import com.hfut.forum.domain.Thread;
import com.hfut.forum.domain.User;
import com.hfut.forum.service.ReplyService;
import com.hfut.forum.service.ThreadService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
public class ReplyAction extends ActionSupport implements ModelDriven<Reply>{
	// 模型驱动使用的对象
	private Reply reply=new Reply();
	public Reply getModel() {
		return reply;
	}

	//属性驱动
	private int tid;
	public void setTid(int tid) {
		this.tid = tid;
	}
	
	//Service注入
	private ReplyService replyService;
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	private ThreadService threadService;
	public void setThreadService(ThreadService threadService) {
		this.threadService = threadService;
	}
	/**
	 * 删除回复
	 */
	public String deleteByRid(){
		reply=replyService.findByRid(reply.getRid());
		replyService.delete(reply);
		HttpServletRequest request = ServletActionContext.getRequest();
		String prePage=request.getHeader("referer");
		if(prePage==null||prePage.length()==0){
			return "indexPage";
		}
		prePage=prePage.split(request.getServerPort()+request.getContextPath()+"/")[1];
		ActionContext.getContext().getValueStack().set("prePage", prePage);	
		return SUCCESS;
	}
	/**
	 * 发表回复
	 */
	public String save(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(user==null){
			this.addActionError("您还未登录,无法发表回复");
			return "loginPage";
		}
		reply.setDateCreated(new Date());
		Thread threadInfo = threadService.findByTid(tid);
		reply.setThread(threadInfo);
		reply.setUser(user);
		reply.setFloor(threadInfo.getReplyCount()+1);
		reply.setFloorReplyCount(0);
		String html=reply.getContent();
		html=html.replaceAll("(<img.*?)style=\".*?\"", "$1"+"class=\"img-thumbnail\"");
		html=html.replaceAll("(<img.*?/ckeditor/plugins/smiley/images.*?)class=\"img-thumbnail\"", "$1"+"style=\"height:30px; width:30px\"");
		reply.setContent(html);

		replyService.save(reply);
		String gotoPage="thread_findByTid.action?page=1&tid="+tid;
		ActionContext.getContext().getValueStack().set("gotoPage", gotoPage);
		return "saveSuccess";
	}
}
