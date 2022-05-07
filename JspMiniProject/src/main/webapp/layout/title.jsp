<%@page import="data.dao.MyshopDao"%>
<%@page import="data.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
div>a>img {
	padding-top: 25px;
}
div.cart {
	float: right;
	cursor: pointer;
	margin-left: 15px;
}
span.carticon {
	font-size: 30px;
}
div.count {
	background-color: red;
	color: white;
	height: 20px;
	width: 20px;
	border-radius: 100px;
	float: right;
	text-align: center;
}
</style>
<script type="text/javascript">
$(function(){
	$("div.cart").click(function(){
		location.href = "index.jsp?main=myshop/mycart.jsp";
	});
});
</script>
</head>
<%
String root = request.getContextPath();
%>
<body>
<div style="text-align: center;">
	<a href="<%= root %>/">
		<img alt="" src="<%= root %>/image/title.png" width="400px;">
	</a>
</div>

<div style="float: right; padding-right: 100px;">
<%
String loginok = (String)session.getAttribute("loginok");
String myid = (String)session.getAttribute("myid");
MemberDao dao = new MemberDao();
String name = dao.getName(myid);
// MyshopDao 선언
MyshopDao sdao = new MyshopDao();
// 카트에 담긴 상품갯수
int cartSize = sdao.getCartList(myid).size();

if(loginok==null){%>
	<button type="button" class="btn btn-success"
	onclick="location.href='index.jsp?main=login/loginform.jsp'">Login</button>	
<%
} else {%>
	<b style="font-size: 12pt;"><%= name %>님 환영합니다</b>
	<button type="button" class="btn btn-success"
	onclick="location.href='login/logoutaction.jsp'">Logout</button>
	
	<div class="cart">
		<span class="carticon glyphicon glyphicon-shopping-cart"></span>
		<div class="count"><%= cartSize %></div>
	</div>
<%
}
%>
</div>
</body>
</html>
