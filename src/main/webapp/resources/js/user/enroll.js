"use strict";

const busicessNoChk = () => {
	const key = "bXNqMTAyNTI1QGdtYWlsLmNvbSAg"
	const businessNoVal = $("#businessNo").val();
	const businessNoRmSpace = businessNoVal.replace(/\s/g, "");
	
	console.log(businessNoVal);
	console.log(businessNoRmSpace);
	console.log(!!businessNoVal);
	console.log(!businessNoVal);
	console.log(typeof businessNoVal);
	
	console.log(`${businessNoRmSpace}`);
	
	if(!!businessNoVal && businessNoVal !=""){
		$.ajax({
		  url: `https://bizno.net/api/fapi?key=${key}&gb=1&q=${businessNoRmSpace}&type=json`,
		  type: "get",
		  dataType: "JSON",		 
		  success: function(result) {
		      console.log(result);
		      console.log(result.items[0]);
		      console.log("사업자 번호 : " + result.items[0].bno);
		      console.log("사업장명 : " + result.items[0].company);
		      
		      $("#businessStoreName").val(result.items[0].company);
		      
		  },
		  error: function(result) {
			  alert("error!");
		  }
	});
		
	} else {
		alert("사업자 번호를 입력해 주세요.");
		$("businessNo").select();
	}
}

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
    	$(".enroll").prop("disabled", true);
    } else {
        $("li.relative > p").eq(0).html(message).css("color", "orange");
        $(".enroll").prop("disabled", false);
    }
});
	
$("#passWd").on("keyup", () => {
    const pw = $("#passWd").val();
    const message = "최소 8자이상 특수문자, 대문자 하나 포함하세요";
    const regex = /^(?=.*[A-Z])(?=.*[!@#$%^&*])(?=.{8,})/;
    
    if (!regex.test(pw)) {
        $("li.relative > p").eq(1).html(message).css("color", "red");
        $(".enroll").prop("disabled", true);
    } else {
        $("li.relative > p").eq(1).html(message).css("color", "orange");
        $(".enroll").prop("disabled", false);
    }
});

$("#passWd2").on("keyup", () => {
    const pw = $("#passWd").val();
    const chkPw = $("#passWd2").val();
    const message = "비밀번호를 확인해 주세요";
    
    if (chkPw !== pw) {
        $("li.relative > p").eq(2).html(message).css("color", "red");
        $(".enroll").prop("disabled", true);
    } else {
        $("li.relative > p").eq(2).html("").css("color", "orange");
        $(".enroll").prop("disabled", false);
    }
});

$("#email").on("keyup", () => {
    const email = $("#email").val();
    const message = "이메일 형식을 확인해주세요";
    const regex = /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/;
    
    if (!regex.test(email)) {
        $("li.relative > p").eq(3).html(message).css("color", "red");
        $("#chkEMail").css("display", "none");
        $(".enroll").prop("disabled", true);
    } else {
        $("li.relative > p").eq(3).html(message).css("color", "orange");
        $("#chkEMail").css("display", "block");
        $(".enroll").prop("disabled", false);
    }
});

$("#chkEmailAuth").on("keyup", () => {
	 const chkEmailAuth = $("#chkEmailAuth").val();
	 const message = "인증번호가 ";
	 
	if (chkEmailAuth != code) {
        $("li.relative > p").eq(4).html(message + "일치하지 않습니다").css("color", "red");
        $("#chkEMail").css("display", "block");
        $(".enroll").prop("disabled", true);
    } else {
        $("li.relative > p").eq(4).html(message + "일치합니다").css("color", "orange");
        $("#chkEMail").css("display", "none");
        $(".enroll").prop("disabled", false);
    }
})	;

$("#userNo").on("keyup", () => {
	    const userNo = $("#userNo").val();
	    const message = "생년월일 형식을 확인해주세요";
	    const regex =  /^(19|20)\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])$/;
	    
	    if (!regex.test(userNo)) {
	        $("li.relative > p").eq(5).html(message).css("color", "red");
	        $(".enroll").prop("disabled", true);
	    } else {
	        $("li.relative > p").eq(5).html(message).css("color", "orange");
	        $(".enroll").prop("disabled", false);
	    }
	});



$("#phone").on("keyup", () => {
    const phone = $("#phone").val();
    const message = "전화번호 형식을 확인해주세요";
    const regex = /\d{3}-\d{3,4}-\d{4}/;
    
    if (!regex.test(phone)) {
        $("li.relative > p").eq(6).html(message).css("color", "red");
        $(".enroll").prop("disabled", true);
    } else {
        $("li.relative > p").eq(6).html(message).css("color", "orange");
        $(".enroll").prop("disabled", false);
    }
});

}); //doc ready;