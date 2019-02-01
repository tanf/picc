<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/c.tld" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
	<title>产品管理</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/theme.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/res/css/validator.css" />
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
	<style>
		.input-append {
	font-size: 1px;
}

.input-append .add-on {
	height: 12px;
	_height: 10px;
	line-height: 12px;
}
</style>
	<script type="text/javascript">
	/*function update() {
		$("form:first").submit();
	}*/
	</script>
</head>

<body class="body-bg" style="padding-right: 20px;">
	<div id="container-fluid">
		<div class="ie6-out">
			<div class="ie6-in">
				<div id="content">
					<div id="box">
						<h3 id="adduser">
							更新产品
						</h3>
						<form id="form" action="${pageContext.servletContext.contextPath}/system/product.action?method=updateProduct"
						 method="post">
							<table class="form">
								<c:if test="${!empty product}">
									<tr>
										<td align="right" style="border: 0">
											产品名称：
										</td>
										<td style="border: 0">
											<input type="hidden" id="inputInfo" name="product.id" maxlength="20" value='${product.id}' />
											<input type="text" id="inputInfo1" name="product.projectName" style="width: 210px;" value='${product.name}' />
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											产品编码：
										</td>
										<td style="border: 0">
											<input type="text" id="inputInfo2" style="width: 210px;" maxlength="20" name="product.projectCode" value='${product.code}' />
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											单证识别码：
										</td>
										<td style="border: 0">
											<input type="text" id="inputInfo3" style="width: 210px;" maxlength="20" name="product.docuDtg" value='${product.documentCode}' />
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											险种名称 ：
										</td>
										<td style="border: 0">
											<select name="product.insuranceId" id="inputInfo4" style="width: 210px">
												<c:if test="${!empty productTypes}">
													<option value="">--请选择--</option>
													<c:forEach var="type" items="${productTypes}">
														<option value="${type.id}">${type.name}</option>
													</c:forEach>
												</c:if>
											</select>
										</td>
									</tr>
									<tr style="border:0">
										<td align="right" style="border: 0">
											产品期限：
										</td>
										<td style="border: 0">
											<div class="input-append">
												<input type="text" id="inputInfo5" class="info0" maxlength="20" value='${product.timeLimit}' style="width: 182px"
												 name="product.productPeriod" />
												<span class="add-on">天</span>
											</div>
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											保险金额 ：
										</td>
										<td style="border: 0">
											<div class="input-append">
												<input type="text" id="inputInfo6" class="info1" maxlength="20" value='${product.coverage}' style="width: 182px"
												 name="product.totalCoverage" />
												<span class="add-on">万</span>
											</div>
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											保险费：
										</td>
										<td style="border: 0">
											<div class="input-append">
												<input type="text" id="inputInfo7" class="info3" maxlength="20" style="width: 182px" name="product.totalPremium"
												 value='${product.premium}' />
												<span class="add-on">元</span>
											</div>
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											赔付一：
										</td>
										<td style="border: 0">
											<div class="input-append">
												<input type="text" id="inputInfo8" class="info1" maxlength="20" value='${product.compensat1}' style="width: 182px"
												 name="product.duty1" />
												<span class="add-on">万</span>
											</div>
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											赔付二：
										</td>
										<td style="border: 0">
											<div class="input-append">
												<input type="text" id="inputInfo9" class="info1" maxlength="20" value='${product.compensat2}' style="width: 182px"
												 name="product.duty2" />
												<span class="add-on">万</span>
											</div>
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											赔付三：
										</td>
										<td style="border: 0">
											<div class="input-append">
												<input type="text" id="inputInfo10" class="info1" maxlength="20" value='${product.compensat3}' style="width: 182px"
												 name="product.duty3" />
												<span class="add-on">万</span>
											</div>
										</td>
									</tr>
									<tr>
										<td align="right" style="border: 0">
											赔付四：
										</td>
										<td style="border: 0">
											<div class="input-append">
												<input type="text" id="inputInfo11" class="info1" maxlength="20" value='${product.compensat4}' style="width: 182px"
												 name="product.duty4" />
												<span class="add-on">万</span>
											</div>
										</td>
									</tr>
								</c:if>
								<tr>
									<td style="border: 0"></td>
									<td style="border: 0">
										<button type="reset" onclick="location.href='${pageContext.servletContext.contextPath }/system/product.action?method=toQueryProduct';" class="btn">返回</button>
										<button type="reset" class="btn">
											重置
										</button>
										<button type="submit" id="updateProduct" class="btn btn-info">
											确认修改产品
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
	<!--[if lte IE 6]>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap-ie.js"></script>
    <![endif]-->
	<!-- IFrame高度自适应 -->
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/iframeAutoSize.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/message.js"></script>
	<c:if test="${!empty product}">
		<script type="text/javascript">
			$(function () {
				$("#inputInfo4>option").each(function (index, ele) {
					//console.log("值："+$(this).val());
					if ($(this).val() == ${ product.type.id }){
					$(this).prop("selected", true);
				}
			});
	});
		</script>
	</c:if>
	<script type="text/javascript">
		function GetInitConfigOptions(form, submitId) {

			return {

				formid: form,
				onerror: function (msg) {
					$.message({
						message:msg,
						type:'info',
						time:'3000',
						showClose:true
					});
				},
				submitonce: true,//是否验证通过后，表单立刻提交
				submitbutton: submitId,//提交按钮id或对象
				isformpost: false,
				tipcss: {
					//(ajax)加载处理
					loadCss: "",
					//获得焦点时的样式
					focusCss: "",
					//提示
					noticeCss: "",
					//成功
					successCss: "",
					//失败
					errorCss: "",
					//默认状态
					defaultCss: ""
				},
				onsuccess: function () {
					$.ajax({
						type: "POST",
						dateType: "json",
						url: "${pageContext.servletContext.contextPath }/system/product.action?method=updateProduct",
						data: $("form:first").serialize(),
						success: function (data) {
							if (data != null) {
								if (data.result == true) {
									//alert(data.tip);


									window.location.href = "${pageContext.servletContext.contextPath }/system/product.action?method=toQueryProduct&tip=updateSuccess";

								} else {
									$.message({
										message:data.tip,
										type:'error',
										time:'3000',
										showClose:true
									});
								}
							}else{
								$.message({
									message:"未知错误",
									type:'error',
									time:'3000',
									showClose:true
								});
							}
						},
						error: function () {
							$.message({
								message:"服务异常",
								type:'error',
								time:'3000',
								showClose:true
							});
						}
					});
				}
			}
		};


		$(document).ready(function () {
			var isNameExist = false;
			var isCodeExist = false;
			var isDocumentCodeExist = false;

			$("span").show();

			$.formValidator.initConfig(GetInitConfigOptions("form", "updateProduct"));

			$("#inputInfo1").formValidator({
				validatorgroup: "1",
				tipid: "tip1"
			}).inputValidator({
				validatorgroup: "1",
				min: 1,
				onerror: "产品名称为空,请确认"
			}).functionValidator({
				validatorgroup: "1",
				fun: function () {
					$.ajax({
						type: "post",
						async:false,//同步
						url: "${pageContext.servletContext.contextPath }/system/product.action?method=isProductNameExist",
						data: { "productName": $('#inputInfo1').val(), "id": $('#inputInfo').val() },
						success: function (data) {
							if (data != null) {
								if (data) {
									isNameExist = false;
									console.log("data true")
									//$("#form").attr("name","false");
								} else {
									console.log("data fasle")
									isNameExist = true;
									//$("#form").attr("name","true");
								}
							} else {
								console.log("data null")
								isNameExist = false;
								//$("#form").attr("name","false");
							}
						}
					});
					/*
					if($("#form").attr("name")=="false"){
						return false;
					}else {
						return true;
					};*/
					
					return isNameExist;
				},
				onerror: "新产品名称已存在，请更换产品名称"
			});

			$("#inputInfo2").formValidator({
				validatorgroup: "1",
				tipid: "tip2"
			}).inputValidator({
				validatorgroup: "1",
				min: 1,
				onerror: "产品编码为空,请确认"
			}).functionValidator({
				validatorgroup: "1",
				fun: function () {
					var flag = false;
					$.ajax({
						type: "post",
						async:false,//同步
						url: "${pageContext.servletContext.contextPath }/system/product.action?method=isProductCodeExist",
						data: { "productCode": $('#inputInfo2').val(), "id": $('#inputInfo').val() },
						success: function (data) {
							if (data != null) {
								if (data) {
									isCodeExist = false;
									console.log("data2 true")
									//$("#form").attr("name","false");
								} else {
									console.log("data2 fasle")
									isCodeExist = true;
									//$("#form").attr("name","true");
								}
							} else {
								console.log("data2 null")
								isCodeExist = false;
								//$("#form").attr("name","false");
							}
						}
					});
					/*
					if($("#form").attr("name")=="false"){
						return false;
					}else {
						return true;
					};*/
					
					return isCodeExist;
				},
				onerror: "新产品编码已存在，请更换产品编码!"
			});

			$("#inputInfo3").formValidator({
				validatorgroup: "1",
				tipid: "tip3"
			}).inputValidator({
				validatorgroup: "1",
				min: 1,
				onerror: "单证识别码为空,请确认"
			}).functionValidator({
				validatorgroup: "1",
				fun: function () {
					var flag = false;
					$.ajax({
						type: "post",
						async:false,//同步
						url: "${pageContext.servletContext.contextPath }/system/product.action?method=isDocumentCodeExist",
						data: { "documentCode": $('#inputInfo3').val(), "id": $('#inputInfo').val() },
						success: function (data) {
							if (data != null) {
								if (data) {
									isDocumentCodeExist = false;
									console.log("data3 true")
									//$("#form").attr("name","false");
								} else {
									console.log("data3 fasle")
									isDocumentCodeExist = true;
									//$("#form").attr("name","true");
								}
							} else {
								console.log("data3 null")
								isDocumentCodeExist = false;
								//$("#form").attr("name","false");
							}
						}
					});
					/*
					if($("#form").attr("name")=="false"){
						return false;
					}else {
						return true;
					};*/
					
					return isDocumentCodeExist;
				},
				onerror: "新单证识别码已存在，请更换单证识别码!"
			});

			$("#inputInfo4").formValidator({
				validatorgroup: "1",
				tipid: "tip4"
			}).functionValidator({
				validatorgroup: "1",
				fun: function () {
					var v = $('#inputInfo4').val();
					if (v == 0) {
						return false;
					} else {
						return true;
					}
				},
				onerror: "险种名称为空,请确认!"

			});


			$("#inputInfo5").formValidator({
				validatorgroup: "1",
				tipid: "tip5"
			}).inputValidator({
				validatorgroup: "1",
				min: 1,
				onerror: "产品期限为空,请确认"
			}).regexValidator({
				validatorgroup: "1",
				regexp: RegexEnum.integer_Z,
				onerror: "产品期限格式不正确,只能为正整数"
			});

			$("#inputInfo6").formValidator({
				validatorgroup: "1",
				tipid: "tip6"
			}).inputValidator({
				validatorgroup: "1",
				min: 1,
				onerror: "保险金额为空,请确认"
			}).regexValidator({
				validatorgroup: "1",
				regexp: RegexEnum.decmal6,
				onerror: "保险金额格式不正确,不能为0和负数，例：5，5.0，5.5"
			});

			$("#inputInfo7").formValidator({
				validatorgroup: "1",
				tipid: "tip7"
			}).inputValidator({
				validatorgroup: "1",
				min: 1,
				onerror: "保险费为空,请确认"
			}).regexValidator({
				validatorgroup: "1",
				regexp: RegexEnum.decmal6,
				onerror: "保险费格式不正确,不能为0和负数，例：5，5.0，5.5"
			});

			$("#inputInfo8").formValidator({
				validatorgroup: "1",
				tipid: "tip8"
			}).inputValidator({
				validatorgroup: "1",
				min: 1,
				onerror: "赔付1为空,请确认"
			}).regexValidator({
				validatorgroup: "1",
				regexp: RegexEnum.decmal6,
				onerror: "赔付1不正确,不能为0和负数，例：5，5.0，5.5"
			});
			$("#inputInfo9").formValidator({
				validatorgroup: "1",
				tipid: "tip9"
			}).inputValidator({
				validatorgroup: "1",
				min: 1,
				onerror: "赔付2为空,请确认"
			}).regexValidator({
				validatorgroup: "1",
				regexp: RegexEnum.decmal6,
				onerror: "赔付2不正确,不能为0和负数，例：5，5.0，5.5"
			});
			$("#inputInfo10").formValidator({
				validatorgroup: "1",
				tipid: "tip10"
			}).inputValidator({
				validatorgroup: "1",
				min: 1,
				onerror: "赔付3为空,请确认"
			}).regexValidator({
				validatorgroup: "1",
				regexp: RegexEnum.decmal6,
				onerror: "赔付3不正确,不能为0和负数，例：5，5.0，5.5"
			});
			$("#inputInfo11").formValidator({
				validatorgroup: "1",
				tipid: "tip11"
			}).inputValidator({
				validatorgroup: "1",
				min: 1,
				onerror: "赔付4为空,请确认"
			}).regexValidator({
				validatorgroup: "1",
				regexp: RegexEnum.decmal6,
				onerror: "赔付4不正确,不能为0和负数，例：5，5.0，5.5"
			});
		});

	</script>

</body>

</html>