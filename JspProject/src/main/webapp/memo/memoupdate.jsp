<%@page import="memo.MemoDao"%>
<%@page import="memo.MemoDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//인코딩
request.setCharacterEncoding("utf-8");

//num,writer,content,avatar
String num=request.getParameter("unum");
String writer=request.getParameter("uwriter");
String content=request.getParameter("ucontent");
String avatar=request.getParameter("uavatar");

//dto에 넣어주기
MemoDto dto=new MemoDto();
dto.setNum(num);
dto.setWriter(writer);
dto.setContent(content);
dto.setAvatar(avatar);

//dao선언
//수정메서드 호출
MemoDao dao=new MemoDao();
dao.updateMemo(dto);
%>