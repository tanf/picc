$(function(){
	$('#checks').click(function() {
	if($(this).attr("checked")){
		$("[name='checkbox']").attr("checked",'true');//全选
	}else{
		$("[name='checkbox']").removeAttr("checked");//全不选
		}
	});
});