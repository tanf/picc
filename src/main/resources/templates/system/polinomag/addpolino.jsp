<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>保单号段发放</title>
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
	function checks() {	
			var st=$("#start").val()*1;
			var en=$("#end").val()*1;
			var lenstart=""+st;
			var lenend=""+en;
			if(lenstart.length>8 || lenend.length>8){
				alert("最高不能超过8位数字！");
				return;
			}
		var nomStart = $("#yifaEnd").val() * 1 + 1;
		if ($("#start").val() == "") {
			alert("发放起点为必填项！");
			return;
		}
		if ($("#end").val() == "") {
			alert("发放结尾为必填项！");
			return;
		}
		if (eval($("#start").val()) >= eval($("#end").val())) {
			alert("起点不能大于等于终点！");
			return;
		}
		if (isNaN($("#start").val()) || isNaN($("#end").val())) {
			alert("必须输入数字");
			$("#start").val(nomStart);
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
						<h3 id="adduser">保单号段发放</h3>
						<form id="form" action="polino/add.action" method="post">
							<table class="form">
								<tr>
									<td style="border: 0" width="200" align="right">网点:</td>
									<td style="border: 0">
									<label ><font color='red'>岳麓区</font></label>
									&nbsp;&nbsp;<input type="hidden"  value='' name="polinomag.areaId" />
									</td>
								</tr>																
								<tr>
									<td style="border: 0" align="right">起始号段:</td>
									<td style="border: 0">&nbsp;&nbsp;<input type="text" maxlength="8" 
										name="polinomag.polinoStart" id="start" style="width:140px ;"
										 onkeyup="value=value.replace(/[^\d]/g,'') "
								        onbeforepaste="clipboardData.setData(´text´,clipboardData.getData(´text´).replace(/[^\d]/g,''))"/>
									</td>
								</tr>
								<tr>
									<td style="border: 0" align="right">终止号段:</td>
									<td style="border: 0">&nbsp;&nbsp;<input
										type="text" name="polinomag.polinoEnd" id="end" maxlength="8" 
										style="width:140px ;" onkeyup="value=value.replace(/[^\d]/g,'') "
								        onbeforepaste="clipboardData.setData(´text´,clipboardData.getData(´text´).replace(/[^\d]/g,''))"/>
									</td>
								</tr>
								<tr>
									<td style="border: 0"></td>
									<td style="border: 0">
									<button type="reset" onclick="javascript:history.go(-1);" class="btn">返回</button>
									<button type="reset" class="btn">重置</button>
										<button type="button" class="btn btn-info" onclick="checks()">确认发放保单号段</button>
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

