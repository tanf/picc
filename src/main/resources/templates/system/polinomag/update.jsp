<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>保单号段管理</title>
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
<script type="text/javascript">
	function check() {

		if ($("#now").val() == "" || $("#now").val() == 0) {
			alert("请输入有效号！");
			return;
		}
		if (isNaN(($("#now").val()))) {
			alert("请输入数字！");
			return;
		}
		if (eval($("#now").val()) > eval($("#end").val())) {
			alert("有效号不能大于终点号！");
			return;
		}
		if ($("#now").val() < $("#start").val()) {
			alert("有效号不能小于起始号！");
			return;
		}
		$("form:first").submit();
	}
</script>
</head>
<body onload="IFrameResize('ifm')" class="body-bg"
	style="padding-right: 20px;">
	<div id="container-fluid">
		<div class="ie6-out">
			<div class="ie6-in">
				<div id="content">
					<div id="box">
						<h3 id="adduser">保单号段修改</h3>
						<form id="form" action="polino/updateDocuNow_polino.action"
							method="post">
							<table class="form">
								<tr>
									<td width="200" style="border: 0" align="right">发放员：</td>
									<td style="border: 0"><input type="text"
										style="width: 210px;" readonly="readonly"
										name="polinomag.grantNo"
										value=<s:property value="polinomag.grantNo"/>></input> <input
										style="width: 210px;" type="hidden" name="polinomag.id"
										value=<s:property value="polinomag.id"/> /></td>
								</tr>
								<tr>
									<td style="border: 0" align="right">网点：</td>
									<td style="border: 0"><input type="text"
										style="width: 210px;" readonly="readonly"
										name="polinomag.area_name"
										value=<s:property value="polinomag.area_name"/>></input></td>
								</tr>
								<tr>
									<td style="border: 0" align="right">号段起点：</td>
									<td style="border: 0"><input type="text"
										style="width: 210px;"  id="start"
										name="polinomag.polinoStart"
										value='<s:property value="polinomag.polinoStart"/>'
											onkeyup="value=value.replace(/[^\d]/g,'') "
										onbeforepaste="clipboardData.setData(´text´,clipboardData.getData(´text´).replace(/[^\d]/g,''))"></input></td>
								</tr>

								<tr>
									<td style="border: 0" align="right">号段终点：</td>
									<td style="border: 0"><input type="text"
										style="width: 210px;"  id="end"
										name="polinomag.polinoEnd"
										value='<s:property value="polinomag.polinoEnd"/>'
											onkeyup="value=value.replace(/[^\d]/g,'') "
										onbeforepaste="clipboardData.setData(´text´,clipboardData.getData(´text´).replace(/[^\d]/g,''))"></input></td>
								</tr>
								<tr>
									<td style="border: 0" align="right">有效号：</td>
									<td style="border: 0"><input type="text"
										style="width: 210px;" name="polinomag.polinoNow"  id="now"
										value=<s:property value="polinomag.polinoNow" />
										onkeyup="value=value.replace(/[^\d]/g,'') "
										onbeforepaste="clipboardData.setData(´text´,clipboardData.getData(´text´).replace(/[^\d]/g,''))"></input>
									</td>
								</tr>
								<tr>
									<td style="border: 0" align="right">状态：</td>
									<td style="border: 0;">
									<select name="polinomag.status"
										style="width: 210px;margin-left:0px">
											<option value="1">使用中</option>
											<option value="3">终止</option>
									</select></td>
								</tr>
								<tr>
									<td style="border: 0" align="right">发放时间：</td>
									<td style="border: 0"><input type="text"
										style="width: 210px;" readonly="readonly"
										name="polinomag.date"
										value=<s:date format="yyyy-MM-dd" name="polinomag.date"/>></input>
									</td>
								</tr>
								<tr>
									<td style="border: 0"></td>
									<td style="border: 0">
									<button type="reset" onclick="javascript:history.go(-1);" class="btn">返回</button>
										<button class="btn" type="reset">重置</button>
										<button class="btn btn-info" type="button" onclick="check()">提交修改</button>
									</td>
								</tr>
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
	<!--[if lte IE 6]>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap-ie.js"></script>
    <![endif]-->
	<!-- IFrame高度自适应 -->
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/iframeAutoSize.js"></script>

	<script type="text/javascript">
		
	</script>

</body>
</html>