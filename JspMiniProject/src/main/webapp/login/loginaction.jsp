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
//myid,pass,saveid 읽기
String myid = request.getParameter("myid");
String pass = request.getParameter("pass");
String saveok = request.getParameter("saveok");

//DAO getLogin호출
MemberDao dao = new MemberDao();
int idx = dao.isIdPass(myid, pass);

if(idx==1)
{
	//session 3개 저장
	session.setAttribute("myid", myid);
	session.setAttribute("saveok", saveok==null? "no": "yes");
	session.setAttribute("loginok", "yes");
	
	session.setMaxInactiveInterval(60*60); //1시간 유지
	
	response.sendRedirect("../index.jsp?main=login/loginmain.jsp");
} else if(idx==2) {%>
	<script type="text/javascript">
	alert("비밀번호가 맞지 않습니다");
	history.back();
	</script>
<%
} else if(idx==3) {%>
	<script type="text/javascript">
	alert("가입되지 않은 아이디입니다");
	history.back();
	</script>
<%
}
%>
</body>
</html>