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
window.onload=function(){
	//1.获取搜索框的信息
	var search = document.getElementById("search");
	//2.div
	var divMessage = document.getElementById("contextDiv");
	//
	search.onkeyup=function(){
		var name = this.value;
		if(name==""){
			//div隐藏，如果那么为空
			divMessage.style.display="none";
			return;
		}
		//1.获得对象
		var req = getXMLHttpRequest();
		//2.建立连接
		req.open("get","AjaxSearchServlet?searname="+name);
		//4.处理请求
		req.onreadystatechange=function(){
			if(req.readyState==4){
				if(req.status==200){
					var data = req.responseText;
					//苹果1，苹果2
					var ss = data.split(",");//切割字符串，存到ss数组
					var childDivs = "";
					//循环把数据放到小的div
					for(var i=0;i<ss.length;i++){
						childDivs+="<div onclick='writeText(this)' onmouseover='changeBackground_over(this)' onmouseout='changeBackground_out(this)'>"+ss[i]+"</div>";
					}
					//把多个小div的数据放到大的div中
					divMessage.innerHTML=childDivs;
					divMessage.style.display="block";
				}
			}
		}
		//3.发送请求
		req.send(null);
		
		
		
		
		
		
		
	}
}
function changeBackground_over(div){
	div.style.backgroundColor="gray";
}
function changeBackground_out(div){
	div.style.backgroundColor="";
}
//填充文本框
function writeText(div){
	//获取搜索文本框
	var searchname = document.getElementById("search");
	searchname.value= div.innerHTML;
	div.parentNode.style.display="none";
}
</script>
<body>
<form action="">
搜索<input type="text" name="search"   id="search" ><input type="submit"  value="查询">

</form>
<div id="contextDiv" style="border:1px solid red; width:173px;position:absolute;left:40px;top:30px;"></div>
</body>
</html>