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
//파라미터 넘겨받기
String num = request.getParameter("num");
String pass = request.getParameter("pass");

//MemberDao
MemberDao dao = new MemberDao();

//해당 데이터의 비밀번호가 맞는지 체크
boolean b = dao.checkPass(num, pass);
//맞으면 삭제
if(b) {
	dao.deleteMember(num);
	response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
}else {%>
	<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다!!");
	history.back(); //이전으로 ==> "../index.jsp?main=member/memberlist.jsp"
	</script>
<%
}
%>
</body>
</html>