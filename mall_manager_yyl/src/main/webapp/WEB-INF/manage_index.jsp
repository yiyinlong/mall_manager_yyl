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

<link rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

	$(function(){
		var url = "${url}";
		var title ="${title}";
		add_tab(url,title);
	});
	
	function add_tab(url,title){
		
		var exis = $('#tt').tabs('exists',title);
		if(exis){
			$('#tt').tabs('select',title);  
		}else{
			/* var url= "goto_spu_add.do"; */
			
			// add a new tab panel    
			$('#tt').tabs('add',{    
			    title:title,    
			    href:url,    
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			            alert('refresh');    
			        }    
			    }]    
			});
		}

		
	}
	function add_tab_test(url,title){/*这是ui和jquery结合着使用,不建议这样用,最好是单独的使用ui框架自己的函数  */
		var url= "goto_spu_add.do";
		
		$.get(url,function(data){
			// add a new tab panel    
			$('#tt').tabs('add',{    
			    title:title,    
			    content:data,    
			    closable:true,    
			    tools:[{    
			        iconCls:'icon-mini-refresh',    
			        handler:function(){    
			            alert('refresh');    
			        }    
			    }]    
			});
		});
	}
</script>
<title>硅谷商城</title>
</head>
<body class="easyui-layout">
	
	
	  
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px"><h2>后台管理首页</h2></div>
	<div data-options="region:'west',split:true,title:'West'" style="width:200px;padding:10px;">
		<div class="easyui-accordion" style="width:160px;height:300px;">
			<div title="商品管理系统">
				<ul class="easyui-tree">
					
						<li>
							<span>商品管理</span>
							<ul>
								<li>
									<span>商品信息管理</span>
										<ul>
											<li>商品信息查询</li>
											<li><a href="javascript:add_tab('goto_spu_add.do','商品信息添加');">商品信息添加</a></li>
										</ul>
								</li>
							
								<li><span>商品属性管理 </span>
										<ul>
											<li><a href="javascript:add_tab('goto_attr_list.do','商品属性查询');">商品属性查询</a></li>
											<li><a href="javascript:add_tab('goto_attr_add.do','商品属性添加');">商品属性添加</a></li>
										</ul>
								</li>
								
								<li><span>商品库存单元管理 </span>
										<ul>
											<li>商品库存单元查询</li>
											<li>  <a href="javascript:add_tab('goto_sku_add.do','商品库存单元添加');">商品库存单元添加</a></li>
										</ul>
								</li>
							</ul>
						</li>
				</ul>
			</div>
				
						<div title="订单管理"></div>
		</div>
	</div>
	
	<div data-options="region:'east',split:true,collapsed:true,title:'East'" style="width:100px;padding:10px;">east region</div>
	<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
	<div data-options="region:'center',title:'Center'">
		<div id="tt" class="easyui-tabs" style="height: 500px"> 
		
		
		</div>
		
	
	</div>

	</div>
</body>
</html>