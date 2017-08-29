<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>CourseSharing</title>

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
   	<div class="row">
   		<div class="col-md-12" style="padding-top: 15px;padding-bottom: 15px;">
			<h4 class="text-success">置顶&公告</h4>
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
	
	<div class="row">
   		<div class="col-md-12" style="padding-top: 15px;padding-bottom: 15px;">
			<h4 class="text-success">最新发帖</h4>
		</div>
	</div>
	<table class="table table-hover">
    	<tbody>
    	<s:iterator var="t" value="nList">
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
</div>
  
    <div>
		<%@ include file="bottom.jsp" %>
    </div>

</body>
</html>
