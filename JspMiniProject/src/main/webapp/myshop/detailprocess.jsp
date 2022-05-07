<%@page import="data.dto.CartDto"%>
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
</head>
<body>
<%
/* request.setCharacterEncoding("utf-8");

String shopnum = request.getParameter("shopnum");
String num = request.getParameter("num");
int cnt = Integer.parseInt(request.getParameter("cnt"));

CartDto dto = new CartDto();
dto.setShopnum(shopnum);
dto.setNum(num);
dto.setCnt(cnt);

// 장바구니에 담기
MyshopDao msdao = new MyshopDao();
msdao.insertCart(dto); */
%>
<jsp:useBean id="dao" class="data.dao.MyshopDao"/>
<jsp:useBean id="dto" class="data.dto.CartDto"/>
<jsp:setProperty property="*" name="dto"/>
<%
dao.insertCart(dto);
%>
</body>
</html>