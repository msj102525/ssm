<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/user/enroll.css">
<script type="text/javascript" src="${ pageContext.servletContext.contextPath }/resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
const dupIDCheck =() => {
	const userId = $("#userId").val().trim();
	console.log(userId);
	
	if(userId != null && userId != "") {
	$.ajax({
		url: "idchk.do",
		type: "post",
		data: {userId: $("#userId").val() },
		success: (data) => {
			console.log("success!!!!!, data: " + data);
			
			if(data == "ok") {
				alert("사용 가능한 아이디입니다.");
				$("#userpwd").focus();
			} else {
				alert("이미 사용중인 아이디입니다.");
				$("#userId").val("");
				$("#userId").select();
			}
		},
		error: (jqXHR, textStatus, errorThrown) => {
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
	return false;
	} else {
		alert("아이디를 입력하세요.");
		$("#userId").focus();
	}
}

let code = "" ;

const emailAuth = () => {
	$.ajax({
		url: "emailAuth.do",
		data: {userEmail : $("#email").val()},
		type : "post",
		dataType : "json",
		success : (data) => {
			console.log("result : " + data);
			
			const objStr = JSON.stringify(data);
			const parseJson = JSON.parse(objStr);
			
			code = parseJson.authCode;
			
			console.log(code);
			
			alert("인증 코드가 입력하신 이메일로 전송 되었습니다");
			
			$("li.chkEmailAuth").css("display", "block");
		},
		error: (jqXHR, textStatus, errorThrown) => {
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	}) // ajax
}


$(()=> {

$("#userId").on("keyup", () => {
    const userIdLength = $("#userId").val().length;
    const message = "아이디는 5자리이상 16자리 이하로 입력해주세요";
    
    if (userIdLength < 5 || userIdLength > 16) {
    	$("li.relative > p").eq(0).html(message).css("color", "red");
    } else {
        $("li.relative > p").eq(0).html(message).css("color", "orange");
    }
});
	
$("#passWd").on("keyup", () => {
    const pw = $("#passWd").val();
    const message = "최소 8자이상 특수문자, 대문자 하나 포함하세요";
    const regex = /^(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.{8,})/;
    
    if (!regex.test(pw)) {
        $("li.relative > p").eq(1).html(message).css("color", "red");
    } else {
        $("li.relative > p").eq(1).html(message).css("color", "orange");
    }
});

$("#passWd2").on("keyup", () => {
    const pw = $("#passWd").val();
    const chkPw = $("#passWd2").val();
    const message = "비밀번호를 확인해 주세요";
    
    if (chkPw !== pw) {
        $("li.relative > p").eq(2).html(message).css("color", "red");
    } else {
        $("li.relative > p").eq(2).html("").css("color", "orange");
    }
});

$("#email").on("keyup", () => {
    const email = $("#email").val();
    const message = "이메일 형식을 확인해주세요";
    const regex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    
    if (!regex.test(email)) {
        $("li.relative > p").eq(3).html(message).css("color", "red");
        $("#chkEMail").css("display", "none");
    } else {
        $("li.relative > p").eq(3).html(message).css("color", "orange");
        $("#chkEMail").css("display", "block");
    }
});

$("#chkEmailAuth").on("keyup", () => {
	 const chkEmailAuth = $("#chkEmailAuth").val();
	 const message = "인증번호가 ";
	 
	if (chkEmailAuth != code) {
        $("li.relative > p").eq(4).html(message + "일치하지 않습니다").css("color", "red");
        $("#chkEMail").css("display", "block");
    } else {
        $("li.relative > p").eq(4).html(message + "일치합니다").css("color", "orange");
        $("#chkEMail").css("display", "none");
    }
})	;


$("#userNo").on("keyup", () => {
    const userNo = $("#userNo").val();
    const message = "주민등록번호 형식을 확인해주세요";
    const regex = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
    
    if (!regex.test(userNo)) {
        $("li.relative > p").eq(5).html(message).css("color", "red");
    } else {
        $("li.relative > p").eq(5).html(message).css("color", "orange");
    }
});

$("#phone").on("keyup", () => {
    const phone = $("#phone").val();
    const message = "전화번호 형식을 확인해주세요";
    const regex = /\d{3}-\d{3,4}-\d{4}/;
    
    if (!regex.test(phone)) {
        $("li.relative > p").eq(6).html(message).css("color", "red");
    } else {
        $("li.relative > p").eq(6).html(message).css("color", "orange");
    }
});


	
}); // doc ready;
	
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
							<input type="text" name="userNo" id="userNo" placeholder="주민번호 (ex.123456-*******)">
						</li>
						<li class="relative">
							<p></p>
							<input type="tel" name="phone" id="phone" placeholder="전화번호 (ex.010-1234-5678)">
						</li>
						<li class="auth relative">
							<p></p>
							<input type="text" name="businessNo" id="businessNo" placeholder="사업자 번호">
							<input type="button" value="사업자 인증">
						</li>
						<li class="auth relative">
							<p></p>
							<input type="text" name="accountNumber" id="accountNumber" placeholder="계좌번호">
							<input type="button" value="계좌인증">
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