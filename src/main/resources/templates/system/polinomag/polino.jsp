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
<link type="text/css" href="${pageContext.servletContext.contextPath }/res/css/jquery-ui-1.9.2.custom.min.css"
	rel="stylesheet" />
<link type="text/css" href="${pageContext.servletContext.contextPath }/res/css/jquery-ui-timepicker-addon.css"
	rel="stylesheet" />

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="${pageContext.servletContext.contextPath }/res/js/html5.js"></script>
    <![endif]-->
<script type="text/javascript">
	function onfind() {
		if (eval($("#start").val()) > eval($("#end").val())) {
			alert("起点不能大于终点");
			return;
		}
		if ($("#startDate").val() > $("#endDate").val()) {
			alert("起点时间不能大于终止时间");
			return;
		}
		if (isNaN($("#start").val()) || isNaN($("#end").val())) {
			alert("必须输入数字");
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
						<h3 id="adduser">查询发放保单号段</h3>
						<form id="form" action="./polinotb.html"
							method="post" target="ifm">
							<table class="form">
								<tr>
									<td style="border: 0">发&nbsp;&nbsp;放&nbsp;员&nbsp;:&nbsp;
										<input maxlength="14" type="text" name="polinomag.grantNo" /> <span
										style="padding-left: 30px;"></span>号&nbsp;&nbsp;&nbsp;&nbsp;段
										: &nbsp;&nbsp;&nbsp;<input name="polinomag.polinoStart" maxlength="8" 
										id="start" type="text" tabindex="1" style="width: 140px;"
										onkeyup="value=value.replace(/[^\d]/g,'') "
										onbeforepaste="clipboardData.setData(´text´,clipboardData.getData(´text
´).replace(/[^\d]/g,´´))" />
										~ <input name="polinomag.polinoEnd" id="end" type="text"
										tabindex="1" style="width: 140px;" maxlength="8" 
										onkeyup="value=value.replace(/[^\d]/g,'') "
										onbeforepaste="clipboardData.setData(´text´,clipboardData.getData(´text´).replace(/[^\d]/g,''))" />
										<span style="padding-left: 20px;"></span>状态 : <select
										name="polinomag.status" style="width: 100px;">
											<option value="">请选择</option>
											<option value="1">使用中</option>
											<option value="2">完成</option>
											<option value="3">终止</option>
											<option value="4">作废</option>
									</select>
									</td>
								</tr>
								<tr>
									<td style="border: 0" colspan="2">网点名称:&nbsp;&nbsp;<input maxlength="14" 
										type="text" name="polinomag.area_name" style="width: 100px;" />
										<span style="padding-left: 30px;"></span>时间段 : &nbsp;&nbsp; <input 
										name="polinomag.date" id="startDate" type="text"
										style="width: 140px;cursor: pointer;" readonly="readonly" /> ~ <input name="endDate" id="endDate"
										type="text" style="width: 140px;cursor: pointer;" readonly="readonly" /></td>
										<td style="border: 0" align="right">
										<button type="reset" class="btn btn-small"
											style="margin-bottom:5px;">重置</button>
										<button type="submit" class="btn btn-info btn-small"
											style="margin-bottom:5px;">查询</button>
									</td>
								</tr>
							</table>
						</form>
						<div class="row-fluid">
						<iframe src="./polinotb.html" frameborder="0"
							marginheight="0" marginwidth="0" frameborder="0" scrolling="no"
							id="ifm" name="ifm" onload="javascript:IFrameResize('ifm');"
							width="100%"> </iframe>
							</div>
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
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath }/res/js/jquery-ui-1.9.2.custom.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath }/res/js/jquery-ui-timepicker-addon.js"></script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath }/res/js/jquery-ui-timepicker-zh-CN.js"></script>
	<!-- IFrame高度自适应 -->
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/iframeAutoSize.js"></script>

	<script type="text/javascript">
				var startDateTextBox = $('#startDate');
				var endDateTextBox = $('#endDate');

				startDateTextBox.datetimepicker({
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
				endDateTextBox.datetimepicker({
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
</body>
</html>

