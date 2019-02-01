<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>团队名单查看</title>
<!-- <script type="text/javascript" src="https://getfirebug.com/firebug-lite-debug.js"></script> -->
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
<link type="text/css" href="${pageContext.servletContext.contextPath }/res/css/jquery-ui-1.9.2.custom.min.css"
	rel="stylesheet" />
<link type="text/css" href="${pageContext.servletContext.contextPath }/res/css/jquery-ui-timepicker-addon.css"
	rel="stylesheet" />

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="${pageContext.servletContext.contextPath }/res/js/html5.js"></script>
    <![endif]-->
<style type="text/css">
.input-text {
	margin-bottom: 0;
}

img {
	width: 16px;
	height: 12px;
}
</style>
</head>

<body onload="IFrameResize('ifm')" class="body-bg"
	style="padding-right: 20px;">
	<div id="container-fluid">
		<div class="ie6-out">
			<div class="ie6-in">
				<div id="content">
					<div id="box">
						<h3 id="adduser">
							团队名单查看
						</h3>
		
						<form id="form" method="post">
							<input type="hidden" name="hodometerNo"
								value="" />
							<table class="form">
								<thead>
									<tr>
										<th width="80">序号</th>
										<th width="80">证件类型</th>
										<th width="280">证件号码</th>
										<th width="80">姓名</th>
										<th width="60">性别</th>
										<th width="180">出生日期</th>
								</tr>
								</thead>
								<tbody>
										<tr>
											<td align="center">1</td>
											<td align="center">身份证
											</td>
											<td align="center">430104198810083016
											</td>
											<td align="center">张三</td>
											<td align="center">
												男
											</td>
											<td align="center">1988-10-08</td>
										</tr>
								</tbody>
								<tfoot>
									<tr>
										<table>
											<tr>
												<td style="border: 0" align="right">
													<button type="button" onclick="javascript:history.go(-1);"
														class="btn  btn-small ">返回</button>
												</td>
											</tr>
										</table>
									</tr>
								</tfoot>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath }/res/js/jquery-ui-1.9.2.custom.min.js"></script>
	<!--[if lte IE 6]>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap-ie.js"></script>
    <![endif]-->
	<!-- IFrame高度自适应 -->
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/iframeAutoSize.js"></script>

	<script type="text/javascript">
		var reg = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
		var sub = true;
		$('form').submit(function() {
			sub = true;
			
			$need = $('#need').text();
			$nums = $('#nums').text();
			//非运算符!没有作用
			if($.trim($need)==$.trim($nums)){ 
				
			}else{
				alert("当前人员数量 与 实际人员数量不一致！\n\n请【删除】或【添加】记录，使二者保持一致。");
				return false;
			}
			
			$('.ctcardNo:visible').each(function() {
				if ($(this).val() == '') {
					alert("身份证号码不能为空！");
					sub = false;
					return false;
				}
			});
			if (!sub) {
				return false;
			}
			$('.name:visible').each(function() {
				if ($(this).val() == '') {
					alert("姓名不能为空！");
					sub = false;
					return false;
				}
			});
			if (!sub) {
				return false;
			}
			$('.birthday:visible').each(function() {
				if ($(this).val() == '') {
					alert("生日不能为空！");
					sub = false;
					return false;
				}

				if (!$(this).val().match(reg)) {
					alert("生日格式不正确，请输入如2000-1-1的有效日期！");
					sub = false;
					return false;
				}
			});
			if (!sub) {
				return false;
			}
		});

		function numAdd(num) {
			var op = $('#nums').text() +"+"+ num;
			$('#nums').text(eval(op));
		}
	</script>
</body>
</html>

