<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>上传Excel</title>
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
							*支持格式Excel
						</label>
					</h3>
					<form id="form" action="updown/upload.action" method="post"
						enctype="multipart/form-data" onsubmit="return chk_file()">
						<table>
							<tr>
								<td style="border: 0" width="55">
									行程单号:
								</td>
								<td style="border: 0" >
									<input type="text" name="xcdh" style="width: 200px"
										value="232323232323232" readonly="readonly" />
								</td>
							</tr>
							<tr>
								<td style="border: 0" >
									上传文件:
								</td>
								<td style="border: 0">
									<input type="file" style="width: 203px" name="myFile" id="myFile" />
								</td>
							</tr>
							<tr>
								<td style="border: 0" ></td>
								<td style="border: 0" >
									<input class="btn" type="reset" />
									<input class="btn btn-info" type="submit"  id="uploadBtn" value="上传" />
								</td>
							</tr>
						</table>
						<s:actionerror />
						<s:property value="errorInfo" />
					</form>
				</div>
			</div>
			<!-- Placed at the end of the document so the pages load faster -->
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
  		 document.getElementById("uploadBtn").disabled=true;
  	 	return true;
  	 }
  	}
  </script>
		</center>
	</body>
</html>