<%@page import="data.dto.AnswerDto"%>
<%@page import="data.dao.AnswerDao"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="java.util.List"%>
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
span.day {
	float: right;
	font-size: 11pt;
	color: gray;
}
</style>
<script type="text/javascript">
$(function(){
	//추천 클릭_ 추천수 +1 증가
	$("span.likes").click(function(){
		var num = $(this).attr("num");
		var tag = $(this); //object Object
		//alert(tag);
		
		$.ajax({
			type:"get",
			dataType:"json",
			url:"guest/ajaxlikechu.jsp",
			data:{"num":num},
			success:function(data){
				//alert(data.chu);
				tag.next().text(data.chu);
				tag.next().next().animate({
					"font-size":"10pt"
				}, 500, function(){
					//애니메이션이 끝난후 다시 글꼴 0pt로 변경
					$(this).css("font-size", "0pt");
				});
			}
		});
	});
	
	//댓글부분 무조건 안보이게
	$("div.answer").hide();
	//댓글 클릭시...보였다 안보였다
	$("span.answer").click(function(){
		$(this).parent().find("div.answer").toggle();
	});
	
	//댓글삭제 이벤트_ajax로 데이터 불러오기
	//새로고침..location.reload()
	$("span.adel").click(function(){
		var idx = $(this).attr("idx");
		//alert(idx);
		
		$.ajax({
			type: "get",
			dataType: "html",
			url: "guest/answerdelete.jsp",
			data: {"idx":idx},
			success: function() {
				//새로고침
				location.reload();
			}
		});
	});
});
</script>
</head>
<body>
<%
//로그인상태...세션으로부터 불러온다
String loginok = (String)session.getAttribute("loginok");

//DAO선언
GuestDao dao = new GuestDao();

////////////////////////////////////////////////////////////////////////////
//페이징 처리에 필요한 변수
int totalCount; //총 글수
int totalPage; //총 페이지수
int startPage; //각 블럭의 시작페이지
int endPage; //각 블럭의 끝페이지
int start; //각 페이지의 시작번호
int perPage = 3; //한페이지에 보여질 글갯수
int perBlock = 5; //한블럭당 보여지는 페이지갯수
int currentPage; //현재페이지

//총 글 갯수
totalCount = dao.getTotalCount();

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
List<GuestDto> list = dao.getList(start, perPage);
////////////////////////////////////////////////////////////////////////////

