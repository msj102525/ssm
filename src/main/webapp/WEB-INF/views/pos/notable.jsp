<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath }/resources/css/common/reset.css" />
<style>
.wrap {
	width: 1000px;
	padding: 10px 600px 50px 600px;
}

.header {
	background-color: orange;
	width: 100%;
	height: 10vh;
	font-size: 30px;
	text-align: center;
	display: flex;
	flex-wrap: nowrap;
	justify-content: center;
	align-items: center;
	font-weight: 700;
}

.body, .footer {
	background-color: lightgray;
	width: 100%;
}

.body {
	height: 80vh;
	display: flex;
}

.body .tableView {
	width: 80%;
	height: 100%;
	padding: 30px;
	position: relative;
}

.body .buttonList {
	width: 20%;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	padding-right: 5px;
	parring-bottom: 5px;
}

.title p {
	color: black;
	font-weight: bolder;
}

.button {
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 8px;
	font-weight: 800;
	height: 80px;
}
/*테이블 모양*/
.tableView {
	position:relative;
}
.tableView a {
	min-width: 150px;
	min-height: 200px;
	max-width: 150px;
	max-height: 200px;
	text-decoration: none;
	text-align: center;
	line-height: 80px;
	background-color: white;
	border: 2px solid black;
	border-radius: 8px;
	margin-bottom: 4px;
	position: absolute;
}
.table:hover {
	box-shadow: 0 0 10px 0 darkgray;
	cursor: pointer;
}
/* 테이블 추가 버튼 */
.button.add {
	background-color: DodgerBlue;
}

/* 테이블 삭제 버튼 */
.button.delete {
	background-color: red;
}

/* 메뉴 관리 버튼 */
.button.menu {
	background-color: DodgerBlue;
}

/* 저장 버튼 */
.button.save {
	background-color: LimeGreen;
}

/* 돌아가기 버튼 */
.button.return {
	background-color: DodgerBlue;
}
</style>
<meta charset="UTF-8">
<script type="text/javascript"
	src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
<link rel="stylesheet"
	href="/ssm/resources/css/jquery-ui-1.13.2/jquery-ui.min.css" />
<script type="text/javascript"
	src="/ssm/resources/css/jquery-ui-1.13.2/jquery-ui.min.js"></script>
<script>



</script>
<title>SSM웹포스기 세팅화면</title>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<p class="title">SSM 웹 포스기</p>
		</div>
		<div class="body">
			<div class="tableView" id="tableView">
			<table>
				<thead>
					<th style="text-align: center; white-space: nowrap;">번호</th>
					<th style="text-align: center; white-space: nowrap;">상품명</th>
					<th style="text-align: center; white-space: nowrap;">수량</th>
					<th style="text-align: center; white-space: nowrap;">판매가격</th>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.list}" var="goodsPrint" varStatus="loop">
						<td align="center" style="white-space: nowrap;">${goodsPrint.goodsNo}</td>
						<td align="center" style="white-space: nowrap;">${goodsPrint.goodsName}</td>
						<td align="center" style="white-space: nowrap;">${goodsPrint.pdQuantity}</td>
						<td align="center" style="white-space: nowrap;">${goodsPrint.salePrice}</td>
					</c:forEach>
				</tbody>
			</table>	
			
			</div>
			<div class="buttonList">
				<button class="button add" >계산</button>
				<button class="button delete">취소</button>				
				<input type="hidden" id="userId" value="${loginUser.id }">
			</div>
		</div>

	</div>
</body>
</html>