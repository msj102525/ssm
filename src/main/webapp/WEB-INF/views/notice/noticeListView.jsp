<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="nowpage" value="1" />
 <c:if test="${ !empty requestScope.currentPage }">
 		<c:set var="nowpage" value="${ requestScope.currentPage }" />
 </c:if>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style type="text/css">
fieldset#ss {
	width: 600px;
	position: relative;
	left: 450px;
}
form fieldset {
	width: 600px;	
}
form.sform {
	background: lightgray;
	width: 630px;
	position: relative;
	left: 400px;
	display: none;  /* 안 보이게 함 */
}
table {
  border-collapse: collapse;
  width: 1300px;
  margin: 1rem auto;
  background-color: white;
}

thead{
  box-shadow: 4px 4px 10px rgba(0,0,0,0.1);
}

/* 테이블 행 */
td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  text-align: center;
}

th {
  padding: 8px;
  text-align: left;
  text-align: center;
  border-top: 2px solid #000;
  border-bottom: 2px solid #000;
  color: #000;
}

/* 테이블 올렸을 때 */
tbody tr:hover {
  background-color: #d3d3d3;
  opacity: 0.9;
  cursor: pointer;
}

/* 테이블 비율 */
th:nth-child(1),
td:nth-child(1) {
  width: 5%;
}

th:nth-child(2),
td:nth-child(2) {
  width: 55%;
}

th:nth-child(3),
td:nth-child(3) {
  width: 10%;
}

th, td {
  border-left: none;
  border-right: none;
}
/*목록*/
div.listdiv{
  height: 40px;
  width: 1300px;
  margin: 20px auto; 
  display: flex;
  /* padding-left:400px; */
  justify-content: center;
  position: relative;
}
button.listbtn{
	position : absolute;
	right : 0;	
}
/*검색창 CSS*/
input:-ms-input-placeholder{color:#a8a8a8;}
input:-webkit-input-placeholder{color:#a8a8a8;}
input:-moz-input-placeholder{color:#a8a8a8;}
div.searchdiv{
  height: 40px;
  width: 1300px;
  margin: 20px auto; 
  display: flex;
  /* padding-left:400px; */
  justify-content: center;
  position: relative;
}

.searchdiv > button.writerB {
	position: absolute;
	right: 0;
}

.searchdiv > input {
  font-size: 16px;
  width: 325px;
  padding: 10px;
  border: 1px solid rgb(250, 180, 49);
  outline: none;
  float: left;
  height: 20px;
  margin-right: 2px; 
}
button {
  width: 100px;
  height: 40px;
  border: none;
  background: rgb(250, 180, 49);
  color: #ffffff;
  font-size: 16px;
}

</style>
<script type="text/javascript" src="/first/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function(){
	//input 태그의 name 이 item 의 값이 바뀌면(change) 작동되는 이벤트 핸들러 작성
	$('input[name=item]').on('change', function(){
		//여러 개의 태그 중에서 체크표시가 된 태그를 선택
		$('input[name=item]').each(function(index){
			//선택된 radio 순번대로 하나씩 checked 인지 확인함
			if($(this).is(':checked')){
				//체크 표시된 아이템에 대한 폼이 보여지게 처리함
				$('form.sform').eq(index).css('display', 'block');
			}else{
				//체크 표시 안된 아이템의 폼은 안 보이게 처리함
				$('form.sform').eq(index).css('display', 'none');
			}
		});  //each
	});  //on
});  //document ready
function showWriteForm(){
	//게시글 원글 쓰기 페이지로 이동 요청
	location.href = "${ pageContext.servletContext.contextPath }/nwform.do";
}
</script>
</head>
<body>
<%-- <%@ include file="../common/menubar.jsp" %> --%>
<c:import url="/WEB-INF/views/common/header.jsp" />
<c:import url="/WEB-INF/views/admin/sidebar.jsp" />
<hr>
<h3 align="center">공지사항</h1>

<%-- <% } %> --%>
<%-- </c:if> --%>
<br>
<br>
<%-- 조회된 게시글 목록 출력 --%>
<div class="listdiv">
<button class="listbtn" onclick="javascript:location.href='${pageContext.servletContext.contextPath}/nlist.do?page=1';">목록</button>
</div>
<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
	<c:forEach items="${ requestScope.list }" var="n">
		<tr>
			
			<td>${n.noticeNo}</td>
			<c:url var="mvndetail" value="ndetail.do">
				<c:param name="nno" value="${ n.noticeNo }" />
				<c:param name="page"  value="${ nowpage }"/>
			</c:url>
			<td>
			<a href="${mvndetail}">${n.noticeTitle }</a>
			</td>
			<td>${n.writer }</td>
			<td>${n.writeDate }</td>
			<td>${n.readCount }</td>
		</tr>
<%-- 	<% } %> --%>
	</c:forEach>
</table>
<div class="searchdiv">
	<input type="text" placeholder="검색어 입력">
	<button>검색</button>
	<button class="writerB" onclick="showWriteForm();">글쓰기</button>
</div>
<%-- 공지글 쓰기는 관리자만 가능함 --%>
<%-- <c:if test="${ !empty sessionScope.loginMember&& sessionScope.loginMember.adminOK == Y }"> --%>

<%-- 항목별 검색 기능 추가 --%>
<%-- <%-- <fieldset id="ss">
	<legend>검색할 항목을 선택하세요.</legend>
	<input type="radio" name="item" id="title"> 제목 &nbsp;
	<input type="radio" name="item" id="writer"> 작성자 &nbsp;	
	<input type="radio" name="item" id="date"> 등록날짜 &nbsp;	
</fieldset>
<br>

검색 항목별 값 입력 전송용 폼 만들기
제목 검색 폼
<form id="titleform" class="sform" action="bsearchTitle.do" method="post">
	<input type="hidden" name="action" value="title">	
<fieldset>
	<legend>검색할 제목을 입력하세요.</legend>
	<input type="search" name="keyword"> &nbsp;
	한 페이지에 출력할 목록 갯수 : 
	<select name="limit">
		<option value="10" selected>10</option>
		<option value="15" select>15</option>
		<option value="20" select>20</option>
	</select> &nbsp;
	<input type="submit" value="검색">
</fieldset>
</form>

작성자 검색 폼
<form id="writerform" class="sform" action="bsearchWriter.do" method="post">
	<input type="hidden" name="action" value="writer">	
<fieldset>
	<legend>검색할 작성자를 입력하세요.</legend>
	<input type="search" name="keyword"> &nbsp;
	한 페이지에 출력할 목록 갯수 : 
	<select name="limit">
		<option value="10" selected>10</option>
		<option value="15" select>15</option>
		<option value="20" select>20</option>
	</select> &nbsp;
	<input type="submit" value="검색">
</fieldset>
</form>

등록날짜 검색 폼
<form id="dateform" class="sform" action="bsearchDate.do" method="post">
	<input type="hidden" name="action" value="date">	
<fieldset>
	<legend>검색할 등록날짜를 선택하세요.</legend>
	<input type="date" name="begin"> ~ <input type="date" name="end"> &nbsp;
	한 페이지에 출력할 목록 갯수 : 
	<select name="limit">
		<option value="10" selected>10</option>
		<option value="15" select>15</option>
		<option value="20" select>20</option>
	</select> &nbsp;
	<input type="submit" value="검색">
</fieldset>
</form> --%>
<br>

<%-- 페이징 처리 뷰 포함 처리 --%>
<%-- <%@ include file="../common/pagingView.jsp" %>
 --%>
<%--  <c:import url="/WEB-INF/views/common/pagingView.jsp" /> --%>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>




