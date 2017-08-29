package com.hfut.forum.action;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import com.hfut.forum.domain.Course;
import com.hfut.forum.domain.Reply;
import com.hfut.forum.domain.Thread;
import com.hfut.forum.domain.User;
import com.hfut.forum.service.CourseService;
import com.hfut.forum.service.ReplyService;
import com.hfut.forum.service.ThreadService;
import com.hfut.forum.utils.PageBean;

@SuppressWarnings("serial")
public class ThreadAction extends ActionSupport implements ModelDriven<Thread>{
	// 模型驱动使用的对象
	private Thread thread=new Thread();
	public Thread getModel() {
		return thread;
	}
	
	//属性驱动
	private int page;
	public void setPage(int page) {
		this.page = page;
	}
	private int cid;
	public void setCid(int cid) {
		this.cid = cid;
	}
	private String searchValue;
	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}
	public String getSearchValue() {
		return searchValue;
	}

	//Service注入
	private ThreadService threadService;
	public void setThreadService(ThreadService threadService) {
		this.threadService = threadService;
	}
	private CourseService courseService;
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}
	private ReplyService replyService;
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	/**
	 * 删除帖子
	 */
	public String deleteByTid(){
		thread=threadService.findByTid(thread.getTid());
		threadService.delete(thread);
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
	 * 置顶取消置顶
	 */
	public String changeToppedByTid(){
		thread=threadService.findByTid(thread.getTid());
		if(thread.getTopped()==1){
			thread.setTopped(0);
		}
		else{
			thread.setTopped(1);
		}
		threadService.update(thread);
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
	 * 进入版块
	 */
	public String findByCid(){
		Course existCourse = courseService.findByCid(cid);
		if(existCourse==null){
			this.addActionError("您访问了未知的版块，该版块可能已被管理员删除！");
			return ERROR;
		}
		else{
			ActionContext.getContext().getValueStack().set("existCourse", existCourse);
			List<Thread> tList = threadService.findByCidTop(existCourse.getCid());
			ActionContext.getContext().getValueStack().set("tList", tList);
			PageBean<Thread> pageBean=threadService.findByPageCid(existCourse.getCid(),page,existCourse.getThreadCount());
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		}
		return "findByCid";
	}
	/**
	 * 发表帖子
	 */
	public String save(){
		User user=(User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(user==null){
			this.addActionError("您还未登录,无法发表帖子");
			return "loginPage";
		}
		thread.setDateCreated(new Date());
		Course existCourse = courseService.findByCid(cid);
		thread.setCourse(existCourse);
		thread.setUser(user);
		thread.setHit(0);
		thread.setTopped(0);
		thread.setReplyCount(0);
		String html=thread.getContent();
		html=html.replaceAll("(<img.*?)style=\".*?\"", "$1"+"class=\"img-thumbnail\"");
		html=html.replaceAll("(<img.*?/ckeditor/plugins/smiley/images.*?)class=\"img-thumbnail\"", "$1"+"style=\"height:30px; width:30px\"");
		thread.setContent(html);		
		
		/*String root = ServletActionContext.getServletContext().getRealPath("/WEB-INF/html");
		String savename=UUIDUtils.getUUID()+".html";
		int hCode=thread.getTitle().hashCode();
		String hex=Integer.toHexString(hCode);
		File dirFile=new File(root, hex.charAt(0)+"/"+hex.charAt(1));
		dirFile.mkdirs();
		File diskFile=new File(dirFile,savename);
		FileUtils.writeStringToFile(diskFile, thread.getContent(), "UTF-8");
		thread.setContent("WEB-INF/html/"+hex.charAt(0)+"/"+hex.charAt(1)+"/"+savename);
		ActionContext.getContext().getValueStack().set("Content", thread.getContent());*/
		
		threadService.save(thread);
		String gotoPage="thread_findByCid.action?page=1&cid="+cid;
		ActionContext.getContext().getValueStack().set("gotoPage", gotoPage);
		return "saveSuccess";
	}
	/**
	 * 查看帖子
	 */
	public String findByTid(){
		thread = threadService.findByTid(thread.getTid());
		thread.setHit(thread.getHit()+1);
		threadService.update(thread);
		if(thread==null){
			this.addActionError("您查看的帖子已被删除!");
			return ERROR;
		}
		else{
			ActionContext.getContext().getValueStack().set("threadInfo", thread);
			PageBean<Reply> pageReply=replyService.findByPageTid(thread.getTid(),page,thread.getReplyCount());
			ActionContext.getContext().getValueStack().set("pageReply", pageReply);
		}
		return "findByTid";
	}
	/**
	 * 搜索帖子
	 * @throws UnsupportedEncodingException 
	 */
	public String search() throws UnsupportedEncodingException{
		if(searchValue==null||searchValue.length()==0){
			this.addActionError("暂无查询结果!试试更换关键词...");
			return ERROR;
		}
		byte[] b=searchValue.getBytes("iso-8859-1");
		searchValue=new String(b,"utf-8");
		
		PageBean<Thread> pageBean=threadService.search(searchValue,page);
		if(pageBean.getList()==null||pageBean.getList().size()==0){
			this.addActionError("暂无查询结果!试试更换关键词...");
			return ERROR;
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "search";
	}
}
