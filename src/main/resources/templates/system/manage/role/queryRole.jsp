<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>查询角色</title>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/theme.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/style.css" />
<!--[if IE]>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/ie-sucks.css" />
<![endif]-->
<!-- Le styles -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/res/css/bootstrap.css" />
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

<body style="background-color: #fff; padding: 0;">
	<table width="100%">
		<thead>
			<tr>
				<th>角色ID</th>
				<th>角色名称</th>
				<th>角色描述</th>
				<th>角色权限</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody align="center">
			<tr>
				<td align="center"><span> </span></td>
				<td><span></span></td>
				<td><span></span></td>
				<td></td>
				<td align="center"><a href="javascript:upd(1)">修改</a><span
					style="margin-left: 20px"></span><a href="javascript:del(2);">删除
				</a></td>
			</tr>
				<tr>
					<td colspan="5" height="150px">无符合查询条件记录！</td>
				</tr>
		</tbody>
	</table>
	<script type="text/javascript"
		src="../../../res/js/jquery-1.7.2.min.js">
	</script>
	<script type="text/javascript" src="../../../res/js/user.js">
	</script>
	<script>
		function del(ur) {
			if(confirm("确认要删除？")){
				parent.location.href = "userManage/deleteRole.action?role.id=" + ur;
			}
		}
		function upd(ur) {
			parent.location.href = "${pageContext.servletContext.contextPath }/system/manage/role/updateRole.jsp";
		}
	</script>
</body>
</html>