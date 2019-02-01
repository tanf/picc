<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>行程单上传查询</title>
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

</head>

<body onload="IFrameResize('ifm')" class="body-bg"
	style="padding-right: 20px;">
	<div id="container-fluid">
		<div class="ie6-out">
			<div class="ie6-in">
				<div id="content">
					<div id="box">
						<h3 id="query">上传</h3>
						<form id="form" action="${pageContext.servletContext.contextPath }/system/uploadExcel/policy_tb.jsp" method="post"
							target="ifm">
							<table class="form">
								<tr>
									<td style="border: 0" colspan="2">单证流水号: <input name="documentNo" maxlength="20"
										id="documentNo" type="text" tabindex="1" style="width: 140px;" />
										<span style="padding-left: 30px;"></span>保&nbsp;&nbsp;单&nbsp;&nbsp;号:&nbsp;<input
										name="policyNo" maxlength="40" id="policyNo" type="text" tabindex="1"
										style="width: 295px;" /><span style="padding-left: 30px;">
										状态：
									<select name="status">
										<option value="0">请选择</option>
										<option value="1">正常</option>
										<option value="2">不完整</option>
										<option value="3">无名单</option>
										<option value="4">退保</option>
									</select>
										</td>
								</tr>
								<tr>
									<td style="border: 0">行&nbsp;程&nbsp;单&nbsp;号&nbsp;:&nbsp;<input maxlength="20"
										name="xcdh" id="xcdh" type="text" tabindex="1"
										style="width: 140px;" /> <span style="padding-left: 30px;"></span>起止时间:
										<input name="start" id="start" type="text" tabindex="1"
										 style="width: 140px;cursor: pointer;" readonly="readonly"  /> ~ <input name="end" id="end"
										type="text" tabindex="1" style="width: 140px;cursor: pointer;" readonly="readonly"  /></td>
									<td style="border: 0">
										<button type="reset" class="btn btn-small"
											style="margin-bottom: 5px;">重置</button>
										<button type="submit" class="btn btn-info btn-small"
											style="margin-bottom: 5px;">查询</button>
									</td>
									</td>
								</tr>
							</table>
						</form>
						<div class="row-fluid">
							<iframe src="${pageContext.servletContext.contextPath }/system/uploadExcel/policy_tb.jsp" frameborder="0"
								marginheight="0" marginwidth="0" frameborder="0" scrolling="no"
								id="ifm" name="ifm" onload="javascript:IFrameResize('ifm');"
								width="100%"></iframe>
						</div>
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
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath }/res/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath }/res/js/jquery-ui-timepicker-addon.js"></script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath }/res/js/jquery-ui-timepicker-zh-CN.js"></script>
	<!-- IFrame高度自适应 -->
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/iframeAutoSize.js"></script>
	<script type="text/javascript">
		var startDateTextBox = $('#start');
		var endDateTextBox = $('#end');

		startDateTextBox
				.datetimepicker({
					timeFormat : 'hh:mm:ss',
					onClose : function(dateText, inst) {
						if (endDateTextBox.val() != '') {
							var testStartDate = startDateTextBox
									.datetimepicker('getDate');
							var testEndDate = endDateTextBox
									.datetimepicker('getDate');
							if (testStartDate > testEndDate)
								endDateTextBox.datetimepicker('setDate',
										testStartDate);
						} else {
							endDateTextBox.val(dateText);
						}
					},
					onSelect : function(selectedDateTime) {
						endDateTextBox.datetimepicker('option', 'minDate',
								startDateTextBox.datetimepicker('getDate'));
					}
				});
		endDateTextBox
				.datetimepicker({
					timeFormat : 'hh:mm:ss',
					onClose : function(dateText, inst) {
						if (startDateTextBox.val() != '') {
							var testStartDate = startDateTextBox
									.datetimepicker('getDate');
							var testEndDate = endDateTextBox
									.datetimepicker('getDate');
							if (testStartDate > testEndDate)
								startDateTextBox.datetimepicker('setDate',
										testEndDate);
						} else {
							startDateTextBox.val(dateText);
						}
					},
					onSelect : function(selectedDateTime) {
						startDateTextBox.datetimepicker('option', 'maxDate',
								endDateTextBox.datetimepicker('getDate'));
					}
				});
	</script>
	<script type="text/javaScript">
		function openwindow(url, name, iWidth, iHeight) {
			var url; //转向网页的地址;
			var name; //网页名称，可为空;
			var iWidth; //弹出窗口的宽度;
			var iHeight; //弹出窗口的高度;
			var iTop = (window.screen.availHeight - 30 - iHeight) / 2; //获得窗口的垂直位置;
			var iLeft = (window.screen.availWidth - 10 - iWidth) / 2; //获得窗口的水平位置;
			window
					.open(
							url,
							name,
							'height='
									+ iHeight
									+ ',,innerHeight='
									+ iHeight
									+ ',width='
									+ iWidth
									+ ',innerWidth='
									+ iWidth
									+ ',top='
									+ iTop
									+ ',left='
									+ iLeft
									+ ',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
		}
	</script>
</body>
</html>