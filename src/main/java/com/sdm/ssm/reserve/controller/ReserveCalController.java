package com.sdm.ssm.reserve.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sdm.ssm.common.SearchDate;
import com.sdm.ssm.common.SerachDateStr;
import com.sdm.ssm.reserve.model.service.ReserveService;
import com.sdm.ssm.reserve.model.vo.DateData;
import com.sdm.ssm.reserve.model.vo.Reserve;
import com.sdm.ssm.reserve.model.vo.ScheduleDto;

@Controller //설정 xml 에 해당 클래스를 Controller 로 자동 등록해 줌
public class ReserveCalController {
	//이 클래스 안에 메소드들이 잘 동작하는지 또는 전달값이나 리턴값을 확인하기 위한 용도로 로그객체를 생성함
	private static final Logger logger = LoggerFactory.getLogger(ReserveCalController.class);
	
	//서비스 연결 처리 : 자동 DI 처리
	@Autowired
	private ReserveService reserveService;
	
	//예약이동 페이지
	@RequestMapping("moveRsrvCaolPage.do")
	public String moveCalWritePage() {
		//return "reserve/reserve_input";
		//return "redirect:calendar.do";
		return "reserve/calendarfull040303";
	}
	
	
	//달력기본화면
	@RequestMapping(value = "/adms/calendar/management/list.do")
	public String lnb04List(RedirectAttributes redirectAttributes, 
					HttpServletRequest request, 
					@ModelAttribute("searchVO") SearchDate searchVO, 
					ModelMap model) throws Exception {
		
		int isAdm = 0;
		
	    //LoginVO loginVO = loginService.getLoginInfo();
	    
	    //if(loginVO.getAuthCode().contentEquals("1")) isAdm =1;
		isAdm = 0;
	    
	    model.addAttribute("isAdm", isAdm);
	    
	    //return "reserve/calendar/management/list";
	    return "reserve/calendarfull040303";
	}
		
	//// 달력데이터조회
	//@RequestMapping(value= "/ssm/adms/calendar/management/read_ajx.do", method = RequestMethod.POST)
	@RequestMapping(value= "read_ajx.do", method = RequestMethod.POST)
	@ResponseBody
	public String getCalDataMethod (
			@ModelAttribute("searchVO") SerachDateStr searchVO,
			HttpServletRequest request,
			HttpServletResponse res,
			ModelMap model) throws Exception {

		JSONObject obj = new JSONObject();
	    
		res.setContentType("text/html; charset=UTF-8");
	    PrintWriter out = res.getWriter();

	    //searchVO.setSite_code(loginService.getSiteCode());
	    //List<Reserve> list = reserveService.selectRsrvDetail(reserve);
	    //List<Reserve> list = reserveService.selectRsrvDetail(reserve);
	    
	    obj.put("success", "ok");
	    //obj.put("list", net.sf.json.JSONArray.fromObject(list));
	    obj.put("list", "");
	    
	    out.print(obj);
	    
	    return null;
	}

	
	@RequestMapping(value="calendar.do", method=RequestMethod.GET)
	public String calendar(Model model, HttpServletRequest request, DateData dateData) {
		
		Calendar cal = Calendar.getInstance();
		DateData calendarData = null;
		
		//검색 날짜
		if(dateData.getDate().equals("") && dateData.getMonth().equals("")) {
			dateData = new DateData(String.valueOf(cal.get(Calendar.YEAR)), String.valueOf(cal.get(Calendar.MONTH)), 
					String.valueOf(cal.get(Calendar.DATE)), null, null);
		}
		
		Map<String, Integer> today_info = dateData.today_info(dateData);
		List<DateData> dateList = new ArrayList<DateData>();
		
		logger.info("갯수 : "+ today_info);
		
		//검색 날짜 end
		//ScheduleDao scheduleDao = sqlSession.getMapper(ScheduleDao.class);
		//ArrayList<ScheduleDto> Schedule_list = scheduleDao.schedule_list(dateData);
		ArrayList<ScheduleDto> Schedule_list = reserveService.selectScheduleList(dateData);
		
		// 달력데이터에 넣기 위한 배열 추가
		ScheduleDto[][] schedule_data_arr = new ScheduleDto[32][4];
		if(Schedule_list.isEmpty() != true) {
			int j = 0;
			for(int i = 0; i < Schedule_list.size(); i++) {
				int date = Integer.parseInt(String.valueOf(Schedule_list.get(i).getSchedule_date()).substring(
										String.valueOf(Schedule_list.get(i).getSchedule_date()).length() - 2, 
										String.valueOf(Schedule_list.get(i).getSchedule_date()).length())
										);
				if(i > 0) {
					//전일
					int date_before = Integer.parseInt(String.valueOf(Schedule_list.get(i - 1).getSchedule_date()).substring(
									String.valueOf(Schedule_list.get(i - 1).getSchedule_date()).length() - 2, 
									String.valueOf(Schedule_list.get(i - 1).getSchedule_date()).length())
									);
					if(date_before == date) {
						j = j + 1;
						schedule_data_arr[date][j] = Schedule_list.get(i);
					} else {
						j = 0;
						schedule_data_arr[date][j] = Schedule_list.get(i);
					}
				} else {
					schedule_data_arr[date][j] = Schedule_list.get(i);
				}
			}
		}
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i = 1; i < today_info.get("start"); i++) {
			calendarData = new DateData(null, null, null, null, null);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			ScheduleDto[] schedule_data_arr3 = new ScheduleDto[4];
			schedule_data_arr3 = schedule_data_arr[i];
			
			if(i == today_info.get("today")) {
				calendarData = new DateData(String.valueOf(dateData.getYear()),
											String.valueOf(dateData.getMonth()),
											String.valueOf(i), 
											"today",
											schedule_data_arr3);
		
			}
			dateList.add(calendarData);
		}
		
