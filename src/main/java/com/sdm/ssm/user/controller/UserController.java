package com.sdm.ssm.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.sdm.ssm.user.model.service.UserService;
import com.sdm.ssm.user.model.vo.User;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	// 뷰 페이지 내보내기
	@RequestMapping("goLogin.do")
	public String goLogin() {
		return "user/login";
	}
	
	@RequestMapping("logout.do")
	public String logoutMethod(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.invalidate();
			return "common/main";
		} else {
			model.addAttribute("message", "로그인 세션 없거나 만료");
			return "common/error";
		}
	}
	
	
	// 서비스 메소드 실행
	@RequestMapping(value="login.do", method= {RequestMethod.POST, RequestMethod.GET})
	public String loginMethod(User user, HttpSession session, SessionStatus status, Model model) {
	    logger.info("login.do!!!!!!!!!!!!!!!" + user.toString());
	    User loginUser = null;
	    
	    if(user.getUserId() != null && !user.getUserId().trim().isEmpty()) {
	        loginUser = userService.selectUserById(user.getUserId().trim());
	    }
	    
	    if(loginUser != null) {
	        logger.info("loginUser!!!!!!!!!" + loginUser.toString());
	        
	        if(user.getPassWd() != null && !user.getPassWd().trim().isEmpty() && 
	           loginUser.getPassWd() != null && !loginUser.getPassWd().trim().isEmpty() &&
	           user.getPassWd().trim().equals(loginUser.getPassWd().trim())) {
	            session.setAttribute("loginUser", loginUser);
	            status.setComplete();
	            return "common/main";
	        }
	    }
	    
	    model.addAttribute("message", "로그인 실패!");
	    return "common/error";
	}

	
	
}
