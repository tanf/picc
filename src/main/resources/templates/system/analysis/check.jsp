<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<title>对账结算</title>

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
<!-- 对账模块列表字段名：
日期、窗口、产品、景区保险、出单（小计，其中团单、散单），未出单
查询条件加上 “产品”、“窗口”
网点条件 可以去掉
 -->
<body onload="IFrameResize('ifm')" class="body-bg"
	style="padding-right: 20px;">
	<div id="container-fluid">
		<div class="ie6-out">
			<div class="ie6-in">
				<div id="content">
					<div id="box">
						<h3 id="adduser">对账结算</h3>
						<form id="form" action="${pageContext.servletContext.contextPath }/system/analysis/checktb.jsp" method="post"
							target="ifm">
							<table class="form">
								<tr>
									<td style="border: 0">日期&nbsp;:&nbsp;
									<input type="text" name="startDate" id="startDate" style="width: 140px;cursor: pointer;" readonly="readonly"/> ~ 
									<input type="text" id="endDate" name="endDate" value='' style="width: 140px;cursor: pointer;" readonly="readonly"/>
									<span style="margin-left: 20px"></span>产品:<select name="productCode" style="width: 140px">
											<option value="">-- 全部产品 --</option>
											<option value='1' selected="selected">长沙岳麓山旅游险</option>
									</select>
									<span style="margin-left: 20px"></span>出单员:
									<input type="text" id="saleSite"  name="saleSite" /> 
									</td>
									<td style="border: 0" align="right">
										<button type="button" class="btn btn-small reset"
											style="margin-bottom:5px;">重置</button>
										<button type="submit" class="btn btn-info btn-small"
											style="margin-bottom:5px;">查询</button>
									</td>
								</tr>
							</table>
						</form>
						<div class="row-fluid">
							<iframe width="100%" src="${pageContext.servletContext.contextPath }/system/analysis/checktb.jsp"
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

	<script type="text/javascript">
		$(function() {
			$("#startDate").datepicker(
					{
						defaultDate : "+1w",
						changeYear : true,
						changeMonth : true,
						dateFormat : "yy-mm-dd",
						onClose : function(selectedDate) {
							$("#endDate").datepicker("option", "minDate",
									selectedDate);
						}
					});
			$("#endDate").datepicker(
					{
						defaultDate : "+1w",
						changeYear : true,
						changeMonth : true,
						dateFormat : "yy-mm-dd",
						onClose : function(selectedDate) {
							$("#startDate").datepicker("option", "maxDate",
									selectedDate);
						}
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

