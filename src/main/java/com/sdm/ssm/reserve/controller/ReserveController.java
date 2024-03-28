package com.sdm.ssm.reserve.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sdm.ssm.reserve.model.service.ReserveService;
import com.sdm.ssm.reserve.model.vo.Reserve;

@Controller //설정 xml 에 해당 클래스를 Controller 로 자동 등록해 줌
public class ReserveController {
	//이 클래스 안에 메소드들이 잘 동작하는지 또는 전달값이나 리턴값을 확인하기 위한 용도로 로그객체를 생성함
	private static final Logger logger = LoggerFactory.getLogger(ReserveController.class);
	
	//서비스 연결 처리 : 자동 DI 처리
	@Autowired
	private ReserveService reserveService;
	
	
	//예약이동 페이지
	@RequestMapping("moveRsrvPage.do")
	public String moveWritePage() {
		return "reserve/reserve_input";
	}

	//예약등록
	@RequestMapping(value="rsrvinsert.do", method=RequestMethod.POST)
	public String reserveInsertMethod(Reserve reserve, 
					Model model) {

		Reserve rsrv = new Reserve();
		
		//rsrv.setRsrvNum(1);
		rsrv.setRsrvName(reserve.getRsrvName());
		rsrv.setRsrvDate(reserve.getRsrvDate());
		rsrv.setRsrvInwon(reserve.getRsrvInwon());
		
		rsrv.setId(200);
		
		if(reserveService.insertReserve(rsrv) > 0) {
			//return "redirect:blist.do?page=" + page;
			return "redirect:moveRsrvPage.do";
		} else {
			model.addAttribute("message", "예약 등록 실패");
			return "common/error";
		}
	}
	
	//예약수정
	@RequestMapping(value="rsrvupdate.do", method=RequestMethod.POST)
	public String reserveUpdateMethod(Reserve reserve, 
					Model model) {
		if(reserveService.updateReserve(reserve) > 0) {
			//return "redirect:blist.do?page=" + page;
			return "";
		} else {
			model.addAttribute("message", "예약 수정 실패");
			return "common/error";
		}
	}

	//예약삭제
	@RequestMapping(value="rsrvdelete.do", method=RequestMethod.POST)
	public String reserveDeleteMethod(Reserve reserve, 
					Model model) {
		
		if(reserveService.deleteReserve(reserve) > 0) {
			//return "redirect:blist.do?page=" + page;
			return "";
		} else {
			model.addAttribute("message", "예약 수정 실패");
			return "common/error";
		}
		
	}
	
	//예약 목록 조회
	@RequestMapping(value="rsrvlist.do", method=RequestMethod.POST)
	public String reserveselectRsrvListMethod() {
		return "";
	}
	
	//예약 상세
	@RequestMapping(value="rsrvdetail.do", method=RequestMethod.POST)
	public String reserveselectRsrvDetailMethod(Reserve rsrv,
			Model model) {
		//서비스 메소드로 아이디 전달하고, 해당 회원정보 받기
		String userId = null;
		
		Reserve reserve = reserveService.selectRsrvDetail(rsrv);
		
		if(reserve != null) {
			model.addAttribute("reserve", reserve);
			//return "member/myInfoPage";
			return "";
		}else {
			model.addAttribute("message", userId + "에 대한 회원 정보 조회 실패");
			return "common/error";
		}
	}
	
//	@RequestMapping("myinfo.do")
//	public String memberDetailMethod(@RequestParam("userId") String userId, Model model) {
//		//서비스 메소드로 아이디 전달하고, 해당 회원정보 받기
//		Member member = memberService.selectMember(userId);
//		
//		if(member != null) {
//			model.addAttribute("member", member);
//			return "member/myInfoPage";
//		}else {
//			model.addAttribute("message", userId + "에 대한 회원 정보 조회 실패");
//			return "common/error";
//		}
//	}

}
