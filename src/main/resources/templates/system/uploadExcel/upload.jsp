<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>批量上传</title>
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
	<body onload="IFrameResize('ifm')" class="body-bg">
		<center>
			<div id="container" style="width: 350px">
				<div id="box">
					<h3 id="query">
						<label>
							*支持格式：ZIP
						</label>
					</h3>
					<form action="updown/uploadBatch.action" method="post"
						enctype="multipart/form-data" onsubmit="return chk_file()">
						<table class="form">
							<tr>
								<td style="border: 0" width="55">
									上传文件:
								</td>
								<td style="border: 0" width="250">
									<input type="file" name="myFile" id="myFile" />
								</td>
							</tr>
							<tr>
								<td style="border: 0">
									上传描述:
								</td>
								<td style="border: 0" width="230">
									<textarea
										style="width: 230px; margin-left: 9px; border-color: #7F9DB9;"
										name="desc" rows="5"></textarea>
								</td>
							</tr>
							<tr>
								<td style="border: 0" align="right"></td>
								<td style="border: 0">
									<input class="btn" type="reset" />
									<input id="uploadBtn" class="btn btn-info" type="submit" value="上传" />
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
			<!-- Placed at the end of the document so the pages load faster -->
			<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/jquery-1.7.2.min.js"></script>
			<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap.min.js"></script>
			<!--[if lte IE 6]>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap-ie.js"></script>
    <![endif]-->
			<script type="text/javascript">
  	function chk_file(){
  	 var myFile=document.getElementById("myFile").value;
  	 if(myFile==null||myFile==""||myFile=="undifined"){
  	 	return false;
  	 }else {
  		 var uploadBtn=	document.getElementById("uploadBtn");
  		 uploadBtn.disabled=true;
  	 	return true;
  	 }
  	}
  </script><!--
  	<script language="javascript">
	function clock() {
		i = i - 1;
		document.title = "本窗口将在" + i + "秒后自动关闭!";
		if (i > 0)
			setTimeout("clock();", 1000);
		else
			self.close();
	}
	var i = 20;
	clock();
</script>
		--></center>
	</body>
</html>