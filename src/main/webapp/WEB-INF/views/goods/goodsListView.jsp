<%@ page language="java" contentType="text/html; charset=UTF-8"
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
<link rel="stylesheet" href="resources/css/goods/goodsDetail.css" />
<title>goodsListView</title>

<script type="text/javascript" src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
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
<c:import url="/WEB-INF/views/common/sidebar.jsp" />
<h1 align="left">재고 현황</h1>
<div style="align:center;text-align:center;">
<br>
<br>
<br>
</div>

	<div class="searchdiv">
		<form action="gsearch.do" method="get">
			<select style="height: 35px; width: 80px;" name="action"
				id="searchselect">
				<option value="goodsName">상품명</option>
				<option value="pdName">발주처</option>
			</select>  
			<input style="height: 30px; width: 325px;"
				type="text" id="searchtext" name="keyword" placeholder="검색어 입력">
			<input type="submit" class="searchbtn" value="검색">
			<button type="submit">저장</button> <br>
		</form>
		<button onclick="javascript:location.href='${pageContext.servletContext.contextPath}/glist.do?page=1';">목록</button>
		<br>
	</div>



	<%-- 조회된 상품 목록 출력 --%>
<div style="margin-left: auto; margin-right: auto; width: 1400px;">
    <form action="/your-submit-url" method="post">
        <table align="center" border="1" cellspacing="25" width="100%">
            <tr>
                <th style="text-align: center; white-space: nowrap;">번호</th>
                <th style="text-align: center; white-space: nowrap;">상품명</th>
                <th style="text-align: center; white-space: nowrap;">수량</th>
                <th style="text-align: center; white-space: nowrap;">단위</th>
                <th style="text-align: center; white-space: nowrap;">발주 최소 수량</th>
                <th style="text-align: center; white-space: nowrap;">알림 최소 수량</th>
                <th style="text-align: center; white-space: nowrap;">발주처</th>
                <th style="text-align: center; white-space: nowrap;">발주 연락처</th>
                <th style="text-align: center; white-space: nowrap;">원산지</th>
            </tr>
            <c:forEach items="${ requestScope.list }" var="goodsPrint">
                <tr>               	
                    <td align="center" style="white-space: nowrap;">${ goodsPrint.goodsNo }</td>
                    <td align="center" style="white-space: nowrap;">${ goodsPrint.goodsName }</td>
                    <td align="center" style="white-space: nowrap;">
                        <div style="display: inline-block;">            
                            <input type="number" value="${ goodsPrint.pdQuantity }" name="pdQuantity" style="width: 50px; margin-right: 0px; vertical-align: middle;" />
                            <span style="vertical-align: middle;">${ goodsPrint.goodsUnit }</span>
                        </div>
                    </td>
                    <td align="center" style="white-space: nowrap;">${ goodsPrint.goodsUnit }</td>
                    <td align="center" style="white-space: nowrap;">
                        <div style="display: inline-block;">
                            <input type="number" value="${ goodsPrint.minOrderQuantity }" name="minOrderQuantity" style="width: 50px; margin-right: 5px; vertical-align: middle;" />
                            <span style="vertical-align: middle;">${ goodsPrint.goodsUnit }</span>
                        </div>
                    </td>
                    <td align="center" style="white-space: nowrap;">
                        <div style="display: inline-block;">
                            <input type="number" value="${ goodsPrint.minAlarmQuantity }" name="minAlarmQuantity" style="width: 50px; margin-right: 5px; vertical-align: middle;" />
                            <span style="vertical-align: middle;">${ goodsPrint.goodsUnit }</span>
                        </div>
                    </td>
                    <td align="center" style="white-space: nowrap;">${ goodsPrint.pdName }</td>
                    <td align="center" style="white-space: nowrap;">${ goodsPrint.pdPhone }</td>
                    <td align="center" style="white-space: nowrap;">${ goodsPrint.nation }</td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>

<br>
<c:import url="/WEB-INF/views/common/pagingView.jsp" />

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>