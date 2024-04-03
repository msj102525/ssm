package com.sdm.ssm.reserve.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

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
		//return "reserve/reserve_input";
		return "reserve/reservecalendar";
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
	
    public String showCalendar(Model model) {
        LocalDate today = LocalDate.now();
        int year = today.getYear();
        int month = today.getMonthValue();
        List<LocalDate> dates = getDatesOfMonth(year, month);
        
        model.addAttribute("dates", dates);
        return "calendar";
    }

    private List<LocalDate> getDatesOfMonth(int year, int month) {
        List<LocalDate> dates = new ArrayList<>();
        LocalDate date = LocalDate.of(year, month, 1);
        while (date.getMonthValue() == month) {
            dates.add(date);
            date = date.plusDays(1);
        }
        return dates;
    }
	
	@RequestMapping(value = "callist.do", method = RequestMethod.GET)
	public String callist(Model model) {
		model.addAttribute("doc_title", "일정관리");
		return "callist.tiles";
	};
	
//	@RequestMapping(value = "callistData.do", method = RequestMethod.GET)
//	@ResponseBody
//	public List<CalendarDto> callistData(String year, String month, HttpServletRequest req) {
//		System.out.println("year : "+year+ " month : "+month);
//		//MemberDto mDto = (MemberDto)req.getSession().getAttribute("login");
//		//CalParam param = new CalParam(mDto.getId(), year+UtilEx.two(month));
//		List<CalendarDto> list = calService.getCalList(param);
//		
//		return list;
//	}
	
//	@RequestMapping(value = "calDetail.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public String calDetail(Model model, Integer seq) {
//		
//		if(seq == null) seq = 0;
//		System.out.println("seq : "+seq);
//		CalendarDto dto = calService.calDetail(seq);
//		model.addAttribute("cal", dto);
//		model.addAttribute("doc_title", "일정 상세페이지");
//		return "calDetail.tiles";
//	}
	
//	@RequestMapping(value = "calWrite.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public String calWrite(Model model, CalParam param) {
//		model.addAttribute("doc_title", "일정쓰기");
//		model.addAttribute("param", param);
//		Calendar cal = Calendar.getInstance();
//		int year = Integer.parseInt(param.getYear());
//		int month = Integer.parseInt(param.getMonth());
//		cal.set(year, month-1, 1);
//		int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
//		//System.out.println(year+"년 "+month+"월의 일수 : "+maxDay);
//		model.addAttribute("maxDay", maxDay);
//		
//		return "calWrite.tiles";
//	}
	
//	@RequestMapping(value = "calWriteAf.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public String calWriteAf(CalendarDto dto, CalParam param) {
//		
//		String rdate = param.getYear()+UtilEx.two(param.getMonth())
//						+UtilEx.two(param.getDay())+UtilEx.two(param.getHour())+UtilEx.two(param.getMin());
//		System.out.println("글쓴시간 : "+rdate);
//		System.out.println(dto.toString());
//		dto.setRdate(rdate);
//
//		int write = calService.calWrite(dto);
//		if(write > 0 ) {
//			System.out.println("글쓰기 성공");
//			return "redirect:/callist.do";
//		} else {
//			System.out.println("글쓰기 실패");
//			return "redirect:/calWrite.do";
//		}
//	}
	
	
//	@RequestMapping(value = "calDelete.do", method = RequestMethod.GET) 
//	public String calDelete(int seq) {
//		
//		//int del = calService.calDelete(seq);
//		
//		if(del > 0 ) {
//			System.out.println("삭제 성공");
//		} else {
//			System.out.println("삭제 실패");
//		}
//		
//		return "redirect:/callist.do";
//	}
	
	
//	@RequestMapping(value = "calUpdate.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public String calUpdate(Model model, int seq) {
//		model.addAttribute("doc_title", "일정수정");
//		
//		CalendarDto dto = calService.calDetail(seq);
//		CalParam param = new CalParam(null, null, 
//									dto.getRdate().substring(0, 4),
//									dto.getRdate().substring(4, 6),
//									dto.getRdate().substring(6, 8),
//									dto.getRdate().substring(8, 10),
//									dto.getRdate().substring(10, 12));
//		System.out.println(param.toString());
//		System.out.println(dto.toString());
//		model.addAttribute("param1", param);
//		model.addAttribute("cal", dto);
//		
//		return "calUpdate.tiles";
//	}

	
//	@RequestMapping(value = "calUpdateAf.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public String calUpdateAf(CalendarDto dto, CalParam param) {
//		
//		String rdate = param.getYear()+UtilEx.two(param.getMonth())
//						+UtilEx.two(param.getDay())+UtilEx.two(param.getHour())+UtilEx.two(param.getMin());
//		System.out.println("글쓴시간 : "+rdate);
//		dto.setRdate(rdate);
//		System.out.println(dto.toString());
//
//		int update = calService.calUpdate(dto);
//		if(update > 0 ) {
//			System.out.println("수정 성공");
//			return "redirect:/callist.do";
//		} else {
//			System.out.println("수정 실패");
//			return "redirect:/calWrite.do";
//		}
//	}
	
	
//	@RequestMapping(value = "calDayList.do", method = { RequestMethod.GET, RequestMethod.POST })
//	public String calDayList(Model model, @ModelAttribute("param2")CalParam param, HttpSession session) {
//		model.addAttribute("doc_title", "하루 일정");
//		MemberDto mDto = (MemberDto)session.getAttribute("login");
//		
//		param.setId(mDto.getId());
//		param.setYyyyMMdd(param.getYear()+UtilEx.two(param.getMonth())+UtilEx.two(param.getDay()));
//		
//		System.out.println(param.toString());
//		//List<CalendarDto> list = calService.getDayList(param);
//		
//		model.addAttribute("dayList", list);
//		
//		return "calDayList.tiles";
//	}

}
