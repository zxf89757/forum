package com.hfut.forum.filter;

import java.io.IOException;  
import java.util.List;

import javax.servlet.Filter;  
import javax.servlet.FilterChain;  
import javax.servlet.FilterConfig;  
import javax.servlet.ServletException;  
import javax.servlet.ServletRequest;  
import javax.servlet.ServletResponse;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  

import com.hfut.forum.domain.Department; 

@SuppressWarnings("serial")
public class WebFilter extends HttpServlet implements Filter {

	public void doFilter(ServletRequest sRequest, ServletResponse sResponse,
			FilterChain filterChain) throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) sRequest;        
        HttpServletResponse response = (HttpServletResponse) sResponse;        
        HttpSession session = request.getSession();        
        String url=request.getServletPath(); 
        System.out.println(url);
        String contextPath=request.getContextPath();
        System.out.println(contextPath);
        if(url.equals("")) url+="/";    //防止报错
        if(url.equals("/")||url.startsWith("/index")){
        	System.out.println("jahdoahdoad红包大奖哦高核对安慰");
        }
        else{
        	System.out.println("jahdoahdoad红包大奖哦高核对安慰1");
        	@SuppressWarnings("unchecked")
			List<Department> dList=(List<Department>) session.getAttribute("dList");
        	if(dList==null||dList.size()==0){
        		System.out.println("jahdoahdoad红包大奖哦高核对安慰2");
        		response.sendRedirect(contextPath+"/index.jsp");   
                return;
        	}
        }
       filterChain.doFilter(sRequest, sResponse);
	}

	public void init(FilterConfig arg0) throws ServletException {
	
		
	}
}  
