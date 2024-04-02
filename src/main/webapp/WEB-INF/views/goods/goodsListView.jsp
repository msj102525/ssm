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
	
	$('#checkBoxAll').click(function () {
	       if ($(this).is(":checked")) {
	         $(".chkCheckBoxId").prop("checked", true)
	       }else{
	         $(".chkCheckBoxId").prop("checked", false)
	       }
	     });
});  //document ready

</script>


</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

<hr>
<br>
<c:import url="/WEB-INF/views/common/sidebar.jsp" />
<h1 style="text-align: center;">재고 현황</h1>
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
</style>

<script type="text/javascript">
$('#checkBoxAll').click(function () {
    if ($(this).is(":checked")) {
      $(".chkCheckBoxId").prop("checked", true)
    }else{
      $(".chkCheckBoxId").prop("checked", false)
    }
  });
</script>
	
	<div class="searchdiv">
		<form action="gsearch.do" method="get">
			<input type="hidden" id = "id" name="id" value="${ loginUser.id }">
			<select style="height: 35px; width: 80px;" name="action"
				id="searchselect">
				<option value="goodsName">상품명</option>
				<option value="pdName">발주처</option>
			</select>  
			<input style="height: 30px; width: 325px;"
				type="text" id="searchtext" name="keyword" placeholder="검색어 입력">
			<input type="submit" class="searchbtn" value="검색">
			
			<c:forEach items="${goodsList}" var="goodsPrint">
				<input type="checkbox" class="chkCheckBoxId checkbox"
					value="${goodsPrint.goodsNo}">
			</c:forEach>		
		</form>
<br>	
<button onclick="checkSelectedGoods();">확인</button>			
<button onclick="updateSelectedGoods();">저장</button>			
<button onclick="deleteSelectedGoods();">삭제</button>
<button onclick="javascript:location.href='${pageContext.servletContext.contextPath}/glist.do?page=1&id=${loginUser.id}';">목록</button>
<br>

<script>
    function checkSelectedGoods() {
        var selectedGoodsNos = [];
        var id = document.getElementById("id").value;
        
        // 선택된 체크박스에서 goodsNo 추출
        $(".chkCheckBoxId:checked").each(function() {
            selectedGoodsNos.push($(this).val());
        });

        // ID와 선택된 goodsNo를 확인하는 알럿 표시
        var message = "ID: " + id + "\n";
        message += "선택된 goodsNo: ";
        if (selectedGoodsNos.length > 0) {
            message += selectedGoodsNos.join(", ");
        } else {
            message += "없음";
        }
        alert(message);
    }
</script>


<!-- 삭제 버튼 -->
<script>
    function deleteSelectedGoods() {
    	var jarr = new Array();
    	
        // 선택된 체크박스에서 goodsNo 추출
        $(".chkCheckBoxId:checked").each(function() {
        	 var job = new Object();
        	 job.id = parseInt(${loginUser.id});
        	 job.goodsNo = $(this).val();
        	 /* var goodsObj = { id: id , goodsNo: goodsNo }; */
        	 jarr.push(job
        			 );
        });
          
        $.ajax({
            type  : "POST",
            url    : "gdelete.do",
            data: JSON.stringify(jarr),
            contentType: "application/json; charset=utf-8",
            success: function(result){
            	location.reload(); 
            },
            error: function(request, status, errorData){
            	console.log(jarr); 
            	console.log(jarr); 
				console.log("error code : " + request.status
						+ "\nMessage : " + request.responseText
						+ "\nError : " + errorData);
			} 
         });      
    }
</script>		
		
		
		
		
		
		<br>
	</div>

<!-- <script>
$("#deleteButton").click(function() {
    var selectedGoods = [];
    var id = parseInt($("#id").val());
    console.log("아이이이" + id);
    selectedGoods.push(id);
    $(".chkCheckBoxId:checked").each(function() {
        var goodsNo = $(this).val();           
        selectedGoods.push(goodsNo); // id 값을 함께 추가
    });
    
    console.log(selectedGoods);

    var popupUrl = "http://localhost:8080/ssm/deletepopup.do?selectedGoods=" + encodeURIComponent(JSON.stringify(selectedGoods));
    window.open(popupUrl, "_blank", "width=350, height=150, top=150, left=50, scrollbars=no");
});
</script> -->




	<%-- 조회된 상품 목록 출력 --%>
<div style="margin-left: auto; margin-right: auto; width: 1400px;">
    <form action="gsearch.do" method="post">
    	<input type="hidden" id = "id" name="id", value="${ loginUser.id }">
        <table align="center" border="1" cellspacing="25" width="100%">
        	<thead>
            	<th class="table-head"><input type="checkbox" id="checkBoxAll"></th>
                <th style="text-align: center; white-space: nowrap;">번호</th>
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
            <thead>
            <c:forEach items="${ requestScope.list }" var="goodsPrint">
                <tr>               	
                	<td class="table-data">
                	<input type="checkbox" class="chkCheckBoxId" value="${goodsPrint.goodsNo}">
                	</td>
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
                            <input type="number" value="${ goodsPrint.goodsPrice }" name="goodsPrice" style="width: 50px; margin-right: 0px; vertical-align: middle;" />
                        </div>
                    </td>
                    
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