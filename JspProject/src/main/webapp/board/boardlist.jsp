<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="board.BoardDao"%>
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
BoardDao db = new BoardDao();
/* List<BoardDto> list = db.getAllDatas(); */

//페이징 처리에 필요한 변수
int totalCount; //총 글수
int totalPage; //총 페이지수
int startPage; //각 블럭의 시작페이지
int endPage; //각 블럭의 끝페이지
int start; //각 페이지의 시작번호
int perPage = 5; //한페이지에 보여질 글갯수
int perBlock = 5; //한블럭당 보여지는 페이지갯수
int currentPage; //현재페이지

int no;

//총 갯수
totalCount = db.getTotalCount();

//현재 페이지번호 읽기(단 null일경우는 1페이지로 설정)
if(request.getParameter("currentPage")==null)
	currentPage = 1;
else
	currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총페이지 갯수 구하기
totalPage = totalCount/perPage + (totalCount%perPage==0? 0:1);

//각블럭의 시작페이지
//예: 현재페이지가 3인경우 startpage1, endpage5
//현재페이지가 6인경우 startpage = 6, endpage = 10
startPage=(currentPage-1)/perBlock*perBlock+1;
endPage = startPage+perBlock-1;

//만약 총페이지가 8 -2번째블럭: 6-10 ..이럴경우는 endpage가 8로 수정되어야함
if(endPage > totalPage)
	endPage = totalPage;

//각페이지에서 불러올 시작번호
start = (currentPage -1) * perPage;

//각페이지에서 필요한 게시글 가져오기
List<BoardDto> list = db.getList(start, perPage);

//각 글앞에 붙일 시작번호 구하기
//총글이 20개면? 1페이지(20~) 2페이지(15~) 3페이지(10~) 부터 출력해서 1씩 감소
no = totalCount-(currentPage-1)*perPage;
%>
<div class="container">
<div class="alert alert-info" style="width: 800px;">
<%-- <b>총 <%= list.size() %>개의 글이 있습니다</b> --%>
<b>총 <%= totalCount %>개의 글이 있습니다</b>
</div>
<br>
<table class="table table-bordered" style="width: 800px;">
	<caption><b>게시판 목록 출력</b>
		<button type="button" class="btn btn-success btn-sm"
		onclick="location.href='boardform.jsp'"
		style="margin-left: 600px;">글쓰기</button>
	</caption>
	<tr style="background-color: #ffdd33">
		<th style="width: 70px;">번호</th>
		<th style="width: 400px;">제목</th>
		<th style="width: 100px;">작성자</th>
		<th style="width: 120px;">작성일</th>
		<th style="width: 70px;">조회</th>
	</tr>	
	<%
	//출력할 날짜형식
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	for(BoardDto dto:list)
	{
		%>
		<tr>
			<!-- 번호 -->
			<td align="center"><%= no-- %></td>
		
			<!-- 제목..내용보기로 연결 -->
			<td>
				<a href="content.jsp?num=<%= dto.getNum() %>">
					<img src="../photo/<%= dto.getImgname() %>"
					style="width: 30px; height: 30px;">
					<%= dto.getSubject() %>
				</a>
			</td>
			<!-- 작성자 -->
			<td><%= dto.getWriter() %></td>
			<!-- 작성일 -->
			<td><%= sdf.format(dto.getWriteday()) %></td>
			<!-- 조회수 -->
			<td><%= dto.getReadcount() %></td>
		</tr>
	<%
	}
	%>
</table>
</div>

<!-- 페이징처리 -->
<div style="width: 500px; text-align: center;" class="container">
	<ul class="pagination">
	<%
	//이전
	if (startPage > 1)
	{%>
		<li>
			<a href="boardlist.jsp?currentPage=<%= startPage-1 %>">이전</a>
		</li>
	<%
	}
	for (int pp = startPage; pp <= endPage; pp++)
	{
		if (pp == currentPage)
		{%>
			<li class="active">
				<a href="boardlist.jsp?currentPage=<%= pp %>"><%= pp %></a>
			</li>
		<%
		} else {%>
			<li>
				<a href="boardlist.jsp?currentPage=<%= pp %>"><%= pp %></a>
			</li>
		<%
		}
	}
	
	//다음
	if (endPage < totalPage)
	{%>
		<li>
			<a href="boardlist.jsp?currentPage=<%= endPage+1 %>">다음</a>
		</li>
	<%
	}
	%>
	</ul>
</div>

</body>
</html>