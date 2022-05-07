<%@page import="memo.MemoDto"%>
<%@page import="memo.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//dao선언
MemoDao dao=new MemoDao();

//인코딩 <- post
request.setCharacterEncoding("utf-8");

//데이터 읽기
//getParameter(name)
String writer=request.getParameter("writer");
String content=request.getParameter("content");
String avatar=request.getParameter("avatar");

//DTO로 묶어주기
MemoDto dto=new MemoDto();
dto.setWriter(writer);
dto.setContent(content);
dto.setAvatar(avatar);

//DAO insert호출
dao.insertMemo(dto);
%>