// 로그인 상태이면 guestform페이지를 보여주어 방명록 등록할 수 있다
if(loginok!=null) {%>
	<jsp:include page="guestform.jsp"/>
	<hr align="left" width="700">
<%
}
%>
<!-- <b>방명록 리스트 출력</b> -->
<div>
	<b>총 <%= totalCount %>개의 방명록 글이 있습니다.</b>
	<%
	//이름을 얻기위해 dao선언
	MemberDao mdao = new MemberDao();
	for(GuestDto dto:list)
	{
		// 방명록 작성자 이름_getName(작성자 아이디)
		String name = mdao.getName(dto.getMyid());
		%>
		<table class="table table-borderd" style="width: 600px;">
			<tr>
				<td>
					<!-- 방명록 작성자 이름 -->
					<b><span class="glyphicon glyphicon-user"></span><%= name %>(<%= dto.getMyid() %>)</b>
					<%
					// myid_접속중인 아이디...세션으로부터 가져옴
					String myid = (String)session.getAttribute("myid");
					// (접속중인 아이디 = 방명록 작성자)일 경우_수정,삭제 링크 활성화
					if(loginok!=null && dto.getMyid().equals(myid))
					{%>
						<a href="index.jsp?main=guest/updateform.jsp?num=<%=dto.getNum()%>&currentPage=<%= currentPage %>">수정</a>
						|
						<a href="guest/deleteaction.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>">삭제</a>
					<%
					}
					// 작성일자
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
					%>
					<span class="day"><%= sdf.format(dto.getWriteday()) %></span>
				</td>
			</tr>
			
			<tr height="120">
				<td>
					<!-- 이미지 -->
					<a href="save/<%= dto.getPhotoname() %>" target="_blank">
						<img alt="" src="save/<%= dto.getPhotoname() %>" align="left" style="width: 150px; margin-right: 20px;">
					</a>
					<!-- 내용 -->
					<%= dto.getContent().replace("\n", "<br>") %> <!-- 줄바꿈 적용 -->
				</td>
			</tr>
			
			<!-- 댓글, 추천 -->
			<tr>
				<td>
					<%
					//각 방명록에 달린 댓글 목록 가져오기
					AnswerDao adao = new AnswerDao();
					List<AnswerDto> alist = adao.getAllAnswer(dto.getNum());
					%>
					<span class="answer" style="cursor: pointer;" num=<%= dto.getNum() %>>댓글 <%= alist.size() %></span>
					<span class="likes" style="cursor: pointer;" num=<%= dto.getNum() %>>추천</span>
					<span class="chu"><%= dto.getChu() %></span>
					<span class="glyphicon glyphicon-heart" style="color: red; font-size: 0pt;"></span>
					
					<!-- 댓글입력폼 -->
					<div class="answer">
						<%
						// 로그인 상태일 경우
						if(loginok!=null){%>
							<div class="answerform">
								<form action="guest/answerinsert.jsp" method="post">
									<!-- hidden -->
									<input type="hidden" name="num" value="<%=dto.getNum()%>">
									<input type="hidden" name="myid" value="<%=myid%>">
									<input type="hidden" name="currentPage" value="<%=currentPage%>">
									<table>
										<tr>
											<td width="480">
												<textarea style="width: 470px; height: 70px;"
												name="content" required="required" class="form-control"></textarea>
											</td>
											<td>
												<button type="submit" class="btn btn-info"
												style="width: 70px; height: 70px;">등록</button>
											</td>
										</tr>
									</table>
								</form>
							</div>
						<%
						}
						%>
						
						<!-- 댓글리스트_출력테이블 -->
						<div class="answerlist" style="background-color: #eee;">
							<table style="width: 500px;">
								<%
								for(AnswerDto adto:alist)
								{%>
									<tr>
										<td width="60" align="left">
											<span class="glyphicon glyphicon-user" style="font-size: 20pt;"></span>
										</td>
										<td>
											<%
											// 작성자명 얻기
											String aname = mdao.getName(adto.getMyid());
											%>
											<br>
											<b><%= aname %></b>&nbsp;
											<%
											// (방명록 작성자 = 댓글 작성자)일 경우
											if(dto.getMyid().equals(adto.getMyid())){%>
												<span style="color: gray;">(작성자)</span>
											<%
											}
											%>
											<!-- 댓글작성일자 -->
											<span style="font-size: 9pt; color: gray; margin-left: 20px;"><%= sdf.format(adto.getWriteday()) %></span>
											<%
											// 댓글삭제_(접속중인 아이디 = 댓글작성자)일 경우...삭제아이콘 보이게
											if(loginok!=null && adto.getMyid().equals(myid)){%>
												<span class="adel glyphicon glyphicon-remove" idx="<%= adto.getIdx() %>"
												style="cursor: pointer; margin-left: 10px;"></span>
											<%
											}
											%>
											<br>
											<span style="font-size: 10pt;"><%= adto.getContent().replace("\n", "<br>") %></span>
										</td>
									</tr>
								<%
								}
								%>
							</table>
						</div>
					</div>
					
				</td>
			</tr>
		</table>
	<%
	}
	%>
</div>
<!-- 페이징처리 -->
<div style="width: 600px; text-align: center;">
	<ul class="pagination">
	<%
	//이전
	if (startPage > 1)
	{%>
		<li>
			<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%= startPage-1 %>">이전</a>
		</li>
	<%
	}
	for (int pp = startPage; pp <= endPage; pp++)
	{
		if (pp == currentPage)
		{%>
			<li class="active">
				<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%= pp %>"><%= pp %></a>
			</li>
		<%
		} else {%>
			<li>
				<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%= pp %>"><%= pp %></a>
			</li>
		<%
		}
	}
	
	//다음
	if (endPage < totalPage)
	{%>
		<li>
			<a href="index.jsp?main=guest/guestlist.jsp?currentPage=<%= endPage+1 %>">다음</a>
		</li>
	<%
	}
	%>
	</ul>
</div>
</body>
</html>