<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>配置管理</title>
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
<body class="body-bg" style="padding-right: 20px;">
	<div id="container-fluid">
		<div class="ie6-out">
			<div class="ie6-in">
				<div id="content">
					<div id="box">
						<h3 id="adduser">配置管理</h3>
						<form action="systemProperty/update.action" method="post"
							style="margin: 0;padding: 0">
							<table>
								<caption align="left" style="border-bottom: 1px solid #ededed;">出单开关</caption>
								<tr>
									<td style="border: 0" colspan="6">&nbsp;</td>
								</tr>
								<tr>
									<td style="border: 0" align="right" width="200">定时器：</td>
									<td style="border: 0">开启<input type="radio"
										name="properties[0].value"
										checked="checked"
										value="1" /> 关闭<input type="radio" name="properties[0].value"
										checked="checked"
										value="0" /><input type="hidden" name="properties[0].id"
										value='1' />
									</td>
								</tr>
								<tr>
									<td style="border: 0"></td>
									<td style="border: 0" style="color: #666">
										开启时，若团体保单人员信息不完整（人数过多或不足），则<font color="red" size="3">不能打印保单</font>。<br />
										关闭时，则不论信息是否完整，都<font color="red" size="3">能够打印保单</font>。</td>
								</tr>
							</table>
							<table>
								<caption align="left" style="border-bottom: 1px solid #ededed;">参数设置</caption>
								<tr>
									<td style="border: 0" colspan="6">&nbsp;</td>
								</tr>

										<tr>
											<td width="120" style="border: 0" align="right">：</td>
											<td width="200" style="border: 0"><input type="hidden"
												name="properties[#s.index].id"
												value='1' /><input
												style="width: 100%;"
												value='1'" />
											</td>
											<td style="border: 0;color: #666;padding-left: 20px;">
											</td>
										</tr>

								<tr>
									<td style="border: 0" colspan="6">&nbsp;</td>
								</tr>
								<tr>
									<td colspan="6"
										style="border: 0;border-top: 1px solid #ededed;" align="right">
										<button class="btn" type="reset">重置</button>
										<button class="btn btn-info" type="submit">提交</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap.min.js"></script>
	<!--[if lte IE 6]>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap-ie.js"></script>
    <![endif]-->
	<script>
		function alert(msg) {
			window.location.href = "systemManage/initUpdate.action?area.id="
					+ msg;
		}
	</script>
</body>
</html>

