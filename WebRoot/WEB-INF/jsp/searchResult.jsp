<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>搜索结果_${searchValue}</title>
   
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/bootstrap/js/jquery2.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
   
<script charset="utf-8"  type="text/javascript" src="${pageContext.request.contextPath}/js/myObject.js"></script>
<script>
	function myFunction(){
		var nWord = "${searchValue}"; //获取el表达式冲文本框输入的关键字
		var dsa=document.getElementsByName("title");//获取全部标题
		for ( var t = 0; t < dsa.length; t++) {
				//替换重新写入标题名
			dsa[t].innerHTML =dsa[t].innerHTML.replace(nWord,"<span style='color:red'>"+nWord+"</span>");
		}
	}
</script>
</head>
<body style="background:rgb(252,252,252)" class="body-home" onload="myFunction()">

	<div>
		<%@ include file="top.jsp" %>
	</div>

<div class="container" style="min-height:370px">
	<div class="row">
   		<div class="col-md-12" style="padding-top: 5px;padding-bottom: 5px;">
			<h4 class="text-success"><strong>以下为<span style="color: red;">${searchValue}</span>的搜索结果:</strong></h4>
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
	    		<a href="${ pageContext.request.contextPath }/thread_search.action?searchValue=${searchValue}&page=1">首页</a>
			</li>
		</c:if>
		<c:if test="${pageBean.page>1}">
			<li>
			<a aria-label="Previous" href="${ pageContext.request.contextPath }/thread_search.action?searchValue=${searchValue}&page=${pageBean.page-1}"><span aria-hidden="true">&laquo;</span></a>
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
		        	<a href="${ pageContext.request.contextPath }/thread_search.action?searchValue=${searchValue}&page=${i }">${i }</a>
		    		</li>
		    	</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pageBean.page<pageBean.totalPage}">
			<li>
			<a aria-label="Next" href="${ pageContext.request.contextPath }/thread_search.action?searchValue=${searchValue}&page=${pageBean.page+1}"><span aria-hidden="true">&raquo;</span></a>
			</li>
		</c:if>
		<c:if test="${pageBean.totalPage>1}">
	    	<li>
				<a href="${ pageContext.request.contextPath }/thread_search.action?searchValue=${searchValue}&page=${pageBean.totalPage}">尾页:${pageBean.totalPage}</a>
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
