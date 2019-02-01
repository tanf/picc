<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>sample</title>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/theme.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/style.css" />
<!--[if IE]>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/ie-sucks.css" />
<![endif]-->

<!-- Le styles -->
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/bootstrap.css" />

<!--[if lte IE 6]>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/bootstrap-ie6.css"/>
    <![endif]-->
<!--[if lte IE 7]>
    <link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/ie.css"/>
    <![endif]-->

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="${pageContext.servletContext.contextPath }/res/js/html5.js"></script>
    <![endif]-->

<script type="text/javaScript">
	function showErrorDig(){
	var errorInfo=null;//设置错误提示信息
	if(errorInfo!=null)
		alert(errorInfo);
	}
</script>
</head>
<body style="background-color: #fff; padding: 0;">
	&nbsp;&nbsp;&nbsp;
	<a href="javascript:;"
		onClick="openwindow('../uploadExcel/upload.html','批量上传',358,235)">批量上传</a>&nbsp;&nbsp;&nbsp;
	<a href="updown/download.action?xcdh=0">下载模版</a>
	<font color="red">错误信息 </font>
	<table width="100%">
		<thead>
			<tr>
				<th>保单号</th>
				<th>单证流水号</th>
				<th>行程单号</th>
				<th>人数</th>
				<th>时间</th>
				<th>是否已上传</th>
				<th>是否已打印</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
	</table>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/jquery-1.7.2.min.js"></script>
	<script type="text/javaScript">
	function openwindow(url,name,iWidth,iHeight)
{
var url; //转向网页的地址;
var name; //网页名称，可为空;
var iWidth; //弹出窗口的宽度;
var iHeight; //弹出窗口的高度;
var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
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
	
	function link(url){
		parent.location.href=url;
	}
</script>
</body>


</html>

