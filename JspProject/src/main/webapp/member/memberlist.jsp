<%@page import="member.MemberDao"%>
<%@page import="member.MemberDto"%>
<%@page import="java.util.ArrayList"%>
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
body * {
	font-family: "휴먼편지체";
	font-size: 13pt;
}
</style>
</head>
<body>
<%
MemberDao dao=new MemberDao();
ArrayList<MemberDto> list=dao.getAllDatas();
%>
<b style="font-size: 10pt;">
	<a href="form.html"><button type="button" class="btn btn-info">데이터 추가</button></a>
</b>
<hr>
<table class="table table-bordered" style="width: 600px;">
  <caption><b>Member목록</b></caption>
  <tr>
    <th width="60">번호</th>
    <th width="80">이름</th>
    <th width="150">연락처</th>
    <th width="150">날짜</th>
    <th width="80">수정/삭제</th>
  </tr>
  
  <%
  for(int i=0; i<list.size(); i++){
	  MemberDto dto=list.get(i);
	  %>
	  <tr>
	    <td align="center"><%= i+1 %></td>
	    <td><%= dto.getName() %></td>
	    <td><%= dto.getHp() %></td>
	    <td><%= dto.getSdate() %></td>
	    <td>
	      <button type="button" class="btn btn-info btn-xs"
	      onclick="location.href='updateform.jsp?num=<%=dto.getNum()%>'">수정</button>
	      <button type="button" class="btn btn-danger btn-xs"
	      onclick="location.href='memberdelete.jsp?num=<%= dto.getNum() %>'">삭제</button>
	    </td>
	  </tr>
  <%
  }
  %>
</table>
</body>
</html>