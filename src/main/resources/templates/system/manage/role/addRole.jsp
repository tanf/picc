<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>添加角色</title>
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
						<h3 id="adduser">添加角色</h3>
						<form id="form" style="margin: 0;padding: 0" name="false"
							action="userManage/addRole.action" method="post">
							<table class="form">
								<tr>
									<td align="right" style="border: 0">角色名称：</td>
									<td style="border: 0"><input type="text" id="inputInfo1" style="width: 210px" maxlength="20"
										name="role.roleName" />
									</td>
								</tr>
								<tr>
									<td align="right" style="border: 0">角色描述：</td>
									<td style="border: 0"><input type="text" id="inputInfo2" style="width: 210px" maxlength="20"
										name="role.roleDesc" />
									</td>
								</tr>
								<tr>
									<td style="border: 0"></td>
									<td style="border: 0;padding-bottom: 10px;">
									<button type="reset" onclick="javascript:history.go(-1);" class="btn">返回</button>
										<button type="reset" class="btn">重置</button>
										<button type="submit" id="addRole" class="btn btn-info">确认添加角色</button>
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
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/formValidator.js"></script>
		<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/formValidatorRegex.js"></script>
	<!--[if lte IE 6]>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap-ie.js"></script>
    <![endif]-->
	<!-- IFrame高度自适应 -->
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/iframeAutoSize.js"></script>
<script type="text/javascript">
		
	function GetInitConfigOptions(form, submitId) {

		return {

			formid : form,
			onerror : function(msg) {
				alert("注意：" + msg);
			},
			submitonce : true,//是否验证通过后，表单立刻提交
			submitbutton : submitId,//提交按钮id或对象
			isformpost : true,
			tipcss : {
				//(ajax)加载处理
				loadCss : "",
				//获得焦点时的样式
				focusCss : "",
				//提示
				noticeCss : "",
				//成功
				successCss : "",
				//失败
				errorCss : "",
				//默认状态
				defaultCss : ""
			}
		};
	}

	$(document).ready(function() {


		$.formValidator.initConfig(GetInitConfigOptions("form", "addRole"));

		$("#inputInfo1").formValidator({
			tipid : "tip1"
		}).inputValidator({
			min : 1,
			onerror : "角色名称为空,请确认"
        }).functionValidator({
			fun : function() {
				$.ajax({
					type : "post",
					url : "userManage/valiRole.action",
					data : "role.roleName=" + $('#inputInfo1').val(),
					success : function(data) {
						if (data == "nameFalse") {
							$("#form").attr("name","false");
						} else {
							$("#form").attr("name","true");
						}
					}
				});
				if($("#form").attr("name")=="false"){
					return false;
				}else {
					return true;
				};
			},
			onerror : "角色名称已存在，请更换角色名称!"
		});
		
		$("#inputInfo2").formValidator({
			tipid : "tip2"
		}).inputValidator({
			min : 1,
			onerror : "角色描述为空,请确认"
		});

	});
</script>
</body>
</html>