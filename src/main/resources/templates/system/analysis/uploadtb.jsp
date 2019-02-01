<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title></title>
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
<style>
html {
	overflow-y: hidden;
}

td {
	text-align: right;
}

img {
	max-width: auto;
}

.bg-total {
	background-color: #f3f9ff;
}

table tr td {
	padding-left: 20px;
	white-space: nowrap;
}
</style>
</head>

<body style="background-color: #fff;">
	<div>
		<table width="100%">
			<thead>
				<tr>
					<th rowspan="4" width="50">序号</th>
					<th rowspan="4">窗口</th>
					<th colspan="12">本月情况</th>
					<th colspan="12">本年情况</th>
				</tr>
				<tr>
					<th colspan="6">笔数</th>
					<th colspan="6">保费</th>
					<th colspan="6">笔数</th>
					<th colspan="6">保费</th>
				</tr>
				<tr>
					<th colspan="3">已上传</th>
					<th colspan="3">未上传</th>
					<th colspan="3">已上传</th>
					<th colspan="3">未上传</th>
					<th colspan="3">已上传</th>
					<th colspan="3">未上传</th>
					<th colspan="3">已上传</th>
					<th colspan="3">未上传</th>
				</tr>
				<tr>
					<th>个单</th>
					<th>团单</th>
					<th>小计</th>
					<th>个单</th>
					<th>团单</th>
					<th>小计</th>
					<th>个单</th>
					<th>团单</th>
					<th>小计</th>
					<th>个单</th>
					<th>团单</th>
					<th>小计</th>
					<th>个单</th>
					<th>团单</th>
					<th>小计</th>
					<th>个单</th>
					<th>团单</th>
					<th>小计</th>
					<th>个单</th>
					<th>团单</th>
					<th>小计</th>
					<th>个单</th>
					<th>团单</th>
					<th>小计</th>
				</tr>
			</thead>
			<tbody align="center">
				
			</tbody>
		</table>
	</div>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
		$(function() {
			$("tbody tr:last td:first").html("合计");
			$("tbody tr:last td").addClass("bg-total");
		});
	</script>
</body>
</html>

