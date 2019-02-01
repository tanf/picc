var hkey_root, hkey_path, hkey_key;
	hkey_root = "HKEY_CURRENT_USER";
	hkey_path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
	var assured = "";//定义一个字符串用来保存用户的身份信息和
	var poli_nos = "";//定义一个字符串用来保存保险信息
	function cycle() {
		var RegWsh = new ActiveXObject("WScript.Shell");
		hkey_key = "header";
		RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "");
		hkey_key = "footer";
		RegWsh.RegWrite(hkey_root + hkey_path + hkey_key, "");
		setInterval(Button1_onclick, 800);
	}
	var newlength = 1;
	function Button1_onclick() {
		var CVR_IDCard = document.getElementById("CVR_IDCard");
		var strReadResult = CVR_IDCard.ReadCard();
		if (strReadResult == "0") { //判断是不是第一个没有值
			var length = $("#persons div").length;
			for ( var i = newlength; i <= length; i++) {
				if ($("#card" + i + "").val() == "") {
					$("#name" + i + "").val(CVR_IDCard.Name);
					$("#card" + i + "").val(CVR_IDCard.CardNo);
					//将打印DIV的信息设置进去
					$("#page" + i + "").find("#f5").text(CVR_IDCard.Name);
					$("#page" + i + "").find("#f6").text(CVR_IDCard.CardNo);
					//添加身份信息
					assured += $("#cardtype" + i + "").val() + ",";//证件类型
					assured += CVR_IDCard.Name + ","; //姓名
					assured += CVR_IDCard.CardNo + ";"; //证件号
					newlength++;
					break;
				}
			}
		}
	}
	function ajaxPerson() {
		//打印之前判断一下是否有手动输入的信息没有放入到page DIV中  
		var nums = $("#persons div").length;
		var potype = $("#insura").val();
		var newPoli_no;
		for ( var i = 1; i <= nums; i++) {
			if ($("#card" + i + "").val() == null
					|| $("#card" + i + "").val() == "") {
				alert("请输入身份信息");
				return;
			}
			
			if ($("#page" + i + "").find("#f5").text() == "") {
				//将打印DIV的信息设置进去
				$("#page" + i + "").find("#f5").text($("#name" + i + "").val());
				$("#page" + i + "").find("#f6").text($("#card" + i + "").val());
				//添加身份信息
				assured += $("#cardtype" + i + "").val() + ",";//证件类型
				assured += $("#name" + i + "").val() + ","; //姓名
				assured += $("#card" + i + "").val() + ";"; //证件号
			}
		}
		//将身份信息保存到隐藏域 提交  
		$.ajax({
			type : "POST",
			url : "print/ajaxPerson.action",
			data : "print.tickets=" + $("#tickets").val() + "&print.assured="
					+ assured + "&print.product="
					+ $("#potype_code").val(),
			success : function(msg) {
				if (msg == 'docu_null') {
					alert("单证号使用完毕，请联系管理员进行发放！");
					return;
				}
				if (msg == 'poli_null') {
					alert("当前网点的保单号已使用完毕，请联系管理员进行发放！");
					return;
				}
				//取到数据后填到DIV
				var strs = msg.split(",");
				var docu_nos=strs[0].split(".");
				var product = $("#potype_code").val().split(",");
				var tickets = $("#tickets").val().split(",");
				var newPoli_no=strs[2].split("-");
				for (var i = 1; i <= nums; i++) {
					$("#page" + i + "").find("#f1").text(assemblingDocuno(14,docu_nos[i-1]));
					$("#page" + i + "").find("#f2").text(
							strs[1] +""+ assemblingDocuno(8,newPoli_no[i-1]));
					
					$("#page" + i + "").find("#f7").text(product[3]+"万");
					$("#page" + i + "").find("#f8").text(product[4]+"万");
					$("#page" + i + "").find("#f9").text(product[5]+"万");
		            $("#page" + i + "").find("#f10").text(product[6]+"万");
		            $("#page" + i + "").find("#f11").text(product[7]);
					$("#page" + i + "").find("#f12").text(product[7]);
					$("#page" + i + "").find("#f13").text(strs[4]);
					$("#page" + i + "").find("#f14").text(strs[3]);
				   var d = new Date();
				   str = '';
				   str += d.getFullYear()+'/';
				   str  += d.getMonth() + 1+'/';
				   str  += d.getDate()+' ';
				   str += d.getHours()+':';
				   str  += d.getMinutes();
				   $("#page" + i + "").find("#f15").text(str);
				   $("#page" + i + "").find("#f16").text(
							strs[1] +""+ assemblingDocuno(8,newPoli_no[i-1]));
				}
				print();
			}
		});
	}
	function assemblingDocuno(length,no) {
		var str = "";
		//得到长度
		var len = (no+"").length;
		for ( var i = 0; i < length - len; i++) {
			str += 0;
		}
		str += no;
		return str;
	}
	function changeTick() {
		var strTicet = $("#tickets").val().split(",");
		var num = strTicet[1];
		if (num >= $("#persons div").length) {
		
			//如果选择的大于现有的  就再添加几条DIV
			for ( var i = $("#persons div").length + 1; i <= num; i++) {
				$("#persons")
						.append(
								""
										+ " <div class=\"print-individual\"                           "
							 +"	id='div"+i+"'                         "
							 +"			style=\"height: 15px;padding: 0px;\">                       "
										+ "				证件类型：    "
										+ "				<select style=\"width: 150px\"                          "
							 +"					id='cardtype"+i+"'>    "
										+ "					<option value=\"01\">                              "
										+ "						身份证"
										+ "					</option>"
										+ "					<option value=\"02\">"
										+ "						户口薄"
										+ "				</option>"
										+ "					<option value=\"03\">"
										+ "						护照"
										+ "					</option>"
										+ "					<option value=\"04\">"
										+ "						军人证件"
										+ "					</option>"
										+ "					<option value=\"05\">"
										+ "						驾驶执照"
										+ "					</option>"
										+ "					<option value=\"06\">"
										+ "						返乡证"
										+ "					</option>"
										+ "					<option value=\"07\">"
										+ "						港澳身份证"
										+ "					</option>"
										+ "					<option value=\"08\">"
										+ "						工号"
										+ "					</option>"
										+ "					<option value=\"09\">"
										+ "						赴台通行证"
										+ "					</option>"
										+ "					<option value=\"10\">"
										+ "						港澳通行证"
										+ "					</option>"
										+ "					<option value=\"15\">"
										+ "						士兵证"
										+ "					</option>"
										+ "					<option value=\"25\">"
										+ "						港澳居民来往内地通行证"
										+ "					</option>"
										+ "					<option value=\"26\">"
										+ "						台湾居民来往内地通行证"
										+ "					</option>"
										+ "					<option value=\"31\">"
										+ "						组织机构代码证"
										+ "					</option>"
										+ "					<option value=\"99\">"
										+ "						其他"
										+ "					</option>"
										+ "				</select>"
										+ "				<span style=\"margin-left: 5px;\"></span>证件号码："
										+ "				<input type=\"text\" name=\"cardno\"  "
							 +"					id='card"+i+"'   "
							 +"					style=\"width: 175px; height: 22px;\" maxlength=\"23\">"
										+ "				<span style=\"margin-left: 5px;\"></span>姓名："
										+ "				<input type=\"text\" name=\"custname\""
							 +"					id='name"+i+"'  "
							 +"					style=\"width: 80px; max-width: 70px; height: 10px; line-height: 17px; padding: 0px;\"/>"
										+ "			</div>"

										+ "");
				//将打印DIV中添加几个
				$("#totalpage").append(""
					+"	 <div class='PageNext'></div>  "
					+"	<div id='page"+i+"' class='page'    "
					+"		style='width: 67mm; height: 127mm;'>"
					+"		<div id='f1' class='f1'>"
					+"		</div>"
					+"		<div id='f2' class='f2'>"
					+"		</div>"
					+"		<div id='f3' class='f3'>"
					+"			个人"
					+"		</div>"
					+"		<div id='f4' class='f4'>"
					+"		1</div>"
					+"		<div id='f5' class='f5'></div>"
					+"		<div id='f6' class='f6'></div>"
					+"		<div id='f7' class='f7'></div>"
					+"		<div id='f8' class='f8'>"						
					+"		</div>"
					+"		<div id='f10' class='f10'></div>"
					+"		<div id='f11' class='f11'></div>"
					+"		<div id='f12' class='f12'>"
					+"		</div>"
					+"		<div id='f13' class='f13'>"
					+"		</div>"
					+"      <div id='f14' class='f14'>"
					+"		</div>"
					+"      <div id='f15' class='f15'>"
					+"		</div>"
					+"      <div id='f16' class='f16'>"
					+"		</div>"
					+"	</div>"

				+"");
			}
		} else {
			//如果选择的小于现有的  就再减少几条DIV
			var Nnum = eval(num)-1;
			var Nlength = eval($("#persons div").length);
			var pageNum=Nnum+Nnum;
			var totalpageLenght=$("#totalpage div").length;
			
			$("#persons div:gt("+Nnum+")").remove();
			
			$("#totalpage>div:gt("+pageNum+")").not("#totalpage div:last").remove();
		}
	}
	//打印的方法
	function print() {
		
		   //打印机设置
	     var localtor = new ActiveXObject("WbemScripting.SWbemLocator");
		 var service = localtor.ConnectServer(".");
		 var defaultPrinter = service.ExecQuery("SELECT * FROM Win32_Printer WHERE Default=True");
		 var e = new Enumerator(defaultPrinter);
		 var defauleP=e.item();			 
		 var defaultPrinterName =defauleP.Name;//系统当前默认打印机			
		
		var piccPrinter = service.ExecQuery("SELECT * FROM Win32_Printer WHERE name='EPSON TM-U220-PICC'  ");	
		var piccE = new Enumerator(piccPrinter);					
		var piccP = piccE.item();
		//修改成PICC打印机
		if(piccP==null){
			alert("保单出票打印机没有设置成功，请重新设置并且命名为【EPSON TM-U220-PICC】！");
			return;
		}else{				
			piccP.setDefaultPrinter();
		}
		 $('#coverprint').show();
		 $('#wrapper').hide();
		 
          PrintActiveX.paddingTop=0;
		  PrintActiveX.paddingRight=0;
		  PrintActiveX.paddingBottom=0;
		  PrintActiveX.paddingLeft=0;
			
	      PrintActiveX.pageWidth=670;
		  PrintActiveX.pageHeight=1270;

		$("#totalpage").show();
		PrintActiveX.Print(false);
		$("#totalpage").hide();
		// 调用打印方法
		//改回原默认打印机
		
		//打印完后 设置回去
		   if(defaultPrinterName=='EPSON TM-U220-PICC'){
				var tickPrinter = service.ExecQuery("SELECT * FROM Win32_Printer WHERE name='EPSON TM-U220 Receipt'  ");	
				//修改成PICC打印机
				if(tickPrinter!=null){
					var tickE = new Enumerator(tickPrinter);		
					var tickP = tickE.item();					
					if(tickP!=null){
						tickP.setDefaultPrinter();
					}
				}
		   }else{
			   defauleP.setDefaultPrinter();
		   }
		//打印完成后刷新页面	
		setTimeout("window.location.href='print/initPerson.action'",
					1000*$("#persons div").length);		
	}
	function reflush(){
		location.reload();
	}