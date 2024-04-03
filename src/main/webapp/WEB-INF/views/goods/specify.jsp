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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
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
<%-- <c:import url="/WEB-INF/views/common/sidebar.jsp" /> --%>
<h1 style="text-align: center;">발주 명세서</h1>
<div style="align:center;text-align:center;">
<br>
<br>
<br>
</div>
<style>
.searchdiv {
	margin: 0 auto; /* 좌우 마진을 자동으로 설정하여 가운데 정렬 */
	width: fit-content; /* 내용에 맞게 자동으로 너비 설정 */
}

@media print {

    /* 입력된 값이 있는 입력(input) 태그는 보이도록 합니다 */
    input[value] {
        visibility: visible !important;
    }
	header, footer, sidebar, button {
		display: none !important;
	}
	.searchdiv {
		display: none !important;
	}
	table {
		margin: 0 auto; /* 좌우 마진을 자동으로 설정하여 가운데 정렬 */
		width: fit-content;
		page-break-inside: avoid;
	}
}
</style>
	<div class="searchdiv">
	<form method="get" id="searchForm">
		<input type="hidden" id = "id" name="id" value="${ loginUser.id }">
		<select style="height: 35px; width: 80px;" name="action"id="searchselect">
			<option value="goodsName">상품명</option>
			<option value="pdName">발주처</option>
		</select>  
		<input style="height: 30px; width: 325px;" type="text" id="searchtext" name="keyword" placeholder="검색어 입력">
        <input type="button" class="searchbtn" value="검색" onclick="search()">
	</form>
</div>

<script>
    function search() {
        var action = document.getElementById("searchselect").value;
        var keyword = document.getElementById("searchtext").value;
        var form = document.getElementById("searchForm");

        if (action === "goodsName") {
            form.action = "goodsNameSearch.do"; // 상품명 검색을 처리하는 URL로 변경
        } else if (action === "pdName") {
            form.action = "pdNameSearch.do"; // 발주처 검색을 처리하는 URL로 변경
        }

        form.submit();
    }
</script>



<br>
	
<div style="text-align: center;">
	<button onclick="exportToExcel()">엑셀로 저장</button>&nbsp;
	<button onclick="printTable()">인쇄 및 pdf로 저장</button>&nbsp;
	<button onclick="calcSum()">합계</button>&nbsp;
</div>
<br>	


<div style="margin-left: auto; margin-right: auto; width: 1400px;">
        <table id=specifysave align="center" border="1" cellspacing="25" width="100%">
        	<tr>
                <th style="text-align: center; white-space: nowrap;">일자</th>
                <th style="text-align: center; white-space: nowrap;">
        			<input type="date" id="date" name="date" required>
        		</th>
                <th style="text-align: center; white-space: nowrap;">성명</th>
                <th style="text-align: center; white-space: nowrap;">받는분</th>
                <th style="text-align: center; white-space: nowrap;">성명</th>
            </tr>
            <tr>             	
                <td style="text-align: center; white-space: nowrap;">상호명</td>
                <td style="text-align: center; white-space: nowrap;">
					<input type="text" id="storename" name="storename">
				</td>
                <td style="text-align: center; white-space: nowrap;">
					<input type="text" id="username" name="username">
			    </td>         
                <td style="text-align: center; white-space: nowrap;">${ goodsPrint.pdName }</td>
                <td style="text-align: center; white-space: nowrap;">
					<input type="text" id="producer" name="producer">
				</td>           
            </tr>
            <tr>             	
                <td style="text-align: center; white-space: nowrap;">주소</td>
                <td colspan='2' style="text-align: center; white-space: nowrap;">
					<input type="text" id="address" name="address">
				</td>  
                <td colspan='2' style="text-align: center; white-space: nowrap;">${ goodsPrint.pdAddress }</td>
            </tr>
            <tr>             	
                <td style="text-align: center; white-space: nowrap;">상품명</td>
                <td style="text-align: center; white-space: nowrap;">단위</td>
                <td style="text-align: center; white-space: nowrap;">수량</td>
                <td style="text-align: center; white-space: nowrap;">단가</td>
                <td style="text-align: center; white-space: nowrap;">금액</td>
            </tr>
			<c:forEach items="${list}" var="goodsPrint" varStatus="loop">
            <tr>
             	<td align="center" style="white-space: nowrap;">${ goodsPrint.goodsName }</td>
                <td align="center" style="white-space: nowrap;">${ goodsPrint.goodsUnit }</td>
                <td align="center" style="white-space: nowrap;">
                	<input type="number" id="oq_${ loop.index }" name="oq">
                </td>
                <td id="goodsPriceCell_${loop.index}" align="center" style="white-space: nowrap;">${ goodsPrint.goodsPrice }</td>
                <td align="center" style="white-space: nowrap;">
                	<span id="goodstotalprice_${ loop.index }"></span>
                </td>
            </tr>
            </c:forEach>   
            <tr>
            	<td style="text-align: center; white-space: nowrap;">합계</td>
            	<td style="text-align: center; white-space: nowrap;"></td>
            	<td style="text-align: center; white-space: nowrap;"></td>
            	<td style="text-align: center; white-space: nowrap;"></td>
            	<td id="sum" style="text-align: center; white-space: nowrap;"></td>
            </tr>
        </table>
