<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/user/login.css">
<script type="text/javascript">

	
</script>
</head>
<body>
	<div class="login-box">
		<div class="inner-box">
			<div class="logo-box">
				<h1 class="logo">
					<c:url var="callMain" value="main.do" />
					<a href="${ callMain }"> <img src="/ssm/resources/images/logo.png" alt="logo" /></a>
				</h1>
			</div>
			<div class="form-box">
				<form action="login.do" method="post">
					<ul>
						<li>
							<input type="text" name="userId" id="uid" placeholder="아이디">
						</li>
						<li>
							<input type="password" name="passWd" id="upd" placeholder="비밀번호">
						</li>
						<li>
							<input type="submit" value="로그인" class="login">
						</li>
					</ul>
				</form>
				<ul>
					<li><a href="#">비밀번호 찾기 |</a> <a href="#">아이디 찾기 |</a> <a href="#">회원가입</a></li>
					<li>
						<p>----------------------- 또는 -----------------------</p>
					</li>
					<li>
						<c:url var="#" value="#" />
				 		<a href=#> 
							 <img src="/ssm/resources/images/kakaoLB.png" alt="logo" />
						</a>
					</li>
					<li>
						<c:url var="#" value="#" />
						<a href=#>
							<img src="/ssm/resources/images/naverLB.png" alt="logo" />
						</a>
					</li>
					<li>
						<c:url var="#" value="#" />
						 <a href=#>
						 	<img src="/ssm/resources/images/googleLB.png" alt="logo" />
						 </a>
					</li>
				</ul>
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>