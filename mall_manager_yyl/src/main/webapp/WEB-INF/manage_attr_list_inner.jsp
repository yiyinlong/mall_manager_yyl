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
<script type="text/javascript">
	function show_value(attr_id,checked){
		
		if(checked){
			$("#attr_value_"+attr_id).show();
		}else{
			$("#attr_value_"+attr_id).hide();
		}
		
	}
</script>
<title>硅谷商城</title>
</head>
<body>

<h2>选择平台属性列表</h2><!--varStatus="status" 看做是索引数 ,可以使遍历的选框中的name不同,不成为同一组数据,
					可以不同复选框中的单选框自成一组,不会多组复选框的单选框成为一组,只能选一个radio数据-->
	<c:forEach items="${list_attr}" var="attr" varStatus="status">
		<input type="checkbox" name="list_sku_av[${status.index}].shxm_id" value="${attr.id}" onclick="show_value(${attr.id},this.checked)">${attr.shxm_mch}
	</c:forEach>
	<hr>
	<c:forEach items="${list_attr}" var="attr" varStatus="status">
		<div id="attr_value_${attr.id}" style="display: none;">
			<c:forEach items="${attr.list_value}" var="val" >
				<input type="radio" value="${val.id}" name="list_sku_av[${status.index}].shxzh_id"/> ${val.shxzh} ${val.shxzh_mch}
			</c:forEach>
		<br>
		</div>
	</c:forEach>







</body>
</html>