<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>网点管理</title>
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
						<h3 id="adduser">网点添加</h3>
						<form id="form" action="systemManage/addArea.action" method="post">
							<table class="form">
								<tr>
									<td align="right" width="200" style="border: 0">网点名称：</td>
									<td style="border: 0"><input style="width: 210px;" maxlength="20"
										type="text" id="inputInfo1" name="area.areaName" />
									</td>
								</tr>
								<tr>
									<td align="right" style="border: 0">网点代码：</td>
									<td style="border: 0"><input type="text" id="inputInfo2" maxlength="20"
										style="width: 210px;" name="area.areaCode" /></td>
								</tr>
								<tr>
									<td align="right" style="border: 0">销售渠道代码：</td>
									<td style="border: 0"><input type="text" id="inputInfo3" maxlength="20"
										style="width: 210px;" name="area.saleCode" /></td>
								</tr>
								<tr>
									<td align="right" style="border: 0">归属机构名称：</td>
									<td style="border: 0">
									<select id="inputInfo4" style="width: 210px;" name="area.belongtoCode" >
									 <option value="0">--请选择--</option>
									 
									   <option value="<s:property value="#dic.dataValue"/>">长沙人保分公司</option>
									 
									</select>
									</td>
								</tr>
								<tr>
									<td align="right" style="border: 0">归属业务员代码：</td>
									<td style="border: 0"><input type="text" id="inputInfo5" maxlength="20"
										style="width: 210px;" name="area.belongtoUser" /></td>
								</tr>
								<tr>
									<td align="right" style="border: 0">业务员联系方式：</td>
									<td style="border: 0"><input type="text" id="inputInfo6" maxlength="20"
										style="width: 210px;" name="area.userTel" />
									</td>
								</tr>
								<tr>
									<td style="border: 0"></td>
									<td style="border: 0;padding-bottom: 10px;">
										<button type="reset" class="btn">重置</button>
										<button type="submit" id="addArea" class="btn btn-info">确认添加网点</button></td>
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

		$.formValidator.initConfig(GetInitConfigOptions("form", "addArea"));

		$("#inputInfo1").formValidator({
			tipid : "tip1"
		}).inputValidator({
			min : 1,
			onerror : "网点名称为空,请确认"
		});

		$("#inputInfo2").formValidator({
			tipid : "tip2"
		}).inputValidator({
			min : 2,
			onerror : "网点代码为2位,请确认"
		}).regexValidator({
			regexp : RegexEnum.notempty,
			onerror : "网点代码不能为空"
		});

		$("#inputInfo3").formValidator({
			tipid : "tip3"
		}).inputValidator({
			min : 4,
			onerror : "销售渠道代码为4位,请确认"
		}).regexValidator({
			regexp : RegexEnum.notempty,
			onerror : "销售渠道代码不能为空"
		}).regexValidator({
			regexp : RegexEnum.integer_Z,
			onerror : "销售渠道代码格式不正确,必须为数字"
		});

		$("#inputInfo4").formValidator({
			tipid : "tip4"
		}).inputValidator({
			min : 1,
			onerror : "所属机构名称为空,请确认"
		});

		$("#inputInfo5").formValidator({
			tipid : "tip5"
		}).inputValidator({
			min : 8,
			onerror : "归属业务员代码为8位,请确认"
		}).regexValidator({
			regexp : RegexEnum.notempty,
			onerror : "网点代码不能为空"
		}).regexValidator({
			regexp : RegexEnum.integer_Z,
			onerror : "归属业务员代码格式不正确,必须为数字"
		});

		$("#inputInfo6").formValidator({
			tipid : "tip6"
		}).inputValidator({
			min : 1,
			onerror : "联系方式不能为空"
		}).regexValidator({
			regexp : RegexEnum.integer_Z,
			onerror : "联系方式格式不正确,必须为数字"
		}).regexValidator({
		    regexp: RegexEnum.mobile,
		    onerror :"联系方式，为移动电话，必须11位"
		});
	});
	</script>
</body>
</html>