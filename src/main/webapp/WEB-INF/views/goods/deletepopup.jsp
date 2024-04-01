<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script>
    // 페이지가 로드될 때 실행되는 함수
    window.onload = function() {
        // 선택된 상품 정보를 가져옴
        var selectedGoods = JSON.parse('${selectedGoods}');

        // id 값과 goodsNO 값을 가져와서 출력
        var idValue = selectedGoods.id;
        var goodsNoValue = selectedGoods.goodsNo;
        document.getElementById("idValue").innerText = "ID 값: " + idValue;
        document.getElementById("goodsNoValue").innerText = "Goods NO 값: " + goodsNoValue;
    };
</script>


</head>
<body>
	<div style="text-align: center;">
		<p id="idValue"></p>
    	<p id="goodsNoValue"></p>
    	<h3>삭제하시겠습니까?</h3>
    	<a href="gdelete.do" style="margin-right: 10px;">확인</a>
    	<a href="javascript:void(0);" onclick="closeWindow();">취소</a>
	</div>
	
	<!-- 확인 버튼 -->
	<script>
		function confirmDelete() {
	    // 선택된 상품 정보를 가져옴
	    var selectedGoods = JSON.parse('${selectedGoods}');
	
	    // gdelete.do로 이동하기 위한 URL 생성
	    var deleteUrl = 'gdelete.do?id=' + selectedGoods.id + '&goodsNo=' + selectedGoods.goodsNo;
	
	    // gdelete.do로 이동
	    window.location.href = deleteUrl;
		}
	</script>
	
	
	<!-- 삭제 버튼 -->
	<script>
		function closeWindow() {
			window.open('', '_self').close();
		}
	</script>


</body>
</html>


