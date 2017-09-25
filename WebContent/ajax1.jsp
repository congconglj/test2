<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/my.js">
</script>
</head>
<script type="text/javascript">
window.onload = function(){
	//实现ajax异步提交
	//1.创建XMLHttpRequest对象
	var xmlHttp = getXMLHttpRequest();
	 //4.处理请求结果
	 xmlHttp.onreadystatechange = function(){
		// alert(xmlHttp.readyState);
		 if(xmlHttp.readyState==4){//请求完成
			 //alert(xmlHttp.status);
		 if(xmlHttp.status==200){
			 alert(xmlHttp.responseText);
		 }
		 }
	 }
	 
	 //2.建立与服务器的连接:三个参数：method，url，asyn
	 xmlHttp.open("get","AjaxServlet");
	//3.发送请求
	xmlHttp.send(null);//get方式提交，参数为null，post方式提交，content是参数：
}


</script>
<body>

</body>
</html>