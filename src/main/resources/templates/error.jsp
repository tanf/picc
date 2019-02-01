<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<title>错误页面</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<meta charset="utf-8">

<!-- Le styles -->
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/bootstrap.css">

<!--[if lte IE 6]>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/bootstrap-ie6.css">
    <![endif]-->
<!--[if lte IE 7]>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/ie.css">
    <![endif]-->

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
        <script src="${pageContext.servletContext.contextPath }/res/js/html5.js"></script>
    <![endif]-->

<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/print.css">

</head>

<body style="text-align: left;padding-left: 20px;padding-top: 20px">
	<blockquote style="">
		<h2 class="text-info">系统错误，请与管理员联系！</h2>
		<hr>
		<p>
			<a href="javascript:void(0);">团体保单打印</a>
		</p>
		<p>
			<a href="javascript:void(0);">个人保单打印</a>
		</p>
		<p>
			<a href="${pageContext.servletContext.contextPath }/system/main.jsp">返回至后台管理</a>
		</p>
		<p>
			<a href="${pageContext.servletContext.contextPath }/login.action?method=logout">退出</a>
		</p>
	</blockquote>
	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script type="text/javascript" src="res/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="res/js/bootstrap.min.js"></script>
	<!--[if lte IE 6]>
    <script type="text/javascript" src="res/js/bootstrap-ie.js"></script>
    <![endif]-->

	<script type="text/javascript">
		$(function() {
			if (window.parent != window) {
				parent.location.href = "${pageContext.servletContext.contextPath }/error.jsp";
			}
		});
	</script>
	<script type="text/javascript">
		window.onbeforeunload = function() //author: meizz    
		{
			var n = window.event.screenX - window.screenLeft;
			var b = n > document.documentElement.scrollWidth - 20;
			if (b && window.event.clientY < 0 || window.event.altKey) {
				//这里可以放置你想做的操作代码   
				$.post('login/out.action');
			}
		}
	</script>

</body>
</html>