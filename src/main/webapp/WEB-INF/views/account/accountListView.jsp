<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/goods/goodsDetail.css" />
<title>goodsListView</title>

<script type="text/javascript" src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">

</script>

</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

<hr>
<br>
<c:import url="/WEB-INF/views/common/sidebar.jsp" />
<h1 style="text-align: center;">월 매출</h1>
<div style="align:center;text-align:center;">
<br>
<br>
<button onclick="updateSelectedGoods();">출력</button>
<br>
<br>
</div>
<style>
    .searchdiv {
        margin: 0 auto; /* 좌우 마진을 자동으로 설정하여 가운데 정렬 */
        width: fit-content; /* 내용에 맞게 자동으로 너비 설정 */
    }
</style>

<div style="margin-left: auto; margin-right: auto; width: 700px;">
			<table align="center" border="1" cellspacing="25" width="100%">
				<tr>
					<th style="text-align: center; white-space: nowrap;">항목</th>
					<th style="text-align: center; white-space: nowrap;">금액</th>
				</tr>
				<tr>
					<td align="center" style="white-space: nowrap;">월 매출</td>
					<td align="center" style="white-space: nowrap;">매출 출력칸</td>
				</tr>	
				<tr>
					<td align="center" style="white-space: nowrap;">월 발주 금액</td>
					<td align="center" style="white-space: nowrap;">발주 출력칸</td>
				</tr>	
				<tr>
					<td align="center" style="white-space: nowrap;">월 급여</td>
					<td align="center" style="white-space: nowrap;">급여 출력칸</td>
				</tr>
				<tr>
					<td align="center" style="white-space: nowrap;">월세</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number">월세 입력칸
					</td>
				</tr>	
				<tr>
					<td align="center" style="white-space: nowrap;">세금</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number">세금 입력칸
					</td>
				</tr>		
				<tr>
					<td align="center" style="white-space: nowrap;">기타비용</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number">비용 입력칸
					</td>
				</tr>	
				<tr>
					<td align="center" style="white-space: nowrap;">+버튼 누르면</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number">입력칸 생기게
					</td>
				</tr>	
				<tr>
					<td align="center" style="white-space: nowrap;">맨마지막은 월 수익</td>
					<td align="center" style="white-space: nowrap;">매출 - 모든 지출 금액 출력</td>
				</tr>	
			</table>
</div>

<br>
<br>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>