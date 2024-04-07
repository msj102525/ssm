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
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	$(function() {
		//조치안된 불편사항 오래된순  10개출력
		$.ajax({
					url : "inconvtop10.do",
					type : "post",
					dataType : "json",
					success : function(data) {
						console.log("success : " + data);

						//object --> string
						var str = JSON.stringify(data);

						//string --> json
						var json = JSON.parse(str);
						var string = "";
						values = "";
						for ( var i in json.ilist) {
							console.log(json.ilist[i].ino);
							console.log(json.ilist[i].status);
							console.log(json.ilist[i].ititle);
							console.log(json.ilist[i].iwriter);
							if (json.ilist[i].status == '1') {
								string = "조치전"
							} else if (json.ilist[i].status == '2') {
								string = "조치중"
							} else {
								string = "조치완료"
							}
							;
							values += "<tr onclick='javascript:location.href=\"inconvdetail.do?ino="
									+ json.ilist[i].ino
									+ "\";'><td>"
									+ decodeURIComponent(json.ilist[i].ititle)
											.replace(/\+/gi, " ")
									+ "</td><td>"
									+ json.ilist[i].iwriter
									+ "</td><td>"
									+ string + "</td></tr>";
						}
						// 결과가 10개 미만일 때 빈 행을 추가하여 총 10개의 행
						for (var j = json.ilist.length; j < 10; j++) {
							values += "<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>";
						}

						$('#inconvinience').html(
								$('#inconvinience').html() + values);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("error : " + jqXHR + ", " + textStatus
								+ ", " + errorThrown);
					}
				});
	});//document ready
</script>
<script>
	$(function() {
		// 현재 년도 구하기
		var currentYear = new Date().getFullYear();

		// 그래프 그리기 함수 호출
		drawVisualization(currentYear);

		// 왼쪽 버튼 클릭 시 이벤트 처리
		$("#leftButton").click(function() {
			currentYear -= 1; // 현재 년도에서 1을 빼기
			drawVisualization(currentYear); // 그래프 다시 그리기
		});

		// 오른쪽 버튼 클릭 시 이벤트 처리
		$("#rightButton").click(function() {
			currentYear += 1; // 현재 년도에서 1을 더하기
			drawVisualization(currentYear); // 그래프 다시 그리기
		});

		function drawVisualization(year) {
			$.ajax({
				url : "countUser.do",
				type : "post",
				data : {
					year : year
				},
				dataType : "json",
				success : function(data) {
					var countMap = data.countMap;
					var countSubMap = data.countSubMap;
					var calculateSalesMap = data.0;
					google.charts.load('current', {
						'packages' : [ 'corechart' ]
					});
					google.charts.setOnLoadCallback(function() {
						drawChart(countMap, countSubMap, year);
						drawChart2(calculateSalesMap, year);
					});
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("error : " + jqXHR + ", " + textStatus + ", "
							+ errorThrown);
				}
			});
		}

		function drawChart(countMap, countSubMap, year) {
			var data = google.visualization.arrayToDataTable([
					[ 'Month', '가입자 수', '서비스 이용자 수' ],
					[ '01', parseInt(countMap["01"]),
							parseInt(countSubMap["01"]) ],
					[ '02', parseInt(countMap["02"]),
							parseInt(countSubMap["02"]) ],
					[ '03', parseInt(countMap["03"]),
							parseInt(countSubMap["03"]) ],
					[ '04', parseInt(countMap["04"]),
							parseInt(countSubMap["04"]) ],
					[ '05', parseInt(countMap["05"]),
							parseInt(countSubMap["05"]) ],
					[ '06', parseInt(countMap["06"]),
							parseInt(countSubMap["06"]) ],
					[ '07', parseInt(countMap["07"]),
							parseInt(countSubMap["07"]) ],
					[ '08', parseInt(countMap["08"]),
							parseInt(countSubMap["08"]) ],
					[ '09', parseInt(countMap["09"]),
							parseInt(countSubMap["09"]) ],
					[ '10', parseInt(countMap["10"]),
							parseInt(countSubMap["10"]) ],
					[ '11', parseInt(countMap["11"]),
							parseInt(countSubMap["11"]) ],
					[ '12', parseInt(countMap["12"]),
							parseInt(countSubMap["12"]) ] ]);

			var options = {
				title : year + '년도 월간 이용자수/가입자수 추이',
				vAxis : {
					title : 'Users'
				},
				hAxis : {
					title : 'Month'
				},
				seriesType : 'bars'
			};

			var chart = new google.visualization.ComboChart(document
					.getElementById('chart_div'));
			chart.draw(data, options);
		}
		function drawChart2(calculateSalesMap, year) {
			var data = google.visualization.arrayToDataTable([
					[ 'Month', '매출'],
					[ '01', parseInt(calculateSalesMap["01"])],
					[ '02', parseInt(calculateSalesMap["02"])],
					[ '03', parseInt(calculateSalesMap["03"])],
					[ '04', parseInt(calculateSalesMap["04"])],
					[ '05', parseInt(calculateSalesMap["05"])],
					[ '06', parseInt(calculateSalesMap["06"])],
					[ '07', parseInt(calculateSalesMap["07"])],
					[ '08', parseInt(calculateSalesMap["08"])],
					[ '09', parseInt(calculateSalesMap["09"])],
					[ '10', parseInt(calculateSalesMap["10"]) ],
					[ '11', parseInt(calculateSalesMap["11"]) ],
					[ '12', parseInt(calculateSalesMap["12"])]
						]);

			var options = {
				title : year + '년도 월별 매출',
				vAxis : {
					title : 'Sales'
				},
				hAxis : {
					title : 'Month'
				},
				seriesType : 'lines'
			};

			var chart = new google.visualization.ComboChart(document
					.getElementById('chart_div2'));
			chart.draw(data, options);
		}
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
						<div>
							<button id="leftButton">&lt;</button>
						</div>
						<div id="chart_div" class="left-section"></div>
						<div id="chart_div2" class="right-section"></div>
						<div>
							<button id="rightButton">&gt;</button>
						</div>
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