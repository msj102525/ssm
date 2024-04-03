package com.sdm.ssm.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Component("kakaoLoginAuth")
public class KakaoLoginAuth {
	private final static Logger logger = LoggerFactory.getLogger(KakaoLoginAuth.class);
	
	// js app key
	private final static String K_CLIENT_ID = "416eb2f9ae17657a348268fa2c296e77";
	// 로그인용 redirect uri
	private final static String K_REDIRECT_URI = "http://127.0.0.1:8080/ssm/kcallback.do";
	
	// 카카오 로그인 페이지로 이동 url 리턴용
	public String getAuthorizationUrl(HttpSession session) {
		String kakaoURL =
				"https://kauth.kakao.com/oauth/authorize?"
				+ "client_id=" + K_CLIENT_ID
				+ "&redirect_uri=" + K_REDIRECT_URI
				+ "&response_type=code";
		
		logger.info("kakaoURL : " + kakaoURL);
		
		
		return kakaoURL;
	}
	
	// 카카오 api 서버 접근 토큰받아서 리턴
	public JsonNode getAcessToken(String authorize_code) {
		final String RequestURL =
				"https://kauth.kakao.com/oauth/token";
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID));
		postParams.add(new BasicNameValuePair("redirect_uri", K_REDIRECT_URI));
		postParams.add(new BasicNameValuePair("code", authorize_code));
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestURL);
		
		JsonNode returnNode = null;
		
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return returnNode;
	}
	
	// 사용자 정보 얻어오기
	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
		final String RequestURL = "https://kapi.kakao.com/v2/user/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestURL);
		
		// header 에 추가
		//** 주의 : accessToken 값은 JsonNode 형이어야 함
		// Bearer 뒤에 스페이스바 꼭 추가
		
		post.addHeader("Authorization", "Bearer " + accessToken);
		
		logger.info("post!!! : " + post.toString());
		
		JsonNode returnNode = null;
		
		try {
			final HttpResponse response = client.execute(post);
			
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return returnNode;
	}
	
}
