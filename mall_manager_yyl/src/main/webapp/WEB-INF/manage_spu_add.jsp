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
<!-- <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
 --><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>硅谷商城</title>
</head>
<body><br>
		<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'north',split:true" style="height:50px">
				一级分类<select name="flbh1" id="spu_class_1" onchange="spu_get_class_2(this.value)"></select>
				 二级分类<select name="flbh2" id="spu_class_2"></select>
				 商品品牌<select name="pp_id" id="spu_tm"></select>
		</div>
				<div data-options="region:'west',split:true" style="width:100px"></div>
				<div data-options="region:'center'">
				
					<form action="save_spu.do" method="post" enctype="multipart/form-data">
						商品名称: <input name="shp_mch" type="text" value="测试商品输入" /><br> 
						商品描述: <textarea name="shp_msh" >测试商品描述</textarea><br> 
						选择上传图片:<br>
						<div id="button_id" style="border:#666 1px solid;width:100px;height:100px">
							<img  id="img_0" title="请添加图片" src="image/short.JPG" width="100 px" onclick="button_img_click(0)"><br>
							<input id="file_0" name="files" type="file" onchange="button_img_change(0)" style="display: none;"/><br>
						</div><br><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input align="bottom" type="submit" value="提交" />
					</form>
				
				</div>
		</div>
	
	
	<script type="text/javascript">
	$(function (){
		$.getJSON("js/json/class_1.js",function(data){
			$(data).each(function(i,json){
				$("#spu_class_1").append("<option value="+json.id+">"+json.flmch1+"</option>");
				
				
			});
			
		});
	});
	
	function spu_get_class_2(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#spu_class_2").empty();
			$(data).each(function(i,json){
				$("#spu_class_2").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
		});
		spu_get_tm(class_1_id);
	}
	
	function spu_get_tm(class_1_id){
		$.getJSON("js/json/tm_class_1_"+class_1_id+".js",function(data){
			$("#spu_tm").empty();
			$(data).each(function(i,json){
				$("#spu_tm").append("<option value="+json.id+">"+json.ppmch+"</option>");
			});
		});
	}
	
	function button_img_click(index){
		
		$("#file_"+index).click();//双线程,1浏览器加载图片到缓存,2加载函数下面的js(快)
		
		
	}
	function button_img_change(index){//input中写了onchange说明发生change的时候调用此函数
		
		//获得图片缓存,转化为url对象,替换ima_0的src属性
		var file = $("#file_"+index)[0].files[0];
		
		var url = window.URL.createObjectURL(file);
		
		$("#img_"+index).attr("src",url);
		
		add_button(index);
		
	}
	
	function add_button(index){//这是一个动态追加的一个套路代码
		var a ='<img id="img_'+(index+1)+'" title="请添加图片" src="image/short.JPG" width="100 px" onclick="button_img_click('+(index+1)+')"><br>';
		var b ='<input id="file_'+(index+1)+'" name="files" type="file" onchange="button_img_change('+(index+1)+')" style="display: none;"/><br>';
		
		//如果用户选择的是最后一张示例图片,那么追加图片(空格是层级选择器,:表单选择器,fiel元素选择器)
		var length = $("#button_id :file").length;
		if((index+1)==length){//用代码判断用户的行为(如果没有这里的控制语句,点击那里都会追加,索引会错误)
		$("#button_id").append(a+b);
		}
		//其余情况不追加图片,只是改变当前的图片
	}
</script>
</body>
</html>