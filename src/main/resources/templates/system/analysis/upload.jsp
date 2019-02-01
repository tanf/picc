<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>保单上传统计</title>
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

<style>
html {
	overflow-x: hidden;
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
						<h3 id="adduser">保单上传统计</h3>
						<form id="form" action="${pageContext.servletContext.contextPath }/system/analysis/uploadtb.jsp" method="post"
							target="ifm">
							<table class="form">
								<tr>
									<td style="border: 0">&nbsp;&nbsp;&nbsp;日期&nbsp;:&nbsp;<input
										style="cursor: pointer;width: 140px" readonly="readonly"
										id="date" value='2018-10-16'
										name="date" /><span style="margin-left: 20px"></span></td>
									<td style="border: 0" align="right">
										<button type="button" class="btn btn-small reset"
											style="margin-bottom:5px;">重置</button>
										<button type="submit" class="btn btn-info btn-small"
											style="margin-bottom:5px;">查询</button></td>
								</tr>
							</table>
						</form>
						<div class="row-fluid">
							<iframe width="100%" src="${pageContext.servletContext.contextPath }/system/analysis/uploadtb.jsp"
								frameborder="0" marginheight="0" marginwidth="0" frameborder="0"
								scrolling="auto" id="ifm" name="ifm"
								onload="javascript:IFrameResize('ifm');"> </iframe>
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
	<!-- IFrame高度自适应 -->
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/menubar.js"></script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath }/res/js/jquery-ui-timepicker-zh-CN.js"></script>

	<script type="text/javascript">
		$(function() {
			$("#date").datepicker({
				changeYear : true,
				changeMonth : true,
				dateFormat : "yy-mm-dd",
				showButtonPanel : true
			});
		});
		function IFrameResize(id) {
			var pTar = null;
			if (document.getElementById) {
				pTar = document.getElementById(id);
			} else {
				eval('pTar = ' + down + ';');
			}
			if (pTar && !window.opera) {
				// begin resizing iframe
				pTar.style.display = "block";
				if (pTar.contentDocument
						&& pTar.contentDocument.body.offsetHeight) {
					// ns6 syntax
					pTar.height = pTar.contentDocument.body.offsetHeight + 20;
				} else if (pTar.Document && pTar.Document.body.scrollHeight) {
					// ie5+ syntax
					pTar.height = pTar.Document.body.scrollHeight + 30;
				}
			}
		}
		$('.reset').click(function() {
			$('form input').val('');
		});
	</script>

</body>
</html>

