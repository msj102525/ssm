<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/common/header.css" />
</head>
<body>
	<header>
		<div class="inner-header">
			<nav>
				<h1 class="logo">
					<a href="#"> <img src="#" alt="logo" /></a>
				</h1>
				<div class="gnb">
					<%-- 로그인 안한 경우 --%>
					<ul>
						<li></li>
						<li></li>
						<li></li>
						<li></li>
					</ul>
				</div>
				<div class="login-box">
					<div class="login-button-box">
						<button type="button">로그인</button>
					</div>
				</div>
			</nav>
		</div>
	</header>

	<%-- 유저 로그인 --%>
	<header>
		<div class="inner-header">
			<nav>
				<h1 class="logo">
					<a href="#"> <img src="#" alt="logo" /></a>
				</h1>
				<div class="gnb">
					<ul>
						<li><a href="#">공지사항</a></li>
						<li><a href="#">불편사항</a></li>
						<li><a href="${pageContext.servletContext.contextPath }/glist.do?page=1">매장관리</a></li>
						<li><a href="#">매장관리</a></li>
					</ul>
				</div>
				<div class="login-box">
					<div class="profile-img-box">
						<img src="#" alt="프로필">
					</div>
					<div class="login-button-box">
						<button type="button">로그아웃</button>
					</div>
				</div>
			</nav>
		</div>
	</header>

	<%-- 관리자 로그인 --%>
	<header>
		<div class="inner-header">
			<nav>
				<h1 class="logo">
					<a href="#"> <img src="#" alt="logo" /></a>
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
						<button type="button">로그아웃</button>
					</div>
				</div>
			</nav>
		</div>
	</header>

</body>
</html>