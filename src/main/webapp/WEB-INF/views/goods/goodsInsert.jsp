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
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

<hr>
<br>
<c:import url="/WEB-INF/views/common/sidebar.jsp" />
<h1 align="left">재고 등록</h1>
<div style="align:center;text-align:center;">
<br>
<br>
<br>
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

<div class="popup">
	<button type="submit"
		, onclick="window.open('http://localhost:8080/ssm/popup.do','_blank','width=350, height=150, top=150, left=50, scrollbars=no')">
		<a href="#pop_info_1" class="btn_open">추가</a>
	</button>
</div>

<script>
    function submitForm() {
        document.getElementById("ginsert").submit();
    }
</script>

<!-- <div class="insertbutton">
	<button class="mv" onclick="submitForm()">올리기</button>
</div> -->

<script>
function addRow() {
	  // table element 찾기
	  const table = document.getElementById('insertTable');
	  
	  // 기존에 추가된 버튼 삭제
	  const previousButtons = document.querySelectorAll('.addRowButton');
	  previousButtons.forEach(button => button.remove());

	  // 첫 번째 행 찾기
	  const firstRow = table.rows[1];
	  
	  // 새 행(Row) 생성
	  const newRow = table.insertRow(1);
	  
	  // 새 행(Row)의 첫 번째 셀에 버튼 추가
	  const firstCell = newRow.insertCell(0);
	  firstCell.innerHTML = '<input type="button" value="+" onclick="addRow()" class="addRowButton" />';

	  // 새 행(Row)에 Cell 추가
	  for (let i = 1; i < firstRow.cells.length; i++) {
	    const newCell = newRow.insertCell(i);
	    newCell.innerHTML = firstRow.cells[i].innerHTML;
	  }
	}

</script>



<br>
<br>
	<div style="margin-left: auto; margin-right: auto; width: 1400px;">
    <form action="ginsert.do" method="post" id="ginsert">
        <table align="center" border="1" cellspacing="25" width="100%" id="insertTable">
            <tr>
            	<input type="hidden" name="id", value="${ loginUser.id }">
            	<th style="text-align: center; white-space: nowrap;"></th>
                <th style="text-align: center; white-space: nowrap;">상품명</th>
                <th style="text-align: center; white-space: nowrap;">수량</th>
                <th style="text-align: center; white-space: nowrap;">단위</th>
                <th style="text-align: center; white-space: nowrap;">가격</th>
                <th style="text-align: center; white-space: nowrap;">발주 최소 수량</th>
                <th style="text-align: center; white-space: nowrap;">알림 최소 수량</th>
                <th style="text-align: center; white-space: nowrap;">발주처</th>
                <th style="text-align: center; white-space: nowrap;">발주 연락처</th>
                <th style="text-align: center; white-space: nowrap;">원산지</th>
            </tr>
            <tr>
					<td><input type='button' value='+' onclick='addRow()' /></td>
					<td align="center" style="white-space: nowrap;">
						<input type="text" maxlength='100' name="goodsName" style="width: 50px; margin-right: 0px; vertical-align: middle;" />                     
					</td>
                    <td align="center" style="white-space: nowrap;">
						<input type="number" name="pdQuantity" style="width: 50px; margin-right: 0px; vertical-align: middle;" />                          
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="text" maxlength='10' name="goodsUnit" style="width: 50px; margin-right: 0px; vertical-align: middle;" />                            
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number" maxlength='10' name="goodsPrice" style="width: 50px; margin-right: 0px; vertical-align: middle;" />                            
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number" name="minOrderQuantity" style="width: 50px; margin-right: 0px; vertical-align: middle;" />                           
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number" name="minAlarmQuantity" style="width: 50px; margin-right: 0px; vertical-align: middle;" />                          
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="text" maxlength='100'  name="pdName"  style="width: 50px; margin-right: 0px; vertical-align: middle;" />                         
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="text" maxlength='30' name="pdPhone"  style="width: 50px; margin-right: 0px; vertical-align: middle;" />                          
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="text" maxlength='10'  name="nation"  style="width: 50px; margin-right: 0px; vertical-align: middle;" />                      
					</td>					
              </tr>
        </table>
        <input type="submit" value="등록하기"> &nbsp; 
    </form>
</div>





</body>
</html>