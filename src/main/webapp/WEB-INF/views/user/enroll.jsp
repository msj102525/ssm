<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/user/enroll.css">
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/user/enroll.js" defer></script>
<script type="text/javascript">

/* const accountNumAuthChk = () => {
	var tmpWindow = window.open(url: "about:blank");
	tmpWindow.location = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?"
	+ "response_type=code&"
	+"client_id=1841bcd5-82dd-443b-b290-9d5c2cf333bf&"
	+"redirect_uri=http://127.0.0.1:8080/ssm/goEnroll.do&"
	+"scope=login inquiry transfer&"
	+"state=12312312312312312312312312312312&"
	+"auth_type=0";
} */



$(() => {
	
}); //doc ready;

</script>
</head>
<body>
	<div class="enroll-box">
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
				<form action="enroll.do" method="post">
					<ul>
						<li class="auth relative first">
							<p></p>
							<input type="text" name="userId" id="userId" placeholder="아이디">
							<input type="button" value="중복검사" onclick="return dupIDCheck();">
						</li>
						<li class="relative">
							<p></p>
							<input type="password" name="passWd" id="passWd" placeholder="비밀번호">
						</li>
						<li class="relative">
							<p></p>
							<input type="password"id="passWd2" placeholder="비밀번호 확인">
						</li>
						<li class="auth relative">
							<p></p>
							<input type="email" name="email" id="email" placeholder="이메일">
							<input type="button" value="이메일 인증" class="chkEMail" id="chkEMail" onclick="emailAuth();">
						</li>
						<li class="auth relative chkEmailAuth">
							<p></p>
							<input type="text"  id="chkEmailAuth" placeholder="인증번호">
							<!-- <input type="button" value="이메일 인증 확인"> -->
						</li>
						<li class="relative">
							<p></p>
							<input type="text" name="userNo" id="userNo" placeholder="생년월일 (ex.19980101)">
						</li>
						<li class="relative">
							<p></p>
							<input type="tel" name="phone" id="phone" placeholder="전화번호 (ex.010-1234-5678)">
						</li>
						<li class="auth relative">
							<p></p>
							<input type="text" name="businessNo" id="businessNo" placeholder="사업자 번호 (ex.123 45 789)">
							<input type="button" value="사업자 인증" id="businessNoBtn" onclick="busicessNoChk();">
						</li>
						<li>
							<input type="text" name="businessStoreName" id="businessStoreName" readonly>						
						</li>
						<li class="auth relative">
							<p></p>
							<input type="text" name="accountNumber" id="accountNumber" placeholder="계좌번호">
							<input type="button" value="계좌인증" id="accountNumBtn" onclick="accountNumChk();">
						</li>
						<li>
							<input type="submit" value="회원가입" class="enroll">
						</li>
					</ul>
				</form>
				
			</div>
		</div>
	</div>

	<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>