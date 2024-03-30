<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
<script type="text/javascript"
	src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
<style>
h1 {
	text-align: center;
	padding: 10px 10px;
	padding-bottom: 30px;
	border-bottom: 1px solid #848484;
}

.form-0 {
	position: relative;
}

.board-top {
	width: 80%;
	height: 50px;
	margin: 0 auto;
	max-width: 100%;
}

hr {
	width: 100%;
}

.form-1 {
	width: 1200px;
	margin: 0 auto;
}

.write-1 {
	height: 50px;
	width: 1200px;
	border: none;
	font-size: 40px;
	background-color: #f5f6f7;
	outline: none;
}

.write-2 {
	margin-top: 30px;
	width: 1200px;
	font-size: 15px;
	border: none;
	background-color: #f5f6f7;
	outline: none;
}

.write-3 {
	margin-top: 10px;
}

button.mv {
	
}

.mv {
	margin-top: 10px;
	width: 70px;
	height: 30px;
	border: none;
	background-color: rgb(250, 180, 49);
	Cursor: pointer;
}

.write-5 {
	position: absolute;
	bottom: 0;
	left: 200px;
	width: 70px;
	height: 30px;
	border: none;
	background-color: rgb(250, 180, 49);
	Cursor: pointer;
}
</style>
</head>
<body>
	<h1>불편사항 작성</h1>
	<div class='form-0'>

		<form class='form-1'
			action="iwrite.do"
			method="POST">
			<input class='write-1' type="text" name="boardTitle" maxlegth="44"
				placeholder="제목 입력, 최대 44자까지 가능합니다" required>
			<hr>
			<textarea class='write-2' name="boardContent" rows="20" cols="20"
				maxlength="254" placeholder="내용 작성,최대 254자 가능합니다" required></textarea>
			<input type='hidden' name="id"
				value="${sessionScope.loginUser.id }">
			<hr>
			 <br> <input class="mv" type="submit"
				value="올리기">
		</form>


		<c:url var="lb" value="inconvlist.do">
			<c:param name="page" value="${page}" />
		</c:url>

		<button class="mv"
			onclick="javascript:location.href='${pageContext.servletContext.contextPath}/${lb}';">목록</button>
	</div>>
	<br>

	<hr>
	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>












