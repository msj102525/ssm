<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ssm</title>
<link rel="stylesheet" href="resources/css/common/main.css?after1" />
<%-- jquery 파일 로드 --%>
<script type="text/javascript"
	src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
$(function(){
	//조치안된 불편사항 오래된순  10개출력
	$.ajax({
		url: "inconvtop10.do",
		type: "post",
		dataType: "json",
		success: function(data){
			console.log("success : " + data);
			
			//object --> string
			var str = JSON.stringify(data);
			
			//string --> json
			var json = JSON.parse(str);
			var string =""; 
			values = "";			
			for(var i in json.ilist){
				console.log(json.ilist[i].ino);
				console.log(json.ilist[i].status);
				console.log(json.ilist[i].ititle);
				console.log(json.ilist[i].iwriter);
			if(json.ilist[i].status == '1'){string = "조치전"}else if(json.ilist[i].status=='2'){string="조치중"}
			else{string="조치완료"};
			values += "<tr onclick='javascript:location.href=\"inconvdetail.do?ino=" + json.ilist[i].ino + "\";'><td>"
			+ decodeURIComponent(json.ilist[i].ititle).replace(/\+/gi, " ") + "</td><td>"
			+ json.ilist[i].iwriter + "</td><td>" + string + "</td></tr>";
}
			// 결과가 10개 미만일 때 빈 행을 추가하여 총 10개의 행
			for (var j = json.ilist.length; j < 10; j++) {
			    values += "<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>";
			}
	
			$('#inconvinience').html($('#inconvinience').html()+values);
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
});//document ready
</script>
<script>
$(function(){
	$.ajax({
		url: "countUser.do",
		type: "post",
		data:  {year : 2024} ,
		dataType: "json",
		success: function(data){
			var countMap = data.countMap;
			var countSubMap = data.countSubMap;
			 google.charts.load('current', {'packages':['corechart']});
		      google.charts.setOnLoadCallback(drawVisualization); 

		      function drawVisualization() {
		        // Some raw data (not necessarily accurate)
		        var data = google.visualization.arrayToDataTable([
		          ['Month', '가입자 수', '서비스 이용자 수'],
		          ['01',  countMap["01"],      countSubMap["01"]],
		          ['02',  countMap["02"],      countSubMap["02"]],
		          ['03',  countMap["03"],      countSubMap["03"]],
		          ['04',  countMap["04"],      countSubMap["04"]],
		          ['05',  countMap["05"],      countSubMap["05"]],
		          ['06',  countMap["06"],      countSubMap["06"]],
		          ['07',  countMap["07"],      countSubMap["07"]],
		          ['08',  countMap["08"],      countSubMap["08"]],
		          ['09',  countMap["09"],      countSubMap["09"]],
		          ['10',  countMap["10"],      countSubMap["10"]],
		          ['11',  countMap["11"],      countSubMap["11"]],
		          ['12',  countMap["12"],      countSubMap["12"]]
		        ]);

		        var options = {
		          title : '월간 이용자수/가입자수 추이',
		          vAxis: {title: 'Users'},
		          hAxis: {title: 'Month'},
		          seriesType: 'bars',
		          series: {5: {type: 'line'}}
		        };

		        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
		        chart.draw(data, options);
		      }
			
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
});
</script>
</head>
<body>
	<div id="wrap">
		<%-- header --%>
		<c:import url="/WEB-INF/views/common/header.jsp" />
		<c:import url="/WEB-INF/views/common/noticebanner.jsp" />
		<c:if test="${ empty sessionScope.loginUser }">
			<%-- section 로그인 안한 경우--%>
			<div class="section-container">
				<%-- section1 --%>
				<section class="sec1">
					section1
					<div class="inner-section">
						<div class="left-section">left</div>
						<div class="right-section">right</div>
					</div>
				</section>
				<%-- section2 --%>
				<section class="sec2">
					section2
					<div class="inner-section">
						<div class="left-section">left</div>
						<div class="right-section">right</div>
					</div>
				</section>
				<%-- section3 --%>
				section3
				<section class="sec3">
					<div class="inner-section">
						<div class="left-section">left</div>
						<div class="right-section">right</div>
					</div>
				</section>
				<%-- section4 --%>
				<section class="sec4">
					section4
					<div class="inner-section">
						<div class="left-section">left</div>
						<div class="right-section">right</div>
					</div>
				</section>
			</div>
		</c:if>
		<%-- 유저 로그인한 경우--%>
		<c:if test="${ !empty loginUser &&  loginUser.adminOk ne 'Y'}">
					<div class="section-container">
				<%-- section1 --%>
				<section class="sec1">
					section1
					<div class="inner-section">
						<div class="left-section">left</div>
						<div class="right-section">right</div>
					</div>
				</section>
				<%-- section2 --%>
				<section class="sec2">
					section2
					<div class="inner-section">
						<div class="left-section">left</div>
						<div class="right-section">right</div>
					</div>
				</section>
				<%-- section3 --%>
				section3
				<section class="sec3">
					<div class="inner-section">
						<div class="left-section">left</div>
						<div class="right-section">right</div>
					</div>
				</section>
				<%-- section4 --%>
				<section class="sec4">
					section4
					<div class="inner-section">
						<div class="left-section">left</div>
						<div class="right-section">right</div>
					</div>
				</section>
			</div>
		</c:if>
		<%-- 관리자 로그인한 경우--%>
		<c:if test="${ !empty loginUser &&  loginUser.adminOk eq 'Y'}">
			<div class="section-container">
				<%-- section1 --%>
				<section class="sec1">
					<div class="inner-section">
						<div id="chart_div" class="left-section">left</div>
						<div class="right-section">right</div>
					</div>
				</section>
				<%-- section2 --%>
				<section class="sec2">
					<div class="inner-section-incon">
						<table id="inconvinience">
							<tr id="titlerow">
								<th>제목</th>
								<th>작성자</th>
								<th>조치상태</th>
							</tr>
						</table>
					</div>
				</section>		
			</div>
		</c:if>
		<%-- footer --%>
		<c:import url="footer.jsp" />
	</div>
</body>
</html>