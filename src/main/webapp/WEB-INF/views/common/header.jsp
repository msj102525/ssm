<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/common/header.css?after" />
<script type="text/javascript" src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
	$(()=> {
		
	}) // document ready
	
	const logout = () => {
		location.href='logout.do';
		alert("로그아웃");
	}
</script>
</head>
<body>
	<%-- 로그인 안한 경우 --%>
	<c:if test="${ empty sessionScope.loginUser }">
		<header>
			<div class="inner-header">
				<nav>
					<h1 class="logo">
					<c:url var="callMain" value="main.do" />
						<a href= "${ callMain }"> 
							<img src="/ssm/resources/images/logo.png" alt="logo" />
						</a>
					</h1>
					<div class="gnb">
						<ul>
							<li></li>
							<li></li>
							<li></li>
							<li></li>
						</ul>
					</div>
					<div class="login-box">
						<div class="login-button-box">
							<button onclick="location.href='goLogin.do'">로그인</button>
						</div>
					</div>
				</nav>
			</div>
		</header>
	</c:if>
	
	<%-- 유저 로그인 --%>
	<c:if test="${ !empty loginUser &&  loginUser.adminOk ne 'Y'}">
		<header>
			<div class="inner-header">
				<nav>
					<h1 class="logo">
						<c:url var="callMain" value="main.do" />
						<a href= "${ callMain }">
							<img src="/ssm/resources/images/logo.png" alt="logo" />
						</a>
					</h1>
					</h1>
					<div class="gnb">
						<ul>
						
							<li><a href="#">공지사항</a></li>
							<li><a href="#">불편사항</a></li>
							<li><a href="${pageContext.servletContext.contextPath }/glist.do?page=1&id=${loginUser.id}">매장관리</a></li>
							<li><a href="#">매장관리</a></li>
						</ul>
					</div>
					<div class="login-box">
						<div class="profile-img-box">
							<img src="#" alt="프로필">
						</div>
						<div class="login-button-box">
							<button onclick="logout()">로그아웃</button>
						</div>
					</div>
				</nav>
			</div>
		</header>
	</c:if>
	
	<%-- 관리자 로그인 --%>
	<c:if test="${ !empty loginUser &&  loginUser.adminOk eq 'Y'}">
		<header>
			<div class="inner-header">
				<nav>
					<h1 class="logo">
						<c:url var="callMain" value="main.do" />
						<a href= "${ callMain }"> 
							<img src="/ssm/resources/images/logo.png" alt="logo" />
						</a>
					</h1>
					<div class="gnb">
						<ul>
							<li><a href="${pageContext.servletContext.contextPath }/nlist.do?page=1">공지글 관리</a>
							<li><a href="mvulist.do">사용자 관리</a></li>
							<li><a href="mvinconv.do">불편사항 관리</a></li>
							<li><a href="msubscribe.do">구독상품 관리</a></li>
						</ul>
					</div>
					<div class="login-box">
						<div class="profile-img-box">
							<img src="#" alt="프로필">
						</div>
						<div class="login-button-box">
							<button onclick="logout()">로그아웃</button>
						</div>
					</div>
				</nav>
			</div>
		</header>
	</c:if>
</body>
</html>