package com.hfut.forum.action;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.hfut.forum.domain.User;
import com.hfut.forum.domain.Thread;
import com.hfut.forum.service.ThreadService;
import com.hfut.forum.service.UserService;
import com.hfut.forum.utils.PageBean;
import com.hfut.forum.utils.UUIDUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements ModelDriven<User>{
	// 模型驱动使用的对象
	private User user = new User();
	// 属性驱动:验证码,文件,文件名,页码:
	private String checkcode;
	private File upload;
	private String uploadFileName;
	private String uploadContentType;
	private int page;
	// 注入Service
	private UserService userService;
	private ThreadService threadService;
	/**
	 * 跳转到登录页面
	 */
	public String loginPage() {
		return "loginPage";
	}
	/**
	 * 跳转到注册页面
	 */
	public String registPage() {
		return "registPage";
	}
	/**
	 * 用户注册的方法:
	 * @throws IOException
	 */
	public String regist() throws IOException {
	 	if (uploadContentType.equals("image/pjpeg")  
                || uploadContentType.equals("image/jpeg")) {  
   
     	} else if (uploadContentType.equals("image/png")  
                || uploadContentType.equals("image/x-png")) {
         
        } else if (uploadContentType.equals("image/gif")) {  
           
        } else if (uploadContentType.equals("image/bmp")) {  
           
        } else {  
            this.addActionError("文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）");
            return INPUT;  
        }  
        if (upload.length() > 350 * 1024) {  //检查大小
        	this.addActionError("文件大小不得大于350k");
            return INPUT;
        }
	     
		user.setDateCreated(new Date());
		user.setDateLastActived(user.getDateCreated());
		if(user.getName()==null||user.getName().length()==0){
			user.setName(user.getUsername());
		}
		user.setIpCreated(ServletActionContext.getRequest().getRemoteAddr());
		user.setIpLastActived(user.getIpCreated());
		if(upload==null||upload.length()==0){
			user.setImage("image/user/f7a1daa4acc4c39db7ac3fe09907619e.png");
		}
		else{	
			String root = ServletActionContext.getServletContext().getRealPath("/image/user");
			String savename=UUIDUtils.getUUID()+"_"+uploadFileName;
			int hCode=uploadFileName.hashCode();
			String hex=Integer.toHexString(hCode);
			File dirFile=new File(root, hex.charAt(0)+"/"+hex.charAt(1));
			dirFile.mkdirs();
			File diskFile=new File(dirFile,savename);
			FileUtils.copyFile(upload, diskFile);
			user.setImage("image/user/" + hex.charAt(0)+"/"+hex.charAt(1)+"/"+savename);
		}
		userService.save(user);
		//登入
		ServletActionContext.getRequest().getSession().setAttribute("existUser", user);
		return "indexPage";
	}
	/**
	 * 登录的方法
	 */
	public String login() {
		User existUser = userService.login(user);
		// 判断
		if (existUser == null) {
			// 登录失败
			this.addActionError("登录失败:用户名或密码错误!");
			return "loginPage";
		} else {
			// 登录成功
			// 将用户的信息存入到session中
			existUser.setDateLastActived(new Date());
			existUser.setIpLastActived(ServletActionContext.getRequest().getRemoteAddr());
			userService.update(existUser);
			ServletActionContext.getRequest().getSession()
					.setAttribute("existUser", existUser);
			// 页面跳转
			return "indexPage";
		}
	}
	/**
	 * 查看用户信息及帖子
	 */
	public String findByUsername(){
		User userInfo = userService.findByUsername(user.getUsername());
		if(userInfo==null){
			this.addActionError("您查看的用户不存在!");
			return ERROR;
		}
		else{
			ActionContext.getContext().getValueStack().set("userInfo", userInfo);
			PageBean<Thread> pageBean=threadService.findByPageUid(userInfo.getUid(),page);
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		}
		return "findByUsername";
	}
	/**
	 * 用户退出的方法
	 */
	public String quit(){
		// 销毁session
		ServletActionContext.getRequest().getSession().removeAttribute("existUser");
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
	 * AJAX进行异步校验用户名的执行方法
	 * 
	 * @throws IOException
	 */
	public String findByName() throws IOException {
		// 调用Service进行查询:
		User existUser = userService.findByUsername(user.getUsername());
		// 获得response对象,项页面输出:
		// 判断
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if (existUser != null) {
			// 查询到该用户:用户名已经存在
			String value = "{\"valid\":false}";
			response.getWriter().write(value);
		}
		else{
			String value = "{\"valid\":true}";
			response.getWriter().write(value);
		}
		return NONE;
	}
	/**
	 * AJAX进行异步校验验证码的执行方法
	 * 
	 * @throws IOException
	 */
	public String checkcode() throws IOException {
		String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		if(!checkcode.equalsIgnoreCase(checkcode1)){
			String value = "{\"valid\":false}";
			response.getWriter().write(value);
		}
		else{
			String value = "{\"valid\":true}";
			response.getWriter().write(value);
		}
		return NONE;
	}
	
	public User getModel() {
		return user;
	}
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setThreadService(ThreadService threadService) {
		this.threadService = threadService;
	}
}
