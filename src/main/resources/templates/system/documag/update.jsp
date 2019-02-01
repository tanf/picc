<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="/WEB-INF/c.tld" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>单证管理</title>
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
<body onload="IFrameResize('ifm')" class="body-bg"
	style="padding-right: 20px;">
	<div id="container-fluid">
		<div class="ie6-out">
			<div class="ie6-in">
				<div id="content">
					<div id="box">
						<h3 id="adduser">单证修改</h3>
						<form id="form" action="${pageContext.servletContext.contextPath }/system/document.action?method=updateDocument"
							method="post">
							<table>
								<tr>
									<td style="border: 0" width="200" align="right">发放员：</td>
									<td style="border: 0"><input type="text"
										readonly="readonly" maxlength="20" 
										style="width: 210px;"
										value="${allocatorName }"></input> <input
										type="hidden" name="doculost.docuId"
										value='id1' />										
									</td>
								</tr>
								<tr>
									<td style="border: 0" align="right">出单员：</td>
									<td style="border: 0"><input type="text"
										readonly="readonly" style="width: 210px;" maxlength="20"
										name="doculost.userNo"
										value="${userName }"></input>
									</td>
								</tr>
								<tr>
									<td style="border: 0" align="right">号段起点：</td>
									<td style="border: 0"><input type="text"
										readonly="readonly" id="start" style="width: 120px;"
										maxlength="14" 
										value='${beginNum }' /> ~ <input
										type="text" readonly="readonly" id="end" style="width: 120px;"
										maxlength="14" 
										value='${endNum }' />
									</td>
								</tr>
								<tr>
									<td style="border: 0" align="right">已停用号段：</td>
									<td style="border: 0">
										<select id="disableSeg" style="width: 270px;margin-left: 0;text-align: center;">
											<!-- <option>------- 查看详细 -------</option> -->
										</select>
									</td>
								</tr>
								<tr>
									<td style="border: 0" align="right">已丢失号段：</td>
									<td style="border: 0">
										<select id="lostSeg" style="width: 270px;margin-left: 0;text-align: center;">
											<!-- <option>------- 查看详细 -------</option> -->
										</select>
									</td>
								</tr>
								<tr>
									<td style="border: 0" align="right">已作废号段：</td>
									<td style="border: 0">
										<select id="invalSeg" style="width: 270px;margin-left: 0;text-align: center;">
											<!-- <option>------- 查看详细 -------</option> -->
										</select>
										<div id="invalid" style="display: none;">
												<span>
													<span>4301040001</span><span>4301040200</span>
												</span>
										</div>
									</td>
								</tr>
								<tr>
									<td style="border: 0" align="right">当前有效号：</td>
									<td style="border: 0"><input type="text"
										 readonly="readonly"
										style="width: 120px;"
										value='${nextNum }' />
									</td>
								</tr>
								<tr>
									<td style="border: 0" align="right">状态修改号段：</td>
									<td style="border: 0">
										<!-- 修改号段起始 --> <input type="text" name="doculost.lostStart"
										id="modifyStart" style="width: 120px;" maxlength="14"
										value='${nextNum=="无"?beginNum:nextNum }'
										onkeyup="value=value.replace(/[^\d]/g,'') "
										onbeforepaste="clipboardData.setData(´text´,clipboardData.getData(´text´).replace(/[^\d]/g,''))" />
										<!-- 修改号段终止 --> ~ <input type="text" maxlength="14" name="doculost.lostEnd" id="modifyEnd"
										style="width: 120px;"
										value='${endNum }'
										onkeyup="value=value.replace(/[^\d]/g,'') "
										onbeforepaste="clipboardData.setData(´text´,clipboardData.getData(´text´).replace(/[^\d]/g,''))" />
									</td>
								</tr>
								<tr>
									<td style="border: 0" align="right">状态：</td>
									<td style="border: 0;"><select name="doculost.status"
										style="width: 210px;margin-left: 0">
											<option value="2">停用</option>
											<option value="3">丢失</option>
											<option value="4">作废</option>
									</select>
									</td>
								</tr>
								<tr>
									<td style="border: 0" align="right">发放时间：</td>
									<td style="border: 0"><input type="text"
										style="width: 210px;" readonly="readonly"
										value="${allotTime }"></input>
									</td>
								</tr>
								<tr>
									<td style="border: 0"></td>
									<td style="border: 0">
										<button type="reset" onclick="location.href='${pageContext.servletContext.contextPath }/system/documag/docu.html';"
											class="btn">返回</button>
										<button class="btn" type="reset">重置</button>
										<button class="btn btn-info" type="button" onclick="check()">提交修改</button>
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
	<!--[if lte IE 6]>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap-ie.js"></script>
    <![endif]-->
	<!-- IFrame高度自适应 -->
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/iframeAutoSize.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/message.js"></script>
	<script type="text/javascript">
		//1、修改号段起始号码  应小于等于  终止号码
		//2、修改号段起始号码  应大于  当前分配号段 起点
		//3、修改号段终止号码  应小于  当前分配号段终点
		//4、修改号段中的号码，不能出现在“已停用”、“已丢失”、“已作废”号段中
		//5、都为数字

		//修改号段号码可以为已使用号段
		function check() {
			var modifyStartVal = eval($("#modifyStart").val());
			var modifyEndVal = eval($("#modifyEnd").val());
			
			//如果验证不通过，则返回
			if(!checkNum(modifyStartVal, modifyEndVal)){
				return;
			}
			if(!checkStartGreaterThanStartValue(modifyStartVal)){
				return;
			}
			if(!checkEndLessThanEndValue(modifyEndVal)){
				return;
			}
			if(!checkStartLessThanEnd(modifyStartVal, modifyEndVal)){
				return;
			}
			/*
			if(!modifyNumNotInDisabledNum(modifyStartVal, modifyEndVal)){
				alert("修改状态号段中有号码已停用、丢失或作废！");
				return;
			}
			*/
			var info = "是否确认"
				+ $("[name='doculost.status'] option:selected").html()
				+ " "
				+ $("#modifyStart").val() 
				+ " ~ " 
				+ $("#modifyEnd").val() 
				+ " 号段的单证号？";
			if(confirm(info)){
				$.ajax({
					type:"POST",
					dateType:"json",
					url:"${pageContext.servletContext.contextPath }/system/document.action?method=updateDocument",
					data:$("form:first").serialize(),
					success:function(data){
						if(data!=null){
							if(data.result==true){
								window.location.href="${pageContext.servletContext.contextPath }/system/documag/docu.html?tip=updateSuccess";
							}else{
								$.message({
									message:data.tip,
									type:'error',
									time:3000,
									showClose:true
								});
							}
						}else{
							$.message({
								message:"未知错误",
								type:'error',
								time:3000,
								showClose:true
							});
						}
					},
					error:function(){
						$.message({
							message:"服务异常",
							type:'error',
							time:3000,
							showClose:true
						});
					}
				});
			}
			
		}
		
		//是否为数字
		function checkNum(start, end) {
			if (start=="" || isNaN(start)) {
				$.message({
					message:"修改号段起始号必须为数字！",
					type:'info',
					time:3000,
					showClose:true
				});
				return false;
			}
			if (end=="" || isNaN(end)) {
				$.message({
					message:"修改号段终止号必须为数字！",
					type:'info',
					time:3000,
					showClose:true
				});
				return false;
			}
			return true;
		}

		function checkStartLessThanEnd(start, end) {
			if (start > end) {
				$.message({
					message:"修改号段起始号大于终止号！",
					type:'info',
					time:3000,
					showClose:true
				});
				return false;
			}
			return true;
		}

		//修改号段起始大于当前分配号段起始
		function checkStartGreaterThanStartValue(start) {
			if (start < $("#start").val()) {
				$.message({
					message:"修改号段起始号不能小于号段起点号！",
					type:'info',
					time:3000,
					showClose:true
				});
				return false;
			}
			return true;
		}

		//修改号段起始大于当前分配号段起始
		function checkEndLessThanEndValue(end) {
			if (end > $("#end").val()) {
				$.message({
					message:"修改号段终止号不能大于号段终点号！",
					type:'info',
					time:3000,
					showClose:true
				});
				return false;
			}
			return true;
		}
		/*
		function modifyNumNotInDisabledNum(start, end) {
			var correct = true;
			$("#invalid>span").each(function(){
				var invalidStart = $(this).find("span:eq(0)").html();
				var invalidEnd = $(this).find("span:eq(1)").html();
				if(start>=invalidStart && start<=invalidEnd){
					
					correct = false;
					return;
				}
				if(end>=invalidStart && end<=invalidEnd){
					correct = false;
					return;
				}
				if(start<invalidStart && end>invalidEnd){
					correct = false;
					return;
				}
			});
			return correct;
		}
		*/
	</script>
	<script type="text/javascript">
		//停用号段
		$(function(){
			$.ajax({
				type : "post",
				url : "${pageContext.servletContext.contextPath }/system/document.action?method=queryDocumentSegVO",
				data : {"beginNum":"${param.beginNum }","endNum":"${param.endNum }","status":"2"},
				dataType:"json",
				success : function(data) {
					if(data!=null&&data.length>0){
						for(var i=0;i<data.length;i++){
							$("select#disableSeg").append("<option>"+data[i].beginNum+" - "+data[i].endNum+"</option>");
						}
					}else{
						$("select#disableSeg").append("<option>无</option>");
					}
				}
			});
			//丢弃号段
			$.ajax({
				type : "post",
				url : "${pageContext.servletContext.contextPath }/system/document.action?method=queryDocumentSegVO",
				data : {"beginNum":"${param.beginNum }","endNum":"${param.endNum }","status":"3"},
				dataType:"json",
				success : function(data) {
					if(data!=null&&data.length>0){
						for(var i=0;i<data.length;i++){
							$("select#lostSeg").append("<option>"+data[i].beginNum+" - "+data[i].endNum+"</option>");
						}
					}else{
						$("select#lostSeg").append("<option>无</option>");
					}
				}
			});
			//废弃号段
			$.ajax({
				type : "post",
				url : "${pageContext.servletContext.contextPath }/system/document.action?method=queryDocumentSegVO",
				data : {"beginNum":"${param.beginNum }","endNum":"${param.endNum }","status":"4"},
				dataType:"json",
				success : function(data) {
					if(data!=null&&data.length>0){
						for(var i=0;i<data.length;i++){
							$("select#invalSeg").append("<option>"+data[i].beginNum+" - "+data[i].endNum+"</option>");
						}
					}else{
						$("select#invalSeg").append("<option>无</option>");
					}
				}
			});
		});
	</script>
</body>
</html>

