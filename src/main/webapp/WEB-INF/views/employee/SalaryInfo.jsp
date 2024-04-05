<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>직원 금융 정보 등록</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 150px;
	padding: 10px;
	background-color: #f4f4f4;
	font-size: 25px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #f2f2f2; /* 제목 셀의 배경 색상 */
}
</style>
<style>
body {
	font-family: 'Arial', sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 20px;
	color: #333;
}

h2, h4 {
	color: #444;
}

form {
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
	display: block;
	margin-top: 20px;
	margin-bottom: 5px;
}

input[type="number"], input[type="text"], input[type="submit"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border-radius: 5px;
	border: 1px solid #ddd;
	box-sizing: border-box;
	/* Makes sure padding does not affect total width */
}

input[type="submit"] {
	background-color: #5cb85c;
	color: white;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #4cae4c;
}
</style>
</head>
<body>
	<h4>상세 정보</h4>
	<!-- 상세 정보 표시 -->
	<form action="selectSalary.do" method="post">
		<table>
			<tr>
				<th>직원번호</th>
				<th>이름</th>
				<th>은행 이름</th>
				<th>계좌 번호</th>
				<th>보험료</th>
				<th>세금</th>
			</tr>

			<c:forEach var="employee" items="${employees}">
				<tr>
					<td>${employee.empId}</td>
					<td>${employee.empName}</td>
					<td>${employee.bankName}</td>
					<td>${employee.bankAccountNo}</td>
					<td>${employee.premium}</td>
					<td>${employee.tax}</td>
					<td>
						<!-- 삭제 기능을 위한 Form -->
						<form action="deleteSalary.do" method="post"
							onsubmit="return confirm('정말 삭제하시겠습니까?');">
							<input type="hidden" name="empId" value="${employee.empId}">
							<input type="submit" value="삭제">
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
		</div>

	</form>

</body>
</html>
<div style="text-align: center; margin-top: 20px;">
	<!-- 등록 페이지 이동 버튼 -->
	<button onclick="location.href='insertSalary.do'">등록 하기</button>
	<!-- 수정 페이지로 이동 버튼 -->
	<button onclick="location.href='updateSalaryInfo.do'">수정하기</button>
	<!-- 삭제하기 버튼 -->
	<button onclick="deleteSalaryInfo.do('${selectedEmployee.empId}')">삭제하기</button>
	<!-- 목록으로 돌아가기 버튼 -->
	<button onclick="location.href='mainEmpPage.do'">목록으로 돌아가기</button>
</div>
</form>
<div>
	<!-- 페이징 구현 -->
	<%-- <c:if test="${currentPage != 1}">
		<a href="updateSalary.do?page=1">처음</a>
	</c:if>
	<c:forEach begin="1" end="${totalPages}" var="page">
		<c:choose>
			<c:when test="${page == currentPage}">
				<b>${page}</b>
			</c:when>
			<c:otherwise>
				<a href="updateSalary.do?page=${page}">${page}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	<c:if test="${currentPage != totalPages}">
		<a href="updateSalary.do?page=${totalPages}">마지막</a>
	</c:if> --%>
</div>
</body>
</html>
</body>
</html>
