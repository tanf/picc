<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/c.tld" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>用户管理</title>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/theme.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/style.css" />
<!--[if IE]>
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/ie-sucks.css" />
<![endif]-->

<!-- Le styles -->
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/message.css" />

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
						<h3 id="adduser">更新用户</h3>
						<form id="form" action="${pageContext.servletContext.contextPath }/system/user.action?method=updateUser"
							method="post" style="padding: 0;margin: 0">
							<table class="form">
								<tr>
									<td align="right" style="border: 0">工号：</td>
									<td style="border: 0">
										<input type="text" id="inputInfo1" style="width: 210px" name="username" value='${user.username }' />
									</td>
								</tr>
								<tr>
									<td align="right" style="border: 0">真实名称：</td>
									<td style="border: 0">
										<input type="hidden" id="userId" style="width: 210px" name="id" value='${user.id }' />
										<input type="text" id="inputInfo2" style="width: 210px" name="name" value='${user.name }' />
									</td>
								</tr>
								<tr>
									<td align="right" style="border: 0">密码：</td>
									<td style="border: 0">
										<input type="password" style="width: 210px" id="inputInfo3" name="password" value="${user.password }"/>
									</td>
								</tr>
								<tr>
									<td align="right" style="border: 0">确认密码：</td>
									<td style="border: 0">
										<input type="password" style="width: 210px" id="inputInfo4" value="${user.password }"/>
									</td>
								</tr>
								<!-- 
								<tr>
									<td align="right" style="border: 0">用户状态：</td>
									<td style="border: 0">
										<select id="status" name="status"  tabindex="1" style="margin-left:0px;width: 210px">
											<option value="1">启用</option>
											<option value="0">停用</option>
										</select>
									</td>
								</tr>
								 -->
								<tr>
									<td align="right" style="border: 0">用户角色：</td>
									<td style="border: 0">
										<select id="role" name="role"  tabindex="1" style="margin-left:0px;width: 210px">
											<option value="0">出单员</option>
											<option value="1">保险公司管理人员</option>
											<option value="2">景区管理人员</option>
										</select>
									</td>
								</tr>
								<tr>
									<td style="border: 0"></td>
									<td style="border: 0;padding-bottom: 10px;padding-top: 10px;">
									    <button type="reset" onclick="location.href='${pageContext.servletContext.contextPath}/system/manage/user/user.html'" class="btn">返回</button>
										<button type="reset" class="btn">重置</button>
										<button type="submit" id="updateUser" class="btn btn-info">确认修改用户</button>
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
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/message.js"></script>
	<script type="text/javascript">
	function GetInitConfigOptions(form, submitId) {

		return {
			validatorgroup : "1",
			formid : form,
			onerror : function(msg) {
				$.message({
					message:msg,
					type:'info',
					time:'3000',
					showClose:true
				});
			},
			submitonce : true,//是否验证通过后，表单立刻提交
			submitbutton : submitId,//提交按钮id或对象
			isformpost : false,
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
			},
			onsuccess:function(){
				$.ajax({
	    			type : "post",
	    			dataType:"json",
					url : "${pageContext.servletContext.contextPath }/system/user.action?method=updateUser",
					data : $("#form").serialize(),
					success:function(data){
						if(data!=null){
							if(data.result==true){
								window.location.href="${pageContext.servletContext.contextPath }/system/manage/user/user.html?tip=updateSuccess";
							}else{
								$.message({
									message:data.tip,
									type:'info',
									time:'3000',
									showClose:true
								});
							}
						}
					},
					error:function(){
						$.message({
							message:"服务繁忙，请稍后再试",
							type:'error',
							time:'3000',
							showClose:true
						});
					}
	    		});
			}
		};
	}

	$(document).ready(function() {

		$("span").show();

		$.formValidator.initConfig(GetInitConfigOptions("form", "updateUser"));

		$("#inputInfo1").formValidator({
			validatorgroup : "1",
			tipid : "tip1"
		}).inputValidator({
			validatorgroup : "1",
			min : 1,
			onerror : "工号为空,请确认"
		}).functionValidator({
			validatorgroup : "1",
			fun : function() {
				var flag = false;
				$.ajax({
					type : "post",
					url : "${pageContext.servletContext.contextPath }/system/user.action?method=isUsernameExist",
					data : {"userId":$("#userId").val(),"username":$('#inputInfo1').val()},
					success : function(data) {
						if(data!=null){
							if(data){
								$("#form").attr("name","false");
							}else{
								$("#form").attr("name","true");
							}
						}else{
							$("#form").attr("name","false");
						}
					}
				});
				if($("#form").attr("name")=="false"){
					return false;
				}else {
					return true;
				};
			},
			onerror : "工号已存在，请更换工号!"
		});

		$("#inputInfo2").formValidator({
			validatorgroup : "1",
			tipid : "tip2"
		}).inputValidator({
			validatorgroup : "1",
			min : 1,
			onerror : "姓名为空,请确认"
		});
		
		$("#inputInfo3").formValidator({
			validatorgroup : "1",
			tipid : "tip3"
		}).inputValidator({
			validatorgroup : "1",
			min:1,
			max:16,
			type:"size",
			onerror:"介于1~16位字母数字组合，请确认",
			empty:{leftempty:false,rightempty:false,emptyerror:"密码两边不能有空符号"}
		});
		
		$("#inputInfo4").formValidator({
			validatorgroup : "1",
			tipid : "tip4"
		}).inputValidator({
			validatorgroup : "1",
			empty:{leftempty:false,rightempty:false,emptyerror:"确认密码两边不能有空符号"}
		}).compareValidator({
			validatorgroup : "1",
			desid:"inputInfo3",
			operateor:"=",
		onerror:"2次密码不一致,请确认"});
	});
</script>
<script type="text/javascript">
	$("#status>option").each(function(){
		if($(this).val()=='${user.status}'){
			$(this).prop("selected",true);
		}
	});
	$("#role>option").each(function(){
		if($(this).val()=='${user.role}'){
			$(this).prop("selected",true);
		}
	});
</script>
<c:if test="${!empty tip }">
	<script type="text/javascript">
	$.message({
		message:'${tip }',
		type:'info',
		time:'3000',
		showClose:true
	});
	</script>
</c:if>
</body>
</html>