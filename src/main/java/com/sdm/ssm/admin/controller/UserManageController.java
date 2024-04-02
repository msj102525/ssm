package com.sdm.ssm.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdm.ssm.admin.service.UserManageService;
import com.sdm.ssm.common.Paging;
import com.sdm.ssm.user.model.service.UserService;
import com.sdm.ssm.user.model.vo.User;

@Controller
public class UserManageController {
	private static final Logger logger = LoggerFactory.getLogger(UserManageController.class);
	@Autowired
	private UserManageService umService;
	@Autowired
	private UserService userService;
	
	//유저 전체 출력
	@RequestMapping(value="ulist.do")
	public String userListMethod(@RequestParam(name="page", required=false) String page,
			Model model) {
		int currentPage =1;
		if(page != null && page.length()>0) {
			currentPage = Integer.parseInt(page);
		}
		int listCount = umService.selectListCount();
		int limit = 10;
		Paging paging = new Paging(listCount, currentPage, limit, "ulist.do");
		paging.calculate();
		ArrayList<User> list = umService.selectList(paging);
		
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("currentPage", currentPage);
		
		return "admin/usermanage";
		
		
	}
	@RequestMapping(value="userManageDetail.do", method=RequestMethod.POST)
	@ResponseBody
	public String userManageDetailMethod(HttpServletResponse response, @RequestParam("userId") String userId) throws UnsupportedEncodingException
	{
		User user = userService.selectUserById(userId);
		JSONObject job = new JSONObject();
		
		job.put("id", user.getId());
		job.put("userId", user.getUserId());
		job.put("passWd", user.getPassWd());
		job.put("email", user.getEmail());
		job.put("userNo", user.getUserNo());
		job.put("phone", user.getPhone());
		job.put("accountNumber", user.getAccountNumber());
		job.put("bankName", URLEncoder.encode(user.getBankName(),"utf-8"));
		job.put("profileUrl", user.getProfileUrl());
		job.put("isQuit", user.getIsQuit());
		job.put("loginOk", user.getLoginOk());
		job.put("lastModified", user.getLastModified().toString());
		if(user.getServiceDate() != null) {
		job.put("serviceDate", user.getServiceDate().toString());}
		else {job.put("serviceDate", "이용중인 서비스가 없습니다.");}
		job.put("businessNo", user.getBusinessNo());
		job.put("businessStoreName", URLEncoder.encode(user.getBusinessStoreName(),"utf-8"));
		
		return job.toJSONString();
	}
	@RequestMapping(value="ususpend.do", method=RequestMethod.POST)
	public void updateUserAccountSuspendMethod(@RequestParam("Id") int id,
			HttpServletResponse response) throws IOException {
		int result = umService.updateUserAccountSuspendMethod(id);
		PrintWriter out = response.getWriter();
		if(result ==1) {
			out.append("ok");
		}else {
			out.append("실패");
		}
	}
	@RequestMapping(value="uactivate.do", method=RequestMethod.POST)
	public void updateUserAccountActivateMethod(@RequestParam("Id") int id,
			HttpServletResponse response) throws IOException {
		int result = umService.updateUserAccountActivateMethod(id);
		PrintWriter out = response.getWriter();
		if(result ==1) {
			out.append("ok");
		}else {
			out.append("실패");
		}
	}

}