</div>

<!-- 상품당 총 가격 덧셈 -->
<script>
<c:forEach items="${list}" var="goodsPrint" varStatus="loop">
	var quantityInput_${loop.index} = document.getElementById('oq_${loop.index}');
	var goodsPriceCell_${loop.index} = document.getElementById('goodsPriceCell_${loop.index}');
	var goodstotalprice_${loop.index} = document.getElementById('goodstotalprice_${loop.index}');
	
	quantityInput_${loop.index}.addEventListener('change', function() {
    // 사용자가 입력한 수량
    	var quantity = parseInt(this.value);
    // 상품 가격 가져오기
    	var goodsPrice = parseFloat(goodsPriceCell_${loop.index}.textContent); // 또는 innerText 사용 가능

    // 총 가격 계산
    	var totalPrice = quantity * goodsPrice;
    	
    // 결과를 화면에 출력
    	goodstotalprice_${loop.index}.textContent = totalPrice;  
    });
</c:forEach>
</script>

<script>
function calcSum() {
	  // table element 찾기
	  const table = document.getElementById('specifysave');
	  
	  // 합계 계산
	  let sum = 0;
	  for(let i = 4; i < table.rows.length; i++)  {
	    sum += Number(table.rows[i].cells[4].textContent);
	  }
	  
	  // 합계 출력
	  document.getElementById('sum').textContent = sum;	  
	}
</script>




<!-- 파일로 저장 -->
<script>
        function exportToExcel() {
            const table = document.getElementById('specifysave');
            const rows = table.getElementsByTagName('tr');
            const csvData = [];

            for (let i = 0; i < rows.length; i++) {
                const row = [], cols = rows[i].querySelectorAll('td, th');

                for (let j = 0; j < cols.length; j++) {
                    row.push(cols[j].innerText);
                }
                
                csvData.push(row.join(','));
            }

            const csvString = '\uFEFF' + csvData.join('\n'); // Add BOM character for UTF-8 encoding
            const a = document.createElement('a');
            const blob = new Blob([csvString], { type: 'text/csv;charset=utf-8;' });
            const url = URL.createObjectURL(blob);
            a.href = url;
            a.target = '_blank';
            a.download = 'table_data.csv';
            document.body.appendChild(a);
            a.click();
            setTimeout(() => {
                document.body.removeChild(a);
                window.URL.revokeObjectURL(url);
            }, 0);
        }
</script>

<!-- 출력 -->
<script>
        function printTable() {
	
            var table = document.getElementById("specifysave");

            // 인쇄 실행
            window.print();
        }
</script>
<br>
<br>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>