<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<br>
		<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'north',split:true" style="height:50px">
				一级分类<select class="easyui-combobox" name="flbh1" id="attr_list_class_1" onchange="attr_list_get_class_2(this.value)">
					<option>请选择</option>
				</select>
				 二级分类<select class="easyui-combobox" name="flbh2" id="attr_list_class_2" onchange="get_attr_list(this.value)">
				 	<option>请选择</option>
				 </select>
		</div>
				<div data-options="region:'west',split:true" style="width:100px"></div>
				<div data-options="region:'center'">
					<div id="attr_list_inner_2">选择下拉选框展示属性</div>
				
				</div>
		</div>
<script type="text/javascript">

	$(function (){
		/* $.getJSON("js/json/class_1.js",function(data){
			$(data).each(function(i,json){
				$("#attr_list_class_1").append("<option value="+json.id+">"+json.flmch1+"</option>");
			});
			
		}); */
		$('#attr_list_class_1').combobox({    
		    url:'js/json/class_1.js',    
		    valueField:'id',    
		    textField:'flmch1',
		    width:80,
		    onSelect:function attr_list_get_class_2(){
				var class_1_id =$(this).combobox("getValue");
		    	$('#attr_list_class_2').combobox({    
				    url:'js/json/class_2_'+class_1_id+'.js',    
				    valueField:'id',    
				    textField:'flmch2',
				    width:80,
				    onSelect:function(){
				    	var class_2_id =$(this).combobox("getValue");
				    	get_attr_list(class_2_id);
				    }
		    	});
		    }
		});  
	});
	
	function attr_list_get_class_2(class_1_id){
		$.getJSON("js/json/class_2_"+class_1_id+".js",function(data){
			$("#attr_list_class_2").empty();
			$(data).each(function(i,json){
				$("#attr_list_class_2").append("<option value="+json.id+">"+json.flmch2+"</option>");
			});
		});
	}
	
	function get_attr_list(class_2_id){
		/* $.get("get_attr_list.do",{class_2_id:class_2_id},function(data){
			$("#attr_list_inner_2").html(data);
		}); */
		$('#attr_list_inner_2').datagrid({    
		    url:'get_attr_list_json.do',  
		    queryParams: {
		    		class_2_id:class_2_id
		    	},
		    columns:[[    
		        {field:'id',title:'属性id',width:250},    
		        {field:'shxm_mch',title:'属性名称',width:250},    
		        {field:'list_value',title:'属性值名称',width:250 ,
	        			formatter: function(value,row,index){
	        				var str="";
	        				$(value).each(function(i,json){
	        					
	        					str = str+" "+json.shxzh+json.shxzh_mch;
	        				});
	        				return str;
	        			}
		        },
		        {field:'chjshj',title:'创建时间',width:100,
		        	formatter: function(value,row,index){
						
		        		return new Date(value).toLocaleString();/*javascript 的函数  */
        			}	
		        }
		    ]]    
		});
	}




</script>
</body>
</html>