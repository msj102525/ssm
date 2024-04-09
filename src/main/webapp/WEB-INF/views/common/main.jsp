<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<title>ssm</title>
<link rel="stylesheet" href="resources/css/common/main.css" />
<%-- jquery 파일 로드 --%>
<script type="text/javascript"
	src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript"
	src="/ssm/resources/js/main/main.js"></script>

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
				<br>
				<section class="sec1">
				<div align="center">
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
				</div>
					<div class="inner-section" style="height: 400px;">
						<div class="left-section" style="height: 400px;">
							<table id="myTable" border="1" width="100%" style="height: 400px;">
								<tr style="height: 10px;">
									<th style="text-align: center; white-space: nowrap;">항목</th>
									<th style="text-align: center; white-space: nowrap;">금액</th>
								</tr>
								<tr>
									<td align="center" style="white-space: nowrap;">월 매출</td>
									<td align="center" style="white-space: nowrap;">
										<span id="monthlySales">월 매출 출력칸</span>
									</td>
								</tr>	
								<tr>
									<td align="center" style="white-space: nowrap;">월 발주 금액</td>
				    				<td align="center" style="white-space: nowrap;">						
										<span id="monthlyPdPrice" ></span>						
									</td>
								</tr>	
								<tr>
									<td align="center" style="white-space: nowrap;">월 급여</td>
									<td align="center" style="white-space: nowrap;">
										<span id="monthlySalary">월 급여 총합 출력칸</span>	
									</td>
								</tr>	
								<tr>
									<td align="center" style="white-space: nowrap;">월세</td>
									<td align="center" style="white-space: nowrap;">
										<input id="monthlyRent" type="number" placeholder="월세 입력">
									</td>
								</tr>	
								<tr>
									<td align="center" style="white-space: nowrap;">세금</td>
									<td align="center" style="white-space: nowrap;">
										<input id="montlyTax" type="number" placeholder="세금 입력">
									</td>
								</tr>		
								<tr>
									<td align="center" style="white-space: nowrap;">기타비용</td>
									<td align="center" style="white-space: nowrap;">
										<input id="monthlyCost" type="number" placeholder="기타비용 입력">
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
						<div class="right-section" id="chart_div_sale" style="height: 400px;">그래프</div>
					</div>
				</section>
				<%-- section2 --%>
				<section class="sec2">
					<div class="inner-section">
						<div class="left-section">
						<div class="title"><p class="title">문의 내역</p></div>
						<table id="inconvinienceUser" class="inconvinience">
							<tr class="titlerow">
								<th>제목</th>
								<th>조치상태</th>
							</tr>
						</table>
						<input type="hidden" id="loginUserId" value="${loginUser.id}">
						</div>
						<div class="right-section">예약달력자리입니다.</div>
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
			
					<p class="title">조치사항</p>
						<table id="inconvinienceAdmin" class="inconvinience">
							<tr class="titlerow">
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