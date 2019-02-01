<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 对账模块列表字段名：
日期、窗口、产品、景区保险、出单（小计，其中团单、散单），未出单
查询条件加上 “产品”、“窗口”
网点条件 可以去掉
 -->
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
</head>
<!-- 对账模块列表字段名：
日期、窗口、产品,(景区保险、出单（小计，其中团单、散单），未出单)                  
查询条件加上 “产品”、“窗口”
网点条件 可以去掉
 -->
<body style="background-color: #fff;">
	<table style="font-size: 12px;" class="sum_table">
		<thead>
			<tr>
				<th rowspan="2">日期</th>
				<th rowspan="2">出单员</th>
				<th rowspan="2">产品类型</th>
				<th colspan="2">已出单</th>
				<th colspan="2" rowspan="1">未出单</th>
			</tr>
			<tr>
				<th>金额</th>
				<th>单数</th>
				<th>金额</th>
				<th>单数</th>
			</tr>
		</thead>
	
	</table>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/jquery-1.7.2.min.js">
		
	</script>
	<script type="text/javascript">
		$(function() {
			$("tbody tr:last td:first").text('总计');
			$("tbody tr:last").css({
				"font-width" : "800",
				"background-color" : "#f3f9ff"
			});
			sum();
		});
		function sum() {
			var noPrintCountMoneySum = 0;
			$(".noPrintCountMoneyValue").each(
					function() {
						noPrintCountMoneySum += parseFloat($(this).html());
						$("#noPrintCountMoneySum").html(
								noPrintCountMoneySum.toFixed(2));
					});
			var noPrintCountSum = 0;
			$(".noPrintCountValue").each(function() {
				noPrintCountSum += parseFloat($(this).html());
				$("#noPrintCountSum").html(noPrintCountSum);
			});
			var printTeamCountMoneySum = 0;
			$(".printTeamCountMoneyValue").each(
					function() {
						printTeamCountMoneySum += parseFloat($(this).html());
						$("#printTeamCountMoneySum").html(
								printTeamCountMoneySum.toFixed(2));
					});
			var printTeamCountSum = 0;
			$(".printTeamCountValue").each(function() {
				printTeamCountSum += parseFloat($(this).html());
				$("#printTeamCountSum").html(printTeamCountSum);
			});
			var printPersonCountMoneySum = 0;
			$(".printPersonCountMoneyValue").each(
					function() {
						printPersonCountMoneySum += parseFloat($(this).html());
						$("#printPersonCountMoneySum").html(
								printPersonCountMoneySum.toFixed(2));
					});
			var printPersonCountSum = 0;
			$(".printPersonCountMoneyValue").each(function() {
				printPersonCountSum += parseFloat($(this).html());
				$("#printPersonCountSum").html(printPersonCountSum);
			});
			var totalMoneySum = 0;
			$(".totalMoneyValue").each(function() {
				totalMoneySum += parseFloat($(this).html());
				$("#totalMoneySum").html(totalMoneySum.toFixed(2));
			});
			var totalCountSum = 0;
			$(".totalCountValue").each(function() {
				totalCountSum += parseFloat($(this).html());
				$("#totalCountSum").html(totalCountSum);
			});
		}
	</script>
</body>
</html>

