<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>角色管理</title>
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

<body onload="IFrameResize('ifm')" class="body-bg"
	style="padding-right: 20px;">
	<div id="container-fluid">
		<div class="ie6-out">
			<div class="ie6-in">
				<div id="content">
					<div id="box">
						<h3 id="adduser">角色查询</h3>
						<form id="form" action="${pageContext.servletContext.contextPath }/system/manage/role/queryRole.jsp" method="post"
							target="showInfo">
							<table class="form">
								<tr>
									<td style="border: 0">角色ID :<input name="role.id" maxlength="14"
										id="lastname1" type="text" tabindex="1" style="width: 100px;" />
										<span style="margin-left: 20px;"></span>角色名称 : <input maxlength="14"
										name="role.roleName" id="lastname" type="text" tabindex="1"
										style="width: 100px;" /> <span style="margin-left: 20px;"></span>角色描述
										: <input maxlength="14" name="role.roleDesc" id="lastname" type="text" maxlength="20"
										tabindex="1" style="width: 100px;" /></td>
									<td style="border: 0" align="right">
										<button type="reset" class="btn btn-small"
											style="margin-bottom:5px;">重置</button>
										<button type="submit" onclick="check()" class="btn btn-info btn-small"
											style="margin-bottom:5px;">查询</button></td>
								</tr>
							</table>
						</form>
						<div class="action">
							<ul>
								<li><a href="${pageContext.servletContext.contextPath }/system/manage/role/addRole.jsp">添加角色</a></li>
							</ul>
						</div>
						<div class="row-fluid">
						<iframe src="${pageContext.servletContext.contextPath }/system/manage/role/queryRole.jsp" frameborder="0"
							marginheight="0" marginwidth="0" frameborder="0" scrolling="no"
							id="showInfo" name="showInfo"
							onload="javascript:IFrameResize('showInfo');" width="100%">
						</iframe>
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
	<!-- IFrame高度自适应 -->
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/iframeAutoSize.js"></script>

	<script type="text/javascript">
		function addRole() {
			window.location.href = "userManage/initRoleAdd.action";
		}
		function check(){
			if(isNaN($('#lastname1').val())){
				alert("产品ID必须为数字！");
				$('#lastname1').attr('value',null);
			}
		}
	<%--
		function updateRole() {
			var flag = 0;
			var roleId = 0;
			$('#showInfo').contents().find("[name='checkbox']").each(
					function() {
						if ($(this).attr("checked")) {
							flag += 1;
							roleId = $(this).val();
						}
					});

			if (flag == 1) {
				window.location.href = "userManage/iniUpdateRole.action?role.id="
						+ roleId;
			} else {
				alert("请选择一个用户进行修改！");
			}
		};

		function deleteRole() {
			var roleId = 0;
			$('#showInfo').contents().find("[name='checkbox']").each(
					function() {
						if ($(this).attr("checked")) {
							roleId = $(this).val();
						}
					});
			if (confirm("确认要删除？")) {
				window.location.href = "userManage/deleteRole.action?role.id="
						+ roleId;
			}
		};
	--%></script>
</body>
</html>