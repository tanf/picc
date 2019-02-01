<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>投保管理</title>
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
						<h3 id="adduser">退保操作</h3>
						保单号：<input type="text" id="poli_no" maxlength="22"/>
						<button class="btn btn-info"
					                onclick="cancell()">确认退保</button>
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
		function cancell(){			
			if(window.confirm("是否确认退保！")){
				$.ajax({
					type : "POST",
					url : "policy/cancellPoli.action",
					data : "policyNo=" + $("#poli_no").val(),							
					success : function(msg) {
						if (msg == "false") {
							alert("保单号所对应的数据不存在！");
						} else {
							alert("退保成功！");
							$("#poli_no").val("");
						}
					}
				});
			}
		}
	</script>
</body>
</html>

