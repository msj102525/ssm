<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="resources/css/notice/noticeDetail.css">
<title>불편사항상세</title>
<script type="text/javascript" src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
</head>
<body>
	<h1>불편사항</h1>
	<div class="view-top">

		<div class="view-top-title">${inconvBoard.boardTitle }</div>

		<div class="view-top2">
			<div>${inconvBoard.writer }</div>
			<script type="text/javascript">
			$(function(){
			    switch (${inconvBoard.status}) {
			        case 1:
			            $('#status').html($('#status').html() + "조치전");
			            break;
			        case 2:
			            $('#status').html($('#status').html() + "조치중");
			            break;
			        case 3:
			            $('#status').html($('#status').html() + "조치완료");
			            break;
			    }
			});
			</script>
			<div id="status">조치상태: </div>


			<div>Date: ${inconvBoard.writeDate }</div>
		</div>
		<hr>
		<div class="view-mid">${inconvBoard.boardContent }</div>
		<hr>


		<div class="view-btn">

			<form action="iwform.do" method="POST">
				<button name="write">게시판 작성</button>
			</form>


			<c:url var="ilist" value="inconvlist.do">
				<c:param name="page" value='${currentPage}' />
			</c:url>
			<button onclick="location.href='${ilist}';">목록으로</button>





	<c:if test="${sessionScope.loginUser.id eq inconvBoard.id }">
				<form method='GET' action='mvupdatei.do'>
					<input type='hidden' name='boardNo' value='${inconvBoard.boardNo}'>
					<input type='hidden' name='page' value='${currentPage }'>
					<button>게시물 수정</button>
				</form>

				<form method='POST' action='deletei.do'>
					<input type='hidden' name='boardNo' value='${inconvBoard.boardNo }'>
					<input type='hidden' name='page' value='${page }'>
					<button>삭제</button>
				</form>
			</c:if>

		</div>


	</div>
	<!--view-top의 div 종료점 입니다.-->
</body>
</html>
