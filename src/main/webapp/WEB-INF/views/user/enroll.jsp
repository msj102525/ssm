<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/user/enroll.css?ver46">
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
				<ul class="go-page">
					<li>
						<ul class="sns">
							<li>
								<c:url var="#" value="#" />
						 		<a href=#> 
									 <img src="/ssm/resources/images/kakaoLB.png" alt="카카오로고" />
								</a>
							</li>
							<li>
								<c:url var="#" value="#" />
								<a href=#>
									<img src="/ssm/resources/images/naverLB.png" alt="네이버로고" />
								</a>
							</li>
							<li>
								<c:url var="#" value="#" />
								<a href=#>
								 	<img src="/ssm/resources/images/googleLB.png" alt="구글로고" />
								</a>
							</li>
						</ul>
					</li>
				</ul>
				<form action="login.do" method="post">
					<ul>
						<li>
							<input type="text" name="userId" id="uid" placeholder="아이디">
						</li>
						<li>
							<input type="password" name="passWd" id="upd" placeholder="비밀번호">
						</li>
						<li>
							<input type="password" name="passWd" id="upd" placeholder="비밀번호">
						</li>
						<li>
							<input type="password" name="passWd" id="upd" placeholder="비밀번호">
						</li>
						<li>
							<input type="password" name="passWd" id="upd" placeholder="비밀번호">
						</li>
						<li>
							<input type="password" name="passWd" id="upd" placeholder="비밀번호">
						</li>
						<li>
							<input type="password" name="passWd" id="upd" placeholder="비밀번호">
						</li>
						<li>
							<input type="password" name="passWd" id="upd" placeholder="비밀번호">
						</li>
						<li>
							<input type="password" name="passWd" id="upd" placeholder="비밀번호">
						</li>
						<li>
							<input type="submit" value="로그인" class="login">
						</li>
					</ul>
				</form>
				
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>