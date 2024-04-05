<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="monthlyPdSum" value="${requestScope.monthlyPdSum }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/goods/goodsDetail.css" />
<title>goodsListView</title>

<script type="text/javascript" src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
</script>


<script>
  function addRow(btn) {
    var row = btn.parentNode.parentNode;
    var table = row.parentNode.parentNode;

    // 새로운 행 생성
    var newRow = table.insertRow(row.rowIndex + 1);

    // 새로운 행에 버튼 추가
    var btnCell = newRow.insertCell(0);
    var newBtn = document.createElement("button");
    newBtn.textContent = " + ";
    newBtn.onclick = function() {
      addRow(this); // 새로운 행의 + 버튼을 클릭하면 새로운 행이 추가되도록 함
    };
    btnCell.appendChild(newBtn);

    // 기존의 + 버튼이 있던 셀을 input type text로 변경
    var oldBtnCell = row.cells[0];
    var newTextCell = document.createElement("td");
    newTextCell.style.textAlign = "center";
    var newText = document.createElement("input");
    newText.type = "text";
    newText.placeholder = "항목 입력";

    newTextCell.appendChild(newText);
    row.replaceChild(newTextCell, oldBtnCell);

    // 새로운 행에 입력란 추가 (여전히 input type number)
    var inputCell = newRow.insertCell(1);
    inputCell.style.textAlign = "center";
    var input = document.createElement("input");
    input.type = "number";
    input.placeholder = "금액 입력";

    inputCell.appendChild(input);

    // 선택한 행의 + 버튼 숨김
    btn.style.display = "none";
  }
</script>

<script>
function sum() {
    // table element 찾기
    const table = document.getElementById('myTable');

	// 2번 행의 값을 초기 값으로 설정
	/* let sum = Number(table.rows[2].cells[1].textContent); */
	let sum = 1500;
	// 3, 4, 5행의 값을 빼기
	/* for (let i = 3; i <= 5; i++) {
    	sum -= Number(table.rows[i].cells[1].textContent);
	} */

	// 6행부터 마지막 이전 행까지의 input 요소의 값을 빼기
	for (let i = 6; i < table.rows.length - 1; i++) {
    	sum -= Number(table.rows[i].cells[1].querySelector('input').value);
	}
    
    // 합계 출력
    document.getElementById('sumDisplay').textContent = sum;
    
    // 버튼 숨기기
    document.getElementById('buttonDisplay').style.display = 'none';
    // 합계 표시
    document.getElementById('sumDisplay').style.display = 'block';
}

/* 	// 합계를 클릭하면 버튼 다시 표시
    document.getElementById('sumDisplay').addEventListener('click', function() {
    // 합계 숨기기
    document.getElementById('sumDisplay').style.display = 'none';
    // 버튼 표시
    document.getElementById('buttonDisplay').style.display = 'block';
}); */
</script>
<script>
function onChangeMonth() {  
    var jarr = new Array();
    var job = new Object();
    
    var selectElement = document.getElementById("monthSelect");
    var month = selectElement.value; 
    
    job.id = document.getElementById("idDisplay").textContent;
    job.month = month;
    
    jarr.push(job);
    
            $.ajax({
                type: "POST",
                url: "monthlyPdPrice.do",
                data: JSON.stringify(jarr),
                contentType: "application/json; charset=utf-8",
                success: function(result) {
                	var spanElement = document.getElementById("monthlyPdPrice");
                    spanElement.textContent = result;
                },
                error: function(request, status, errorData) {
                    console.log("error code : " + request.status
                        + "\nMessage : " + request.responseText
                        + "\nError : " + errorData);
                } 
            });      
        
}
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

<select style="height: 35px; width: 80px;" 
				id="monthSelect" onchange="onChangeMonth()">
	<option value="2024-01">2024-01</option>
    <option value="2024-02">2024-02</option>
    <option value="2024-03">2024-03</option>
    <option value="2024-04">2024-04</option>
    <option value="2024-05">2024-05</option>
    <option value="2024-06">2024-06</option>
    <option value="2024-07">2024-07</option>
    <option value="2024-08">2024-08</option>
    <option value="2024-09">2024-09</option>
    <option value="2024-10">2024-10</option>
    <option value="2024-11">2024-11</option>
    <option value="2024-12">2024-12</option>
</select> 
<button onclick="printTable();">출력</button>



<br>
<br>
</div>
<style>
    .searchdiv {
        margin: 0 auto; /* 좌우 마진을 자동으로 설정하여 가운데 정렬 */
        width: fit-content; /* 내용에 맞게 자동으로 너비 설정 */
    }
    
    @media print {
   
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
</style>

<div style="margin-left: auto; margin-right: auto; width: 700px;">
			<table id="myTable" align="center" border="1" cellspacing="25" width="100%">
				<tr>
					<th style="text-align: center; white-space: nowrap;">항목</th>
					<th style="text-align: center; white-space: nowrap;">금액</th>
				</tr>
				<tr>
					<td align="center" style="white-space: nowrap;">월 매출</td>
					<td align="center" style="white-space: nowrap;">
						<span></span>
					</td>
				</tr>	
				<tr>
					<td align="center" style="white-space: nowrap;">월 발주 금액</td>
    				<td align="center" style="white-space: nowrap;">						
						<span id=monthlyPdPrice ></span>						
					</td>
				</tr>	
				<tr>
					<td align="center" style="white-space: nowrap;">월 급여</td>
					<td align="center" style="white-space: nowrap;">급여 출력칸</td>
				</tr>
				<tr>
					<td align="center" style="white-space: nowrap;">구독료</td>
					<td align="center" style="white-space: nowrap;">구독료 출력칸</td>
				</tr>
				<tr>
					<td align="center" style="white-space: nowrap;">월세</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number" placeholder="월세 입력">
					</td>
				</tr>	
				<tr>
					<td align="center" style="white-space: nowrap;">세금</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number" placeholder="세금 입력">
					</td>
				</tr>		
				<tr>
					<td align="center" style="white-space: nowrap;">기타비용</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number" placeholder="기타비용 입력">
					</td>
				</tr>				
				<tr>
					<td align="center" style="white-space: nowrap;">
						<button onclick="addRow(this)"> + </button>
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number" placeholder="금액 입력">
					</td>
				</tr>	
				<tr>
					<td align="center" style="white-space: nowrap;">월 수익</td>
					<td align="center" style="white-space: nowrap;">
						<div id="buttonDisplay">
            				<button onclick="sum();">합계</button>
            			</div>
            			<div id="sumDisplay" style="display:none;"></div> 		
					</td>
				</tr>	
			</table>
</div>
<div id="idDisplay" style="display:none;">${ loginUser.id }</div>

<!-- 출력 -->
<script>
    function printTable() {
        // 모든 input 요소의 현재 스타일 저장
        var inputs = document.querySelectorAll('input');
        
        // 인쇄 전에 테두리 없애기
        inputs.forEach(function(input) {
            input.style.outline = 'none';
            input.style.border = 'none';
        });

        // 테이블을 인쇄
        window.print();

        // 인쇄 후에 테두리 복원
        inputs.forEach(function(input) {
            input.style.outline = '';
            input.style.border = '';
        });
    }
</script>


<br>
<br>
<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>