<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/goods/goodsDetail.css" />
<title>Insert title here</title>
</head>
<body>
	<c:import url="/WEB-INF/views/common/header.jsp" />

	<hr>
	<br>
	<c:import url="/WEB-INF/views/common/sidebar.jsp" /> 
	<h1 align="center">발주처 등록</h1>
	<div style="align: center; text-align: center;">
		<br> <br> <br>
	</div>

	<style>
.popup {
	margin: 0 auto; /* 좌우 마진을 자동으로 설정하여 가운데 정렬 */
	width: fit-content; /* 내용에 맞게 자동으로 너비 설정 */
}

.insertbutton {
	margin: 0 auto; /* 좌우 마진을 자동으로 설정하여 가운데 정렬 */
	width: fit-content; /* 내용에 맞게 자동으로 너비 설정 */
}
</style>

	<br>
	<div style="margin-left: auto; margin-right: auto; width: 1400px;">
		<br> <br>
		<table align="center" border="1" cellspacing="25" width="100%"
			id="insertTable">
			<tr>
				<th style="text-align: center; white-space: nowrap;">발주처</th>
				<th style="text-align: center; white-space: nowrap;">연락처</th>
				<th style="text-align: center; white-space: nowrap;">주소</th>
				<th style="text-align: center; white-space: nowrap;">상품명</th>
				<th style="text-align: center; white-space: nowrap;">가격</th>
				<th style="text-align: center; white-space: nowrap;">단위</th>
				<th style="text-align: center; white-space: nowrap;">수량</th>		
				<th style="text-align: center; white-space: nowrap;">원산지</th>
				<th>등록</th>
			</tr>
			<form action="pinsert.do" method="post" id="pinsert">
				<input type="hidden" name="id" value="${ loginUser.id }">
			<tr>
				<td align="center" style="white-space: nowrap;"><input
					type="text" maxlength='100' name="pdName"
					style="width: 50px; margin-right: 0px; vertical-align: middle;" />
				</td>
				<td align="center" style="white-space: nowrap;"><input
					type="text" name="pdPhone"
					style="width: 50px; margin-right: 0px; vertical-align: middle;" />
				</td>
				<td align="center" style="white-space: nowrap;"><input
					type="text" name="pdAddress"
					style="width: 50px; margin-right: 0px; vertical-align: middle;" />
				</td>
				<td align="center" style="white-space: nowrap;"><input
					type="text" maxlength='10' name="goodsName"
					style="width: 50px; margin-right: 0px; vertical-align: middle;" />
				</td>
				<td align="center" style="white-space: nowrap;"><input
					type="number" name="goodsPrice"
					style="width: 50px; margin-right: 0px; vertical-align: middle;" />
				</td>
				<td align="center" style="white-space: nowrap;"><input
					type="text" name="goodsUnit"
					style="width: 50px; margin-right: 0px; vertical-align: middle;" />
				</td>
				<td align="center" style="white-space: nowrap;"><input
					type="number" name="pdQuantity"
					style="width: 50px; margin-right: 0px; vertical-align: middle;" />
				</td>
				<td align="center" style="white-space: nowrap;"><input
					type="text" maxlength='10' name="nation"
					style="width: 50px; margin-right: 0px; vertical-align: middle;" />
				</td>
				<td><input type="submit" id="addBtn" value="등록하기"></td>
			</tr>
		</table>
		</form>
	</div>





</body>
</html>