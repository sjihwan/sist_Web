<%@page import="ajaxboard.AjaxBoardDto"%>
<%@page import="ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//post방식
request.setCharacterEncoding("utf-8");

//각각의 파라미타값 얻기
String num=request.getParameter("unum");
String writer=request.getParameter("uwriter");
String subject=request.getParameter("usubject");
String content=request.getParameter("ucontent");
String avata=request.getParameter("uavata");

//DTO선언, 
AjaxBoardDto dto=new AjaxBoardDto();
dto.setNum(num);
dto.setWriter(writer);
dto.setSubject(subject);
dto.setContent(content);
dto.setAvata(avata);

//DAO선언
AjaxBoardDao db=new AjaxBoardDao();
db.updateBoard(dto);
%>