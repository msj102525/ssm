<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/reserve/reserve.css" />
<title>ssm</title>
<script type="text/javascript" src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<h1 align="center">예약등록</h1>
<hr>
<form action="rsrvinsert.do" method="post">
	<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
		<tr><th>예약일자</th>
			<td><input type="text" name="rsrvDate"></td>
		</tr>
		<tr><th>예약시간</th>
			<td><input type="text" name="rsrvTime"></td>
		</tr>
		<tr><th>예약자명</th>
			<td><input type="text" name="rsrvName"></td>
		</tr>
		<tr><th>연락처</th>
			<td><input type="text" name="rsrvTelno"></td>
		</tr>
		<tr><th>예약인원</th>
			<td><input type="number" name="rsrvInwon"></td>
		</tr>
		<tr><th>제 목</th>
			<td><input type="text" name="rsrvSubject" size="50"></td></tr>
		<tr><th>내 용</th>
			<td><textarea rows="5" cols="50" name="rsrvMemo"></textarea></td></tr>
		<tr><th>작성일자</th>
			<td><input type="date" name="writeDate1" readonly></td>
		</tr>
		<tr><th colspan="2">
			<input type="submit" value="등록하기"> &nbsp; 
			<input type="reset" value="작성취소"> &nbsp;
			<%--<input type="button" value="목록" 
				onclick="javascript:history.go(-1); return false;"> --%>
		</th></tr>
	</table>
</form>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>