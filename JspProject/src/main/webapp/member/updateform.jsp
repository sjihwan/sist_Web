<%@page import="member.MemberDto"%>
<%@page import="member.MemberDao"%>
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
<%
String num=request.getParameter("num");

MemberDao dao=new MemberDao();
MemberDto dto=dao.getData(num);
%>
<body>
<form action="updateformproc.jsp" method="post">
  <table class="table table-bordered" style="width: 350px;">
    <tr>
      <th>이름</th>
      <td>
        <input type="text" name="name" size="7"
        value="<%= dto.getName() %>">
      </td>
    </tr>
    <tr>
      <th>연락처</th>
      <td>
        <input type="text" name="hp" size="20"
        value="<%= dto.getHp() %>">
      </td>
    </tr>
    <tr>
      <td colspan="2" align="center">
      	<!-- hidden으로 num을 넘겨준다..위치는 폼 안에만 있으면 됨 -->
      	<input type="hidden" name="num" value="<%= num %>">
        <input type="submit" value="수정" class="btn btn-info">
        <input type="button" value="목록"
        onclick="location.href='memberlist.jsp'"
        class="btn btn-danger">
      </td>
    </tr>
  </table>
</form>
</body>
</html>