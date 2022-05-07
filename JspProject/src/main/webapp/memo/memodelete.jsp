<%@page import="memo.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//num읽기
String num=request.getParameter("num");

//dao선언
MemoDao dao=new MemoDao();

//delete메서드 호출
dao.deleteMemo(num);
%>