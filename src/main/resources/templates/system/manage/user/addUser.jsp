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
<link rel="stylesheet" type="text/css" href="res/css/ie-sucks.css" />
<![endif]-->

		<!-- Le styles -->
		<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/bootstrap.css" />
		<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/message.css"/>
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
							<h3 id="adduser">
								添加用户
							</h3>
							<form id="form" style="margin: 0; padding: 0" name="false"
								action="${pageContext.servletContext.contextPath }/system/user.action?method=addUser" method="post">
								<table class="form">
									<tr>
										<td align="right" style="border: 0">
											工号：
										</td>
										<td style="border: 0">
											<input type="text" id="inputInfo1" style="width: 210px" maxlength="20"
												name="username" />
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											真实名称：
										</td>
										<td style="border: 0">
											<input type="text" id="inputInfo2" style="width: 210px" maxlength="20"
												name="name" />
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											密码：
										</td>
										<td style="border: 0">
											<input type="password" style="width: 210px" id="inputInfo3" maxlength="20"
												name="password" />
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											确认密码：
										</td>
										<td style="border: 0">
											<input type="password" style="width: 210px" id="inputInfo4" maxlength="20" />
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											用户角色：
										</td>
										<td style="border: 0">
											<select name="role" id="lastname"
												style="width: 210px" tabindex="1">
												<option value="0">
													出单员
												</option>
												<option value="1">
													保险公司管理人员
												</option>
												<option value="2">
													景区管理人员
												</option>
											</select>
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											用户状态：
										</td>
										<td style="border: 0">
											<select name="status" id="lastname"
												style="width: 210px" tabindex="1">
												<option value="1">
													启用
												</option>
												<option value="0">
													停用
												</option>
											</select>
										</td>
									</tr>
									<tr>
										<td style="border: 0"></td>
										<td style="border: 0; padding: 10px 0;">
											<button type="reset" 
												onclick="location.href='${pageContext.servletContext.contextPath}/system/manage/user/user.html'"
												class="btn">
												返回
											</button>
											<button type="reset" class="btn">
												重置
											</button>
											<button type="submit" id="addUser" class="btn btn-info">
												确认添加用户
											</button>
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
		<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/message.js"></script>
		<!--[if lte IE 6]>
    <script type="text/javascript" src="res/js/bootstrap-ie.js"></script>
    <![endif]-->
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
				//alert("注意：" + msg);
			},
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
					url : "${pageContext.servletContext.contextPath }/system/user.action?method=addUser",
					data : $("#form").serialize(),
					success:function(data){
						if(data!=null){
							if(data.result==true){
								$.message({
									message:"添加成功",
									type:'success',
									time:'3000',
									showClose:true
								});
								$("#form")[0].reset();
							}else{
								$.message({
									message:data.tip,
									type:'error',
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

		$.formValidator.initConfig(GetInitConfigOptions("form", "addUser"));

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
					data : {"username":$('#inputInfo1').val()},
					dataType:"json",
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
			min : 1,
			max : 16,
			type : "size",
			onerror : "密码不能为空,介于1~16位字母数字组合，请确认",
			empty : {
				leftempty : false,
				rightempty : false,
				emptyerror : "密码两边不能有空符号"
			}
		});

		$("#inputInfo4").formValidator({
			validatorgroup : "1",
			tipid : "tip4"
		}).inputValidator({
			validatorgroup : "1",
			min : 1,
			onerror : "确认密码不能为空,请确认",
			empty : {
				leftempty : false,
				rightempty : false,
				emptyerror : "确认密码两边不能有空符号"
			}
		}).compareValidator({
			validatorgroup : "1",
			desid : "inputInfo3",
			operateor : "=",
			onerror : "2次密码不一致,请确认"
		});

		$("#inputInfo5").formValidator({
			validatorgroup : "1",
			tipid : "tip5"
		}).inputValidator({
			validatorgroup : "1",
			min : 2,
			onerror : "卡号为空,请确认"
		});

	});
</script>
	</body>
</html>