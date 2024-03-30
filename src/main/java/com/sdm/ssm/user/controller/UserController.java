package com.sdm.ssm.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.sdm.ssm.user.model.service.UserService;
import com.sdm.ssm.user.model.vo.User;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private JavaMailSenderImpl mailSender;

	// 뷰 페이지 내보내기
	@RequestMapping("goLogin.do")
	public String goLogin() {
		return "user/login";
	}

	@RequestMapping("goEnroll.do")
	public String goEnroll() {
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
	public void emailAuthMethod(@RequestParam("userEmail") String email) {
		logger.info("유저 이메일 주소 : " + email);
		// 난수의 범위 111111 ~ 999999 (6자리 난수)
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		// 이메일 보낼 양식
		String setFrom = "msj102525@naver.com"; // 2단계 인증 x, 메일 설정에서 POP/IMAP 사용 설정에서 POP/SMTP 사용함으로 설정o
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "인증 코드는 " + checkNum + " 입니다." + "<br>" + "해당 인증 코드를 인증 코드 확인란에 기입하여 주세요.";

		logger.info("유저 이메일 주소 : " + toMail);
		
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
	}
	

}
