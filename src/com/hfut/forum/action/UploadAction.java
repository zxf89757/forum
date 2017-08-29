package com.hfut.forum.action;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.hfut.forum.utils.UUIDUtils;
import com.opensymphony.xwork2.ActionSupport;

@SuppressWarnings("serial")
public class UploadAction extends ActionSupport{
	private File upload;
	private String uploadContentType;
	private String uploadFileName;

	public String imagesave() throws Exception{
		 // 获得response,request  
        HttpServletResponse response = ServletActionContext.getResponse();  
        HttpServletRequest request = ServletActionContext.getRequest();  
  
        response.setCharacterEncoding("utf-8");  
        PrintWriter out = response.getWriter();  
        // CKEditor提交的很重要的一个参数  
        String callback = request.getParameter("CKEditorFuncNum");  
        if (uploadContentType.equals("image/pjpeg")  
                || uploadContentType.equals("image/jpeg")) {  
            // IE6上传jpg图片的headimageContentType是image/pjpeg，而IE9以及火狐上传的jpg图片是image/jpeg  
         
        } else if (uploadContentType.equals("image/png")  
                || uploadContentType.equals("image/x-png")) {  
            // IE6上传的png图片的headimageContentType是"image/x-png"  
         
        } else if (uploadContentType.equals("image/gif")) {  
           
        } else if (uploadContentType.equals("image/bmp")) {  
           
        } else {  
            out.println("<script type=\"text/javascript\">");  
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback  
                    + ",''," + "'文件格式不正确（必须为.jpg/.gif/.bmp/.png文件）');");  
            out.println("</script>");  
            return null;  
        }  
        if (upload.length() > 600 * 1024) {  //检查大小
            out.println("<script type=\"text/javascript\">");  
            out.println("window.parent.CKEDITOR.tools.callFunction(" + callback  
                    + ",''," + "'文件大小不得大于600k');");  
            out.println("</script>");  
            return null;  
        }  
  
        String root = ServletActionContext.getServletContext().getRealPath("/image/thread");
		String savename=UUIDUtils.getUUID()+"_"+uploadFileName;
		int hCode=uploadFileName.hashCode();
		String hex=Integer.toHexString(hCode);
		File dirFile=new File(root, hex.charAt(0)+"/"+hex.charAt(1));
		dirFile.mkdirs();
		File diskFile=new File(dirFile,savename);
		FileUtils.copyFile(upload, diskFile);
		String fileName="image/thread/" + hex.charAt(0)+"/"+hex.charAt(1)+"/"+savename;
		
        // 返回"图像"选项卡并显示图片  request.getContextPath()为web项目名   
        out.println("<script type=\"text/javascript\">");  
        out.println(		
       "window.parent.CKEDITOR.tools.callFunction(" + callback  + ",'" + request.getContextPath()+"/"  + fileName + "','')"
                );  
        out.println("</script>");  
        
        return null;
	}
	
	public void setUpload(File upload) {
		this.upload = upload;
	}

	public File getUpload() {
		return upload;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}
}
