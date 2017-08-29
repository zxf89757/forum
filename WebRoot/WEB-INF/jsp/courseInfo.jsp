<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title><s:property value="existCourse.name"/></title>
    <style>
		#cke_content{
			width: 82.5%;
		}    
    </style>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/bootstrap/js/jquery2.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrapvalidator/dist/css/bootstrapValidator.css"/>
    <script src="${pageContext.request.contextPath}/bootstrapvalidator/dist/js/bootstrapValidator.js"></script>
    <script src="${pageContext.request.contextPath}/bootstrapvalidator/dist/js/language/zh_CN.js"></script>

<script charset="utf-8"  type="text/javascript" src="${pageContext.request.contextPath}/js/myObject.js"></script>
<script charset="utf-8"  type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    window.onload = function() 
    {
    	//参数‘content’是textarea元素的name属性值，而非id属性值
    	editor = CKEDITOR.replace( 'content');
    };
</script>
</head>
<body style="background:rgb(252,252,252)" class="body-home">

	<div>
		<%@ include file="top.jsp" %>
	</div>
   
<div class="container"> 
    <div class="row" style="background: rgb(249,249,249)">
    	<div class="col-md-2 col-md-offset-1">
    		<img style="width:140px;height:140px;" class="img-thumbnail" src="${pageContext.request.contextPath}/<s:property value="existCourse.image"/>" alt="加载中..."/>
    	</div>
    	<div class="col-md-9" style="margin-top:33px">
   			<h3>
    			<a href="${ pageContext.request.contextPath }/thread_findByCid.action
							?cid=<s:property value="existCourse.cid"/>&page=1">
							<s:property value="existCourse.name"/>
				</a>
				<small>
					主贴数：<s:property value="existCourse.threadCount"/>
				</small>
			</h3>
    		<p style="text-indent:2em">
    			<s:property value="existCourse.describe"/>
    		</p>
    	</div>
    </div>
    <div class="row">
   		<div class="col-md-12" style="padding-top: 20px;">
			<h4 class="text-success">最新发帖<small class="pull-right">
			<s:if test="#session.existUser==null"><a href="${ pageContext.request.contextPath }/user_loginPage.action">快速发帖&gt;&gt;</a></s:if>
			<s:else><a href="#signupForm">快速发帖&gt;&gt;</a></s:else>
			</small></h4>
		</div>
	</div>
    <table class="table table-hover">
    	<tbody>
    	<s:iterator var="t" value="tList">
			<tr><td>
			<div class="row">
				<div data-toggle="tooltip" data-placement="bottom" title="回复" class="col-md-1">
					<span class="badge"><s:property value="#t.replyCount"/></span>
				</div>
				<div class="col-md-8">
					<div class="row">
						<s:if test="#t.topped==1">
							<span class="bg-primary">&nbsp;精&nbsp;</span>
							<a class="text-danger" name="title" href="${ pageContext.request.contextPath }/thread_findByTid.action
									?tid=<s:property value="#t.tid"/>&page=1">
									<s:property value="#t.title"/>
							</a>
						</s:if>
						<s:else>
							<a name="title" href="${ pageContext.request.contextPath }/thread_findByTid.action
										?tid=<s:property value="#t.tid"/>&page=1">
									<s:property value="#t.title"/>
							</a>
						</s:else>
					</div>
					<div class="row">
						<s:property value="#t.content" escapeHtml="false"/>
					</div>
				</div>
				<div class="col-md-1">
					<div>
						<a href="${ pageContext.request.contextPath }/user_findByUsername.action
									?username=<s:property value="#t.user.username"/>&page=1">
								<s:property value="#t.user.name"/>
						</a>
					</div>
					<div data-toggle="tooltip" data-placement="bottom" title="点击量">
						<s:property value="#t.hit"/>
					</div>
				</div>
				<div class="col-md-2">
					<div data-toggle="tooltip" data-placement="bottom" title="发帖时间">
							<s:property value="#t.dateCreated"/>
					</div>
					<div>
						<s:if test="#session.existUser!=null">
							<s:if test="#t.course.courseCourseUsers!=null">
								<s:if test="#t.topped==1">
									<s:iterator var="u" value="#t.course.courseCourseUsers">
										<s:if test="#u.user.uid==#session.existUser.uid">
											<button type="button" class="btn btn-Info btn-xs">
												<a href="${ pageContext.request.contextPath }/thread_changeToppedByTid.action
														?tid=<s:property value="#t.tid"/>">取消置顶
												</a>
											</button>
										</s:if>
									</s:iterator>
								</s:if>
								<s:else>
									<s:iterator var="u" value="#t.course.courseCourseUsers">
										<s:if test="#u.user.uid==#session.existUser.uid">
											<button type="button" class="btn btn-Info btn-xs">
												<a href="${ pageContext.request.contextPath }/thread_changeToppedByTid.action
														?tid=<s:property value="#t.tid"/>">置顶
												</a>
											</button>
										</s:if>
									</s:iterator>
								</s:else>
							</s:if>
							<s:if test="#t.user.uid==#session.existUser.uid">
								<button type="button" class="btn btn-warning btn-xs">
									<a href="${ pageContext.request.contextPath }/thread_deleteByTid.action
											?tid=<s:property value="#t.tid"/>" onclick="javascript:return del();">删除
									</a>
								</button>
							</s:if>
							<s:else>
								<s:if test="#t.course.courseCourseUsers!=null">
									<s:iterator var="u" value="#t.course.courseCourseUsers">
										<s:if test="#u.user.uid==#session.existUser.uid || #t.user.uid==#session.existUser.uid">
											<button type="button" class="btn btn-warning btn-xs">
												<a href="${ pageContext.request.contextPath }/thread_deleteByTid.action
														?tid=<s:property value="#t.tid"/>" onclick="javascript:return del();">删除
												</a>
											</button>
										</s:if>
									</s:iterator>
								</s:if>
							</s:else>	
						</s:if>
					</div>	
				</div>
			</div>
			</td></tr>
		</s:iterator>
		</tbody>
	</table>
    
    <div>
    	<%@ include file="threadPage.jsp" %>
    </div>
    
    <div style="background: rgb(240,240,240);">
    <nav aria-label="Page navigation">
    <ul class="pagination">
    	<c:if test="${pageBean.totalPage>0}">
	    	<li>
	    		<a href="${ pageContext.request.contextPath }/thread_findByCid.action?cid=${existCourse.cid}&page=1">首页</a>
			</li>
		</c:if>
		<c:if test="${pageBean.page>1}">
			<li>
			<a aria-label="Previous" href="${ pageContext.request.contextPath }/thread_findByCid.action?cid=${existCourse.cid}&page=${pageBean.page-1}"><span aria-hidden="true">&laquo;</span></a>
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
		        	<a href="${ pageContext.request.contextPath }/thread_findByCid.action?cid=${existCourse.cid}&page=${i }">${i }</a>
		    		</li>
		    	</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pageBean.page<pageBean.totalPage}">
			<li>
			<a aria-label="Next" href="${ pageContext.request.contextPath }/thread_findByCid.action?cid=${existCourse.cid}&page=${pageBean.page+1}"><span aria-hidden="true">&raquo;</span></a>
			</li>
		</c:if>
		<c:if test="${pageBean.totalPage>1}">
	    	<li>
				<a href="${ pageContext.request.contextPath }/thread_findByCid.action?cid=${existCourse.cid}&page=${pageBean.totalPage}">尾页:${pageBean.totalPage}</a>
			</li>
		</c:if>
	</div>

	<div>
		<s:if test="#session.existUser != null">
			<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">发表新帖</h3>						
			</div>
			<div class="panel-body">
				<form id="signupForm" class="form-horizontal" action="${ pageContext.request.contextPath }/thread_save.action"  method="post" enctype="multipart/form-data">
					<div style="margin:0 auto; width:100%;">
						<div class="form-group">
							<label class="col-sm-2 control-label"> 标题：</label>
							<div class="col-sm-7">
								<input class="form-control" placeholder="输入标题" type="text" name="title"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-10 col-sm-offset-2"><textarea class="form-control" id="content" name="content"></textarea></div>
						</div>
						<input type="hidden" value="<s:property value='existCourse.cid'/>" name="cid"/>
						<div class="form-group">
				    		<div class="col-sm-offset-2 col-sm-10">
				      			<button type="submit" class="btn btn-primary">发表</button>
				    		</div>
			  			</div>
					</div>
				</form>
			</div>
			</div>
		</s:if>
	</div>
</div>
 
    <div>
    	<%@ include file="bottom.jsp" %>
	</div>
<script>
$(document).ready(function() {
    $('#signupForm').bootstrapValidator({
//      live: 'disabled',
      message: 'This value is not valid',
      feedbackIcons: {
          valid: 'glyphicon glyphicon-ok',
          invalid: 'glyphicon glyphicon-remove',
          validating: 'glyphicon glyphicon-refresh'
      },
      fields: {
    	  title: {
      		validators: {  
                  notEmpty: {  
                      message: "标题不能为空"
                  },
                  stringLength: {
                      max: 30,
                      message: "长度不能超过30"
                  }
                 
      		}  
      	}
      }
  });

});
</script>
</body>
</html>
