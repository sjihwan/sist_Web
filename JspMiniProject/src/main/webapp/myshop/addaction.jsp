<%@page import="data.dao.MyshopDao"%>
<%@page import="data.dto.MyshopDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
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
// 실제 서버에 저장될 경로 선언
String realPath = getServletContext().getRealPath("/myshopsave");
// 파일 최대크기
int uploadSize = 1024*1024*3;

try{
	MultipartRequest multi = null;
	multi = new MultipartRequest(request, realPath, uploadSize, "utf-8", new DefaultFileRenamePolicy());
	
	String category = multi.getParameter("category");
	String sangpum = multi.getParameter("sangpum");
	String photo = multi.getFilesystemName("photo");
	String price = multi.getParameter("price");
	String ipgoday = multi.getParameter("ipgoday");
	
	//DTO세팅
	MyshopDto dto = new MyshopDto();
	dto.setCategory(category);
	dto.setSangpum(sangpum);
	dto.setPhoto(photo);
	dto.setPrice(Integer.parseInt(price));
	dto.setIpgoday(ipgoday);
	
	//DAO_Insert
	MyshopDao dao = new MyshopDao();
	dao.insertShop(dto);
	
	response.sendRedirect("../index.jsp?main=myshop/addform.jsp");
} catch(Exception e) {
	e.getMessage();
}
%>
</body>
</html>