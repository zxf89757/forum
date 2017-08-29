package com.hfut.forum.action;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.hfut.forum.domain.FloorReply;
import com.hfut.forum.domain.Reply;
import com.hfut.forum.domain.User;
import com.hfut.forum.service.FloorReplyService;
import com.hfut.forum.service.ReplyService;
import com.hfut.forum.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
public class FloorReplyAction extends ActionSupport implements ModelDriven<FloorReply>{

	private FloorReply floorReply=new FloorReply();
	public FloorReply getModel() {
		return floorReply;
	}
	private int begin;
	public void setBegin(int begin) {
		this.begin = begin;
	}
	private UserService userService;
	private FloorReplyService floorReplyService;
	private ReplyService replyService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setFloorReplyService(FloorReplyService floorReplyService) {
		this.floorReplyService = floorReplyService;
	}
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	/**
	 * 楼中楼回复
	 * @throws IOException
	 */
	public String save() throws IOException{
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(user==null){
			this.addActionError("您还未登录,无法发表帖子");
			return "loginPage";
		}
		floorReply.setUid(user.getUid());
		floorReply.setDateCreated(new Date());
		floorReplyService.save(floorReply);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(replyService.findByRid(floorReply.getRid()).getFloorReplyCount()+"");
		return NONE;
	}
	/**
	 * 楼中楼查看
	 * @throws IOException 
	 */
	public String add() throws IOException{
		Reply reply=replyService.findByRid(floorReply.getRid());
		if(reply==null){
			this.addActionError("您回复的内容已被删除!");
			return ERROR;
		}
		else{
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("text/html;charset=UTF-8");
			String jsonString="{\"floorreplys\":[";
			List<FloorReply> frList=floorReplyService.findByPageRid(floorReply.getRid(),begin);
			for(int i=0;i<frList.size();i++){
				FloorReply fr=frList.get(i);
				User user=userService.findByUid(fr.getUid());
				//{"name":"lpl","rid":"rid1","content":"大家好","datetime":"14.33"},
				jsonString+="{\"name\":\""+"<a href='/forum/user_findByUsername.action?username="+user.getUsername()+"&page=1'>"+user.getName()+"</a>\",";
				jsonString+="\"rid\":\"rid"+fr.getRid()+"\",\"content\":\""+fr.getContents()+"\",\"datetime\":\""+fr.getDateCreated()+"\"}";
				if(i<frList.size()-1){
					jsonString+=",";
				}
			}
			jsonString+="]}";
			response.getWriter().write(jsonString);
		}
		return NONE;
	}
}
