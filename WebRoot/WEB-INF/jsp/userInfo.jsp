<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title><s:property value="userInfo.name"/>的个人信息</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/bootstrap/js/jquery2.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    
<script charset="utf-8"  type="text/javascript" src="${pageContext.request.contextPath}/js/myObject.js"></script>
</head>
<body style="background:rgb(252,252,252)" class="body-home">

	<div>
		<%@ include file="top.jsp" %>
	</div>

<div class="container">   
    <div class="row" style="background: rgb(249,249,249)">
    	<div class="col-md-2 col-md-offset-1">
    		<img style="width:140px;height:140px;" class="img-thumbnail" src="${pageContext.request.contextPath}/<s:property value="userInfo.image"/>" alt="加载中..."/>
    	</div>
    	<div class="col-md-9" style="margin-top:10px">
		<table class="table">
			<tbody>
			<tr>
				<td>用户名:<s:property value="userInfo.name"/></td>
				<td>性别:<s:property value="userInfo.sex"/></td>
		    </tr>
		    <tr>
				<td>邮箱:<s:property value="userInfo.email"/></td>
				<td>注册时间:<s:property value="userInfo.dateCreated"/></td>
				<td>上次活跃时间:<s:property value="userInfo.dateLastActived"/></td>
		    </tr>
		    <s:if test="#session.existUser!=null&&#session.existUser.uid==userInfo.uid">
			    <tr>
					<td>注册IP:<s:property value="userInfo.ipCreated"/></td>
					<td>上次登录IP:<s:property value="userInfo.ipLastActived"/></td>
			    </tr>
		    </s:if>
		  </tbody>
		</table>
		</div>
    </div>
    
    <div class="row">
   		<div class="col-md-12" style="padding-top: 15px;padding-bottom: 15px;">
			<h4 class="text-success">历史发帖</h4>
		</div>
	</div>
	
    <div>
    	<%@ include file="threadPage.jsp" %>
    </div>
    
    <div style="background: rgb(240,240,240);">
    <nav aria-label="Page navigation">
    <ul class="pagination">
    	<c:if test="${pageBean.totalPage>0}">
	    	<li>
	    		<a href="${ pageContext.request.contextPath }/user_findByUsername.action?username=${userInfo.username}&page=1">首页</a>
			</li>
		</c:if>
		<c:if test="${pageBean.page>1}">
			<li>
			<a aria-label="Previous" href="${ pageContext.request.contextPath }/user_findByUsername.action?username=${userInfo.username}&page=${pageBean.page-1}"><span aria-hidden="true">&laquo;</span></a>
			</li>
		</c:if>
		<c:choose>
			<c:when test="${pageBean.totalPage <= 10 }">
		    	<c:set var="begin" value="1"/>
		    	<c:set var="end" value="${pageBean.totalPage }"/>
			</c:when>
			<c:otherwise>
		    	<c:set var="begin" value="${pageBean.page-5 }"/>
		    	<c:set var="end" value="${pageBean.page+4 }"/>
		    	<c:if test="${begin<1 }">
		        	<c:set var="begin" value="1"/>
		        	<c:set var="end" value="10"/>
				</c:if>
				<c:if test="${end>pageBean.totalPage }">
		        	<c:set var="begin" value="${pageBean.totalPage-9 }"/>
		        	<c:set var="end" value="${pageBean.totalPage }"/>
				</c:if>
			</c:otherwise>
		</c:choose>
		<c:forEach  var="i" begin="${begin }" end="${end }">
			<c:choose>
				<c:when test="${i eq pageBean.page }">
					<li class="active">
						<span>${i }<span class="sr-only">(current)</span></span>
					</li>
				</c:when>
				<c:otherwise>
		        	<li>
		        	<a href="${ pageContext.request.contextPath }/user_findByUsername.action?username=${userInfo.username}&page=${i }">${i }</a>
		    		</li>
		    	</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pageBean.page<pageBean.totalPage}">
			<li>
			<a aria-label="Next" href="${ pageContext.request.contextPath }/user_findByUsername.action?username=${userInfo.username}&page=${pageBean.page+1}"><span aria-hidden="true">&raquo;</span></a>
			</li>
		</c:if>
		<c:if test="${pageBean.totalPage>1}">
	    	<li>
				<a href="${ pageContext.request.contextPath }/user_findByUsername.action?username=${userInfo.username}&page=${pageBean.totalPage}">尾页:${pageBean.totalPage}</a>
			</li>
		</c:if>
	</ul>
	</nav>
	</div>
</div>

    <div>
    	<%@ include file="bottom.jsp" %>
	</div>
	
</body>
</html>
