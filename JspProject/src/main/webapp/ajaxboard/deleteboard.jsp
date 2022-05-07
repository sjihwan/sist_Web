<%@page import="ajaxboard.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num=request.getParameter("num");

//DAO선언후 deleteBoard()함수 호출
AjaxBoardDao db=new AjaxBoardDao();
db.deleteBoard(num);
%>