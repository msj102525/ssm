<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" errorPage="error.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ssm</title>
<link rel="stylesheet" href="resources/css/common/main.css" />
<%-- jquery 파일 로드 --%>
<script type="text/javascript"
	src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(() =>{
	
}); //document ready

</script>

</head>
<body>
	<div id="wrap">
		<%-- header --%>
		<c:import url="/WEB-INF/views/common/header.jsp" />

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

		<%-- 유저 로그인한 경우--%>

		<%-- 관리자 로그인한 경우--%>

		<%-- footer --%>
		<c:import url="footer.jsp" />
	</div>
</body>
</html>