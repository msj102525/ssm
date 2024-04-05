package com.sdm.ssm.user.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;

@Component
public class GoogleLoginAuth {
	private final static Logger logger = LoggerFactory.getLogger(KakaoLoginAuth.class);
	
	private final static String CLIENT_ID = "1004936024839-s9m7h41va31uoblnr4au9p26ueqihfkg.apps.googleusercontent.com";
	private final static String CLIENT_SECRET = "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";
	private final static String REDIRECT_URI = "http://127.0.0.1:8080/ssm/gcallback.do";
	private final static String GOOGLE_SCOPE = "email openid profile";
	private final static String PROFILE_API_URL ="https://www.googleapis.com/oauth2/v2/userinfo";
	private static final String SESSION_STATE="googleSessionState";
	
	/* 세션 유효성 검증을 위한 난수 생성기 */
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	/* http session에 데이터 저장 */
	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}

	/* http session에서 데이터 가져오기 */
	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
	
	// 구글 아이디로 인증 URL 생성 Method
	protected String getAuthorizationUrl(HttpSession session) {
		// 세션 유효성 검증을 위해 난수 생성
		String state = generateRandomString();
		// 생성한 난수 값을 session에 저장
		setSession(session, state);
		
		/* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
		// 앞서 생성한 난수값을 인증 URL생성시 사용함
		OAuth20Service oauthService = new ServiceBuilder()
												.apiKey(CLIENT_ID)
												.apiSecret(CLIENT_SECRET)
												.callback(REDIRECT_URI)
												.state(state)
												.build(GoogleLoginApi.instance());
		
		logger.info("naverURL : " + oauthService.toString());
		return oauthService.getAuthorizationUrl();
	}
	
	
}
