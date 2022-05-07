<%@page import="sinsang.SinsangDao"%>
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
<!-- 비밀번호가 무조건 a1234면 삭제 -->
<%
String pass=request.getParameter("pass");
String num=request.getParameter("num");

SinsangDao dao=new SinsangDao();

//비밀번호 확인후 맞으면 dao.deleteSinsang()호출
//틀리면 이전화면으로 이동
if(pass.equals("a1234"))
{
	//삭제시 필요한 num값도 전달해야한다
	//response.sendRedirect("ssdelete.jsp?num="+num);
	//목록으로 이동
	dao.deleteSinsang(num);
	response.sendRedirect("sslist.jsp");
}
else
{%>
	<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다");
	history.back();
	</script>
<%
}
%>
</body>
</html>