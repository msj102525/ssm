<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
</head>
<body>

<h1 align="center">게시 원글 등록 페이지</h1>
<br>

<!-- form 에서 입력값들과 파일을 함께 전송하려면 반드시 속성 추가해야 함 :  
	enctype="multipart/form-data"
	파일을 첨부해서 보낼 때는 POST
-->
<form action="ninsert.do" method="get" >
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="noticeTitle" size="50"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="writer" readonly value="#"></td>
	</tr>
	<tr>
		<th>중요도</th>
		<td><input type="checkbox" name="importancy"></td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="50" name="noticeContent"></textarea></td>
	</tr>
	<tr>
		<c:url var="nl" value="nlist.do">
				<c:param name="page" value="1"/>
		</c:url>
	
		<th colspan="2">
			<input type="submit" value="등록하기"> &nbsp; 
			<input type="reset" value="작성취소"> &nbsp;
			<input type="button" value="목록" 
			onclick="javascript:location.href='${nl}'; return false;">
		</th>		
	</tr>
</table>
</form>
<br>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>












