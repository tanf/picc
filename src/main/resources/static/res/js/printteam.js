var hkey_root,hkey_path,hkey_key;
hkey_root="HKEY_CURRENT_USER";
hkey_path="\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
var id;
 function cycle(){
	 var RegWsh = new ActiveXObject("WScript.Shell");
     hkey_key="header";
     RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"");
     hkey_key="footer";
     RegWsh.RegWrite(hkey_root+hkey_path+hkey_key,"");
	 $("#barcode").focus();
	 id=window.setInterval(ajaxInit, 2000);
	//取消定时执行	
}
   function ajaxInit(){
	   if($("#barcode").val()=="" || $("#barcode").val().length<6){
		   return;
	   }if(isNaN($("#barcode").val())){
		   alert("条件码必须是数字！");
		   return;
	   }if($("#barcode").val().length!=20 && $("#barcode").val().length!=6){
		   alert("必须是20位的条件码或者6位的行程单号！");
		   return;
	   }else{
		   window.clearInterval(id);
	   }
   			$.ajax({
				   type: "POST",
				   url: "print/ajaxTeam.action",
				   data:"print.barcode="+$("#barcode").val()+"&ticket_no="+$("#tickets").val()+
				   "&print.product="+$("#potype_code").val(),
				   success: function(msg){
					   if(msg=='rosternums0'){
						   alert("系统不允许名单为空！如要处理请联系管理员！");
						   location.reload();
						   return;
					   }
					   if(msg=='hodoExist'){
						   alert("所输入的行程单号已存在，请重新输入！");
						   location.reload();
						   return;
					   }
					   if(msg=='ticknull'){
						   alert("此窗口暂无未打印出票信息，请确认是否已出票！");
						   location.reload() ;
						   return;
					   }
						if(msg=='docu_null'){
							alert("单证号使用完毕，请联系管理员进行发放！");
							location.reload() ;
							return;
						}
						if(msg=='poli_null'){
							alert("保单号使用完毕，请联系管理员进行发放！");
							location.reload();
							return;
						}
						//将从服务器拿到的值
						var params=msg.split(",");
						$("#docuno").val(params[0]);
						//生成保险单号时  查找一下保险类型进行组装
						var potype=$("#insurance").val();
						
						
						$("#tick").val(params[5]);
						$("#polino").val(params[1]);
						$("#num").val(params[2]);
						$("#f14").text(params[3]);
						$("#docuno").attr("readonly","true");
						$("#num").attr("readonly","true");
						$("#polino").attr("readonly","true");
						$("#f13").text(params[4]);
				 }
		}); 
   }
   function changProduct(value){
	   if($("#polino").val()==null || $("#polino").val()==""){
		   return;
	   }
	   var poli_no= $("#polino").val();	 
	   var product=value.split(",");
	   var newPoli_no="P"+product[2].toUpperCase()+poli_no.substring(4);
	   $("#polino").val(newPoli_no);   
   }
   function print(){
	   if($("#docuno").val()==null || $("#docuno").val()==""){
		   alert("请先扫描条形码或输入行程单号！");
		   return;
	   }
	   if($("#barcode").val().length!=20 && $("#barcode").val().length!=6){
		   alert("必须是20位的条件码或者6位的行程单号！");
		   return;
	   }
	   //将打印DIV里的各值赋值
	   $("#f1").text($("#docuno").val());
	   $("#f2").text($("#polino").val());
	   $("#f16").text($("#polino").val());
	   $("#f4").text($("#num").val());
	   var d = new Date();
	   str = '';
	   str += d.getFullYear()+'/';
	   str  += d.getMonth() + 1+'/';
	   str  += d.getDate()+' ';
	   str += d.getHours()+':';
	   str  += d.getMinutes();
	   $("#f15").text(str);
	   
	   
	   $("#f6").text($("#barcode").val().substring(0,6));
	   
	   var product=$("#potype_code").val().split(",");
	   //总保额
	   $("#f7").text(product[3]+"万");
	   $("#f8").text(product[4]+"万");
	   $("#f9").text(product[5]+"万");
	   $("#f10").text(product[6]+"万");
	   $("#f11").text(product[7]);
	   $("#f12").text(product[7]*$("#num").val());
	   
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
		    $("#coverprint").show();
	        $("#wrapper").hide();
		  
            PrintActiveX.paddingTop=0;
			PrintActiveX.paddingRight=0;
			PrintActiveX.paddingBottom=0;
			PrintActiveX.paddingLeft=0;
			
		   
			PrintActiveX.pageWidth=670;
			PrintActiveX.pageHeight=1270;
 

		   $("#totalpage").show();
		   PrintActiveX.Print(false);
		   $("#totalpage").hide();
		  
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
		setTimeout("$(\"form:first\").submit()", 2000);
   }