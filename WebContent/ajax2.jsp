<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/my.js"></script>
</head>
<script type="text/javascript">
function checkUsername(){
	//异步提交
	var username = document.getElementById("username").value;
	var msg = document.getElementById("msg");
	//利用ajax去判断是不是存在
	//1.创建一个XMLHttpRequest
	var req = getXMLHttpRequest();
	//2.建立连接
	req.open("get","CheckUsernameServlet?username="+username);
	//4.处理请求结果
	req.onreadystatechange=function(){
		if(req.readyState==4){
			if(req.status==200){
				//req.responseText
				if(req.responseText=="true"){
					//msg.innerHTML="<font color='red'>用户名已经存在！</font>";
					msg.innerHTML="<img src='image/no.gif'/>";
				}else{
					//msg.innerHTML="<font color='green'>可以用！</font>";
					msg.innerHTML="<img src='image/yes.gif'/>";
				}
			}
		}
	}



	//3.发送请求
	req.send(null);

}


</script>
<body>
<form action="">
用户名：<input type="text" name="username" id="username" onblur="checkUsername();"><span id="msg"></span>



</form>

</body>
</html>