		//logger.info("갯수 : "+ dateList.size());
		
		//달력 빈 곳 빈 데이터로 삽입
		int index = 7 - dateList.size() % 7;
		if(dateList.size() % 7 != 0 ) {
			for (int i = 0; i < index; i++) {
				calendarData = new DateData(null, null, null, null, null);
				//logger.info("일자 : " + calendarData);
				dateList.add(calendarData);
			}
		}
		logger.info("일자 : " + dateList.toString());
		
		model.addAttribute("dateList", dateList); // 날짜 데이터 배열
		model.addAttribute("today_info", today_info);
		
		return "reserve/calendar";
	}

	@RequestMapping(value="schedule_add.do", method=RequestMethod.GET)
	public String schedule_add(HttpServletRequest request, 
					ScheduleDto scheduleDto, 
					RedirectAttributes rttr) {

		//ScheduleDao scheduleDao = sqlSession.getMapper(ScheduleDao.class);
		//int count = scheduleDao.before_schedule_add_search(scheduleDao);
		int count = reserveService.before_schedule_add_search(scheduleDto);
		String message = "";
		String url = "redirect:calendar.do";
		
		if(count >= 4) {
			message = "스케쥴은 최대 4개만 등록 가능합니다.";
		} else {
			reserveService.before_schedule_add_search(scheduleDto);
		}

		rttr.addFlashAttribute("message", message);		
		
		return url;
	}
	
	//// 사용 검토(2024.04.02)
	@RequestMapping(value="/schedule_show", method=RequestMethod.GET)
	public String schedule_show(Model model, 
								HttpServletRequest request,
								@RequestParam("schedule_idx") int idx,
								RedirectAttributes rttr) {
		
		//ScheduleDao scheduleDao = sqlSession.getMapper(ScheduleDao.class);
		
		String url = "redirect:calendar.do";
		
		ScheduleDto scheduleDto = new ScheduleDto();
		
		//scheduleDao.get(idx);
		scheduleDto = reserveService.selectReserveget(idx);
		
		model.addAttribute("schedule_show", scheduleDto);
		
		return null;
	}

	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public String schedule_modify(Model model, 
								HttpServletRequest request, ScheduleDto scheduleDto, 
								RedirectAttributes rttr) {
		//ScheduleDao scheduleDao = sqlSession.getMapper(ScheduleDao.class);
		//reserveService.update(scheduleDto);
		int cnt = reserveService.update(scheduleDto);
		
		model.addAttribute("schedule_modify", cnt);

		return "/modify";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String schedule_delete(Model model, HttpServletRequest request, 
								ScheduleDto scheduleDto,
								RedirectAttributes rttr) {
		
		//ScheduleDao scheduleDao = sqlSession.getMapper(ScheduleDao.class);
		//reserveService.delete(scheduleDto);
		int cnt = reserveService.delete(scheduleDto);
		
		model.addAttribute("schedule_delete", cnt);
		
		return null;
	}
	
}