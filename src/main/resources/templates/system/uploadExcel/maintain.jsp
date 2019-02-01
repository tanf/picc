<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>团队与名单维护</title>
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
<style type="text/css">
.input-text {
	margin-bottom: 0;
}

img {
	width: 16px;
	height: 12px;
}
</style>
</head>

<body onload="IFrameResize('ifm')" class="body-bg"
	style="padding-right: 20px;">
	<div id="container-fluid">
		<div class="ie6-out">
			<div class="ie6-in">
				<div id="content">
					<div id="box">
						<h3 id="adduser">
							团队与名单维护
						</h3>

						<h4
							style="margin-left: 20px;margin-bottom: 0;font-size: 12px;font-weight: 300;">
							行程单号：<span class="text-info" style="font-size: 18px"><span style="color:#F00">
							</span> </span> <span class="pull-right" style="margin-right: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;现有<span
								class="text-info" id="nums" style="font-size: 18px">
							</span>条人员信息记录，实际需要<span id="need" class="text-info"
								style="font-size: 18px"><s:property value="nums[1]" /> </span>条人员信息记录！</span>
						</h4>

						<form id="form" action="policy/maintain.action?hodometerNo=<s:property
									value="hodometerNo" />" method="post">
							
							<table class="form">
								<thead>
									<tr>
										<th>序号</th>
										<th>证件类型</th>
										<th>证件号码</th>
										<th>姓名</th>
										<th width="60">性别</th>
										<th width="120">出生日期</th>
										<th width="30">操作</th>
									</tr>
								</thead>
								<tbody>
									<tr style="display: none;">
										<td align="center"><span class="id"></span><input type="hidden" />
										</td>
										<td><select style="width:190px;margin-bottom: 0">
												<option value="身份证">身份证</option>
												<option value="户口薄">户口薄</option>
												<option value="护照">护照</option>
												<option value="军人证件">军人证件</option>
												<option value="驾驶执照">驾驶执照</option>
												<option value="返乡证">返乡证</option>
												<option value="港澳身份证">港澳身份证</option>
												<option value="工号">工号</option>
												<option value="赴台通行证">赴台通行证</option>
												<option value="港澳通行证">港澳通行证</option>
												<option value="士兵证">士兵证</option>
												<option value="港澳居民来往内地通行证">港澳居民来往内地通行证</option>
												<option value="台湾居民来往内地通行证">台湾居民来往内地通行证</option>
												<option value="组织机构代码证">组织机构代码证</option>
												<option value="其他">其他</option>
										</select>
										</td>
										<td><input style="width: 200px" class="ctcardNo" /></td>
										<td><input class="name" />
										</td>
										<td>
										男<span class="man"></span>
											&nbsp;&nbsp;&nbsp; 
										女<span class="woman"></span></td>
										<td><input type="text" class="birthday" />
										</td>
										<td width="40"><button type="button"
												class="btn btn-warning del"
												style="padding: 0 10px;font-size: 11px;">删除</button>
										</td>
									</tr>
										<tr>
											<td align="center"><span><s:property
														value="#s.count" /> </span><input type="hidden"
												name="list[<s:property value='#s.index' />].id"
												value="<s:property
														value="id" />" />
											</td>
											<td><select
												name="list[<s:property value='#s.index' />].ctcardType"
												style="width:190px;margin-bottom: 0">
													<option value="身份证"
													selected="selected">身份证</option>
													<option value="户口薄" selected="selected">户口薄</option>
													<option value="护照">护照</option>
													<option value="军人证件">军人证件</option>
													<option value="驾驶执照">驾驶执照</option>
													<option value="返乡证">返乡证</option>
													<option value="港澳身份证">港澳身份证</option>
													<option value="工号">工号</option>
													<option value="赴台通行证">赴台通行证</option>
													<option value="港澳通行证">港澳通行证</option>
													<option value="士兵证">士兵证</option>
													<option value="港澳居民来往内地通行证">港澳居民来往内地通行证</option>
													<option value="台湾居民来往内地通行证">台湾居民来往内地通行证</option>
													<option value="组织机构代码证">组织机构代码证</option>
													<option value="其他">其他</option>
											</select>
											</td>

											<td><input class="ctcardNo"
												name="list[1].ctcardNo"
												style="width: 200px" value="4343434343" />
											</td>

											<td><input class="name"
												name="list[1].name"
												value="fds" />
											</td>

											<td>男<input style="border: 0;width: 16px;"
												name="list[1].gender"
												checked="checked"
												type="radio" value="男" /> &nbsp;&nbsp;&nbsp; 女<input
												style="border: 0;width: 16px;"
												checked="checked"
												name="list[1].gender"
												type="radio" value="女" /></td>
											<td><input type="text" class="birthday"
												name="list[1].birthday"
												value='1982-11-9' />
											</td>
											<td width="40"><button type="button"
													class="btn btn-warning del"
													style="padding: 0 10px;font-size: 11px;">删除</button></td>
										</tr>
								</tbody>
								<tfoot>
									<tr>
										<table>
											<tr>
												<td style="border: 0">
													<button type="button" onclick="javascript:history.go(-1);"
														class="btn">返回</button>
													<button type="reset" class="btn">重置</button></td>
												<td style="border: 0" align="right">
													<button type="button" class="btn btn-info"
														onclick="addItem()">添加一条人员信息</button>
													<button type="submit" class="btn btn-info">确认</button></td>
											</tr>
										</table>
									</tr>
								</tfoot>
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
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath }/res/js/jquery-ui-1.9.2.custom.min.js"></script>
	<!--[if lte IE 6]>
    <script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/bootstrap-ie.js"></script>
    <![endif]-->
	<!-- IFrame高度自适应 -->
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/res/js/iframeAutoSize.js"></script>

	<script type="text/javascript">
		function addItem() {
			var $tbody = $('.form tbody');
			var $hideTr = $tbody.find('tr:eq(0)');

			$hideTr.find('.id').text($tbody.find('tr').size());

			$tbody.append("<tr>" + $hideTr.html() + "</tr>");

			namedAllInput();
		}
		//为新添加的一条记录跟新 name 属性
		function namedAllInput() {
			var index = $('.form tbody tr').size() - 2;
			var $tr = $('.form tbody tr:last');

			//改变每一个input的name属性的值
			$tr.find('input:eq(0)').attr('name', 'list[' + index + '].id');
			$tr.find('select:eq(0)').attr('name',
					'list[' + index + '].ctcardType');
			$tr.find('input:eq(1)')
					.attr('name', 'list[' + index + '].ctcardNo');
			$tr.find('input:eq(2)').attr('name', 'list[' + index + '].name');
			var input1= "<input name='list[" + index + "].gender' style='border: 0;width: 16px;' checked='checked' type='radio' value='男'/>";
			$(input1).appendTo($tr.find('.man'));
			var input2 = "<input name='list[" + index + "].gender' style='border: 0;width: 16px;' type='radio' value='女'/>";
			$(input2).appendTo($tr.find('.woman'));
			$tr.find('input:eq(5)')
					.attr('name', 'list[' + index + '].birthday');
			numAdd(1);
		}

		//删除时，将select的值更改为''
		$('.del').live('click', function() {
			if (confirm("确认删除该条信息？")) {
				$tr = $(this).parent().parent();
				$tr.css('display', 'none');
				$tr.find('select').empty();
				$tr.find('select').append("<option value=''></option>");
				numAdd(-1);
			}
		});

		var reg = /^(?:(?!0000)[0-9]{4}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-8])|(?:0[13-9]|1[0-2])-(?:29|30)|(?:0[13578]|1[02])-31)|(?:[0-9]{2}(?:0[48]|[2468][048]|[13579][26])|(?:0[48]|[2468][048]|[13579][26])00)-02-29)$/;
		var sub = true;
		$('form').submit(function() {
			sub = true;

			$need = $('#need').text();
			$nums = $('#nums').text();
			//非运算符!没有作用
			if ($.trim($need) == $.trim($nums)) {

			} else {
				alert("当前人员数量 与 实际人员数量不一致！\n\n请【删除】或【添加】记录，使二者保持一致。");
				return false;
			}

			$('.ctcardNo:visible').each(function() {
				if ($(this).val() == '') {
					alert("身份证号码不能为空！");
					sub = false;
					return false;
				}
			});
			if (!sub) {
				return false;
			}
			$('.name:visible').each(function() {
				if ($(this).val() == '') {
					alert("姓名不能为空！");
					sub = false;
					return false;
				}
			});
			if (!sub) {
				return false;
			}
			$('.birthday:visible').each(function() {
				if ($(this).val() == '') {
					alert("生日不能为空！");
					sub = false;
					return false;
				}

				if (!$(this).val().match(reg)) {
					alert("生日格式不正确，请输入如2000-01-01的有效日期！");
					sub = false;
					return false;
				}
			});
			if (!sub) {
				return false;
			}
		});

		function numAdd(num) {
			var op = $('#nums').text() + "+" + num;
			$('#nums').text(eval(op));
		}
	</script>
</body>
</html>

