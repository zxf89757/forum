<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>课程</title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
	<script src="${pageContext.request.contextPath}/bootstrap/js/jquery2.min.js"></script>
	<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
    
</head>
<body style="background:rgb(252,252,252)" class="body-home">

	<div>
		<%@ include file="top.jsp" %>
    </div>

<div class="container">


<div class="panel-group">
	<div class="panel panel-success">
		<div class="panel-heading">
			大一课程
			<a class="pull-right" data-toggle="collapse" href="#collapseOne">
				<span class="glyphicon glyphicon-chevron-down"></span>
			</a>
		</div>
		<div id="collapseOne" class="panel-collapse collapse in">
			<div class="panel-body">
				<ul class="list-group">
	    			<s:iterator var="mc" value="mcList1">
	    				<li class="col-md-4 list-group-item">
							<a href="${ pageContext.request.contextPath }/thread_findByCid.action
								?cid=<s:property value="#mc.course.cid"/>&page=1">
								<s:property value="#mc.course.name"/>
							</a>
	    				</li>
	    			</s:iterator>
	    		</ul>
			</div>
		</div>
	</div>
	<div class="panel panel-info">
		<div class="panel-heading">
			大二课程
			<a class="pull-right" data-toggle="collapse" href="#collapseTwo">
				<span class="glyphicon glyphicon-chevron-down"></span>
			</a>
		</div>
		<div id="collapseTwo" class="panel-collapse collapse in">
			<div class="panel-body">
				<ul class="list-group">
	    			<s:iterator var="mc" value="mcList2">
	    				<li class="col-md-4 list-group-item">
							<a href="${ pageContext.request.contextPath }/thread_findByCid.action
								?cid=<s:property value="#mc.course.cid"/>&page=1">
								<s:property value="#mc.course.name"/>
							</a>
	    				</li>
	    			</s:iterator>
	    		</ul>
			</div>
		</div>
	</div>
	<div class="panel panel-warning">
		<div class="panel-heading">
			大三课程
			<a class="pull-right" data-toggle="collapse" href="#collapseThree">
				<span class="glyphicon glyphicon-chevron-down"></span>
			</a>
		</div>
		<div id="collapseThree" class="panel-collapse collapse in">
			<div class="panel-body">
				<ul class="list-group">
	    			<s:iterator var="mc" value="mcList3">
	    				<li class="col-md-4 list-group-item">
							<a href="${ pageContext.request.contextPath }/thread_findByCid.action
								?cid=<s:property value="#mc.course.cid"/>&page=1">
								<s:property value="#mc.course.name"/>
							</a>
	    				</li>
	    			</s:iterator>
	    		</ul>
			</div>
		</div>
	</div>
	<div class="panel panel-danger">
		<div class="panel-heading">
			大四课程
			<a class="pull-right" data-toggle="collapse" href="#collapseFour">
				<span class="glyphicon glyphicon-chevron-down"></span>
			</a>
		</div>
		<div id="collapseFour" class="panel-collapse collapse in">
			<div class="panel-body">
				<ul class="list-group">
	    			<s:iterator var="mc" value="mcList4">
	    				<li class="col-md-4 list-group-item">
							<a href="${ pageContext.request.contextPath }/thread_findByCid.action
								?cid=<s:property value="#mc.course.cid"/>&page=1">
								<s:property value="#mc.course.name"/>
							</a>
	    				</li>
	    			</s:iterator>
	    		</ul>
			</div>
		</div>
	 </div>
</div>
</div>

    <div>
		<%@ include file="bottom.jsp" %>
    </div>

</body>
</html>