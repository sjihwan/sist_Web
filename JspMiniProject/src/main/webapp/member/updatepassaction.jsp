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
request.setCharacterEncoding("utf-8");

String num = request.getParameter("num");
String pass = request.getParameter("pass");

//DAO
MemberDao dao = new MemberDao();
//num에 해당하는 비밀번호 확인
boolean b = dao.checkPass(num, pass);
//맞게 입력했다면 updateform으로
if(b) {
	//num값을 넘겨줌
	response.sendRedirect("../index.jsp?main=member/updateform.jsp?num=" + num);
}else {
	//비밀번호가 일치하지 않습니다
	%>
	<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다!!");
	history.back(); //이전으로 ==> "../index.jsp?main=member/memberlist.jsp"
	</script>
<%
}
%>
</body>
</html>