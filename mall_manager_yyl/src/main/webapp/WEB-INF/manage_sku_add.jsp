<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isELIgnored="false"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath %>">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>硅谷商城</title>
</head>
<body>
	<h2>库存单元添加</h2>
	<form action="save_sku.do" method="post">
		
		一级分类<select name="flbh1" id="sku_class_1" onchange="sku_get_class_2(this.value)"></select>
		二级分类<select name="flbh2" id="sku_class_2" onchange="sku_get_attr(this.value)"></select>
		商品品牌<select name="pp_id" id="sku_tm" onchange="get_spu()"></select>
		商品信息<select name="shp_id" id="sku_spu" onchange="show_sku_form()"></select>
		
		<hr>
		<div id="attr_list_inner"></div>
		
		<div id="sku_form_inner" style="display:none;">
			<jsp:include page="manage_sku_form.jsp"></jsp:include>
		</div>
		
		<input type="submit" value="提交"/>
		
	</form>
<script type="text/javascript">
	$(function (){
		$.getJSON("js/json/class_1.js",function(data){
			
			$(data).each(function(i,json){
				$("#sku_class_1").append("<option value="+json.id+">"+json.flmch1+"</option>");
			});
		});
	});
	
	function sku_get_class_2(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#sku_class_2").empty();
			$(data).each(function(i,json){
				$("#sku_class_2").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
		});
		sku_get_tm(class_1_id);
	}
	
	function sku_get_tm(class_1_id){
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#sku_tm").empty();
			$(data).each(function(i,json){
				$("#sku_tm").append("<option value="+json.id+">"+json.ppmch+"</option>");
			});
		});
	}
	
	function sku_get_attr(class_2_id){
		$.get("sku_get_attr.do",{class_2_id:class_2_id},function(data){
			$("#attr_list_inner").html(data);
		});
	}

	function get_spu(){
		var class_2_id = $("#sku_class_2").val();
		var pp_id = $("#sku_tm").val();	
		$.get("get_spu_list.do",{class_2_id:class_2_id,pp_id:pp_id},function(data){
			$("#sku_spu").empty();
			$(data).each(function(i,json){
				$("#sku_spu").append("<option value="+json.id+">"+json.shp_mch+"</option>");
			});
		});
	}

	function show_sku_form(){
		$("#sku_form_inner").show();
	}
</script>	
</body>
</html>