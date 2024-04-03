package com.sdm.ssm.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

import com.fasterxml.jackson.databind.JsonNode;
import com.sdm.ssm.user.model.service.UserService;
import com.sdm.ssm.user.model.vo.User;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPwEncoder;
	
	@Autowired
	private KakaoLoginAuth kakaologinAuth;

	// 뷰 페이지 내보내기
	@RequestMapping("goLogin.do")
	public String goLogin() {
		return "user/login";
	}

	@RequestMapping(value="goEnroll.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String goEnroll(Model model, HttpSession session) {
		String kakaoAuthURL = kakaologinAuth.getAuthorizationUrl(session);
		
		model.addAttribute("kakaourl", kakaoAuthURL);
		
		
		return "user/enroll";
	}

	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);

		if (session != null) {
			session.invalidate();
			return "common/main";
		} else {
			model.addAttribute("message", "로그인 세션 없거나 만료");
			return "common/error";
		}
	}
	
	@RequestMapping(value="kcallback.do", produces="application/json",
			method= {RequestMethod.GET, RequestMethod.POST})
	public String kakaoLogin(@RequestParam String code, Model model, HttpSession session) {
		logger.info("0. kcallback.do" + code);
		
		// 로그인 결과값을 node에 담기
		JsonNode node = kakaologinAuth.getAcessToken(code);
		logger.info("1. kcallback.do : " + node);
		
		// accessToken에 사용자의 로그인한 모든 정보가 들어있음
		JsonNode accessToken = node.get("access_token");
		logger.info("2. kcallback.do : " + accessToken);
		// 사용자 정보 추출
		JsonNode userInfo = kakaologinAuth.getKakaoUserInfo(accessToken);
		logger.info("3. kcallback.do : " + userInfo);
		
		// db table 에 기록할 회원정보 추출함 : 카카오 회원가입시
		//userInfo 에서 properties 정보 추출
		JsonNode properties = node.get("properties");
		logger.info("4. kcallback.do : " + properties);
		
		JsonNode kakao_account = userInfo.path("kakao_account");
		String kid = userInfo.path("id").asText();
		logger.info("5. kcallback.do : " + kakao_account);
		
		// 유저 테이블에서 회원 정보 조회해 오기
		User loginUser = null;
		User kUser = userService.selectUserById(kid);
		
		if(kUser == null) {
			return "redirect:goEnroll.do?kid=" + kid;
		} else {
			loginUser = kUser;
			session.setAttribute("loginUser", loginUser);
			return "redirect:main.do";
		}
		
	}
	
	

	// 서비스 메소드 실행
	// 로그인
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginMethod(User user, HttpSession session, SessionStatus status, Model model) {
		logger.info("login.do!!!!!!!!!!!!!!!" + user.toString());
		User loginUser = null;

		if (user.getUserId() != null && !user.getUserId().trim().isEmpty()) {
			loginUser = userService.selectUserById(user.getUserId().trim());
		}

		if (loginUser != null && (user.getPassWd() != null && !user.getPassWd().trim().isEmpty()
				&& loginUser.getPassWd() != null && !loginUser.getPassWd().trim().isEmpty()
				&& user.getPassWd().trim().equals(loginUser.getPassWd().trim()))) {
			logger.info("loginUser!!!!!!!!!" + loginUser.toString());

			session.setAttribute("loginUser", loginUser);
			status.setComplete();
			return "common/main";
		} else {
			model.addAttribute("message", "로그인 실패!");
			return "common/error";
		}

	}

	// 아이디 중복 체크
	@RequestMapping(value = "idchk.do", method = RequestMethod.POST)
	public void dupChkIDMethod(@RequestParam("userId") String userId, HttpServletResponse response) {

		int idCount = userService.selectUserCountById(userId);

		String result = null;
		if (idCount == 0) {
			result = "ok";
		} else {
			result = "dup";
		}

		logger.info("result!!!!!!!!!!!!!!" + result);
		PrintWriter out = null;
		response.setContentType("text/html; charset=utf-8");
		try {
			out = response.getWriter();
			out.append(result);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	// 이메일 인증

	@RequestMapping(value = "emailAuth.do", method = RequestMethod.POST)
	@ResponseBody
	public String emailAuthMethod(
			@RequestParam("userEmail") String email) {
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		// 이메일 보낼 양식
		String setFrom = "msj102525@naver.com"; // 2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "인증 코드는 " + checkNum + " 입니다." + "<br>" + "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage(); // Spring에서 제공하는 mail API
			MimeMessageHelper mailHelper = new MimeMessageHelper(message, "utf-8");
			
			mailHelper.setFrom(setFrom);
			mailHelper.setTo(toMail);
			mailHelper.setSubject(title);
			mailHelper.setText(content, true);
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		logger.info("랜덤숫자 : " + checkNum);
		
		JSONObject jOb = new JSONObject();
		jOb.put("authCode", checkNum);
		
		return jOb.toJSONString();
	}
	
	// 회원 가입 요청
	@RequestMapping(value="enroll.do", method=RequestMethod.POST)
	public String memberInsertMethod(User user, Model model) {
		user.setPassWd(bcryptPwEncoder.encode(user.getPassWd()));
		
		if(userService.insertUser(user) > 0) {
			return "user/login.jsp";
		} else {
			return "common/error";
		}
		
		
	}
	

}
