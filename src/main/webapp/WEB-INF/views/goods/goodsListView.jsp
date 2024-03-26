<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="nowpage" value="1" />
<c:if test="${ !empty requestScope.currentPage }">
	<c:set var="nowpage" value="${requestScope.currentPage }" />
</c:if>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>goodsListView</title>
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

h1{
	color:black;
	font-size: 30px;
}

body {
  color: #666;
  font: 14px/24px "Open Sans", "HelveticaNeue-Light", "Helvetica Neue Light", "Helvetica Neue", Helvetica, Arial, "Lucida Grande", Sans-Serif;
}
table {
  border-collapse: separate;
  border-spacing: 0;
  width: 100%;
}
th,
td {
  padding: 6px 15px;
}
th {
  background: rgb(250, 180, 49);
  color: #000;
  text-align: left;
}
tr:first-child th:first-child {
  border-top-left-radius: 6px;
}
tr:first-child th:last-child {
  border-top-right-radius: 6px;
}
td {
  border-right: 1px solid #c6c9cc;
  border-bottom: 1px solid #c6c9cc;
}
td:first-child {
  border-left: 1px solid #c6c9cc;
}
tr:nth-child(even) td {
  background: #eaeaed;
}
tr:last-child td:first-child {
  border-bottom-left-radius: 6px;
}
tr:last-child td:last-child {
  border-bottom-right-radius: 6px;
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

</script>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />
<hr>
<br>
<h1 align="center">상품 목록</h1>
<div style="align:center;text-align:center;">
<br>
</div>

<%-- 조회된 상품 목록 출력 --%>
<table align="center" border="1" cellspacing="25" width="1000">
	<tr>
		<th>번호</th>
		<th>상품명</th>
		<th>수량</th>
		<th>단위</th>
		<th>발주 최소 수량</th>
		<th>알림 최소 수량</th>
		<th>발주처</th>
		<th>발주 연락처</th>
		<th>원산지</th>
	</tr>
	<c:forEach items="${ requestScope.goodslist }" var="goods" varStatus="status">
		<tr>
			<td align="center">${ goods.goodsNo }</td>
			<td align="center">${ goods.goodsName }</td>
			<td align="center">${ goods.pdQuantity }</td>
			<td align="center">${ goods.Unit }</td>
			<td align="center">${goods.minOrderQuantity}</td>
	        <td align="center">${goods.minAlarmQuantity}</td>
	        <td align="center">${goods.pdName}</td>
	        <td align="center">${goods.pdPhone}</td>
	        <td align="center">${goods.Nation}</td>
		</tr>
	</c:forEach>
</table>
<br>
<c:import url="/WEB-INF/views/common/pagingView.jsp" />

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>