<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/c.tld" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
	<head>
		<title>错误页面</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">

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

	<body style="text-align: left; padding-left: 20px; padding-top: 20px">
		<blockquote style="">
			<h2 class="text-info">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统错误<hr>请与管理员联系！
			</h2>
			<hr>
			
				<p>
					<a
						href="javascript:window.opener=null;window.open('','_self');window.close();">立即关闭</a>
				</p>
		</blockquote>
		<!-- Le javascript
    ================================================== -->
		<!-- Placed at the end of the document so the pages load faster -->

		<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap.min.js"></script>
		<!--[if lte IE 6]>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap-ie.js"></script>
    <![endif]-->

		<script type="text/javascript">
	$(function() {
		if (window.parent != window) {
			parent.location.href = "error.jsp";
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
		<script language="javascript">
	function clock() {
		i = i - 1;
		document.title = "本窗口将在" + i + "秒后自动关闭!";
		if (i > 0)
			setTimeout("clock();", 1000);
		else
			self.close();
	}
	var i = 5;
	clock();
</script>

	</body>
</html>