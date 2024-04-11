package com.sdm.ssm.reserve.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sdm.ssm.common.SearchDate;
import com.sdm.ssm.common.SerachDateStr;
import com.sdm.ssm.reserve.model.service.ReserveService;
import com.sdm.ssm.reserve.model.vo.DateData;
import com.sdm.ssm.reserve.model.vo.Reserve;
import com.sdm.ssm.reserve.model.vo.ScheduleDto;
import com.sdm.ssm.user.model.vo.User;

@Controller //설정 xml 에 해당 클래스를 Controller 로 자동 등록해 줌
public class ReserveCalController {
	//이 클래스 안에 메소드들이 잘 동작하는지 또는 전달값이나 리턴값을 확인하기 위한 용도로 로그객체를 생성함
	private static final Logger logger = LoggerFactory.getLogger(ReserveCalController.class);
	
	//서비스 연결 처리 : 자동 DI 처리
	@Autowired
	private ReserveService reserveService;
	
	//예약이동 페이지
	@RequestMapping("moveRsrvCalMain.do")
	public String moveCalMainPage(
			HttpServletRequest request,
			HttpServletResponse res
			) {
		//return "reserve/reserve_input";
		//return "redirect:calendar.do";
		/* return "reserve/calendarfull040303"; */
		//logger.info("ID-01 : " + id);
		
		//HttpSession session = request.getSession();
		//User loginUser = (User)session.getAttribute("loginUser");
		
		//logger.info("ID-01 : " + loginUser.getId());
		
		return "reserve/reservecalendarmain";
	}
	
	//////////////////////////////////////////////////////////
	///// 예약이동 페이지
	//////////////////////////////////////////////////////////
	@RequestMapping("moveRsrvCalPage.do")
	public String moveCalWritePage(
			HttpServletRequest request,
			HttpServletResponse res
			) {
		//return "reserve/reserve_input";
		//return "redirect:calendar.do";
		/* return "reserve/calendarfull040303"; */
		//logger.info("ID-01 : " + id);
		
		//HttpSession session = request.getSession();
		//User loginUser = (User)session.getAttribute("loginUser");
		
		//logger.info("ID-01 : " + loginUser.getId());
		return "reserve/reservecalendarlist";
		//return "reserve/calendarfull040701";
	}
	
	//// 달력 기본 화면
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

	//// 달력 데이터 조회
	@RequestMapping(value= "read_ajx.do", method = {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String getCalDataMethod (
			@ModelAttribute("searchVO") SerachDateStr searchVO,
			HttpServletRequest request,
			HttpServletResponse res,
			ModelMap model) throws Exception {

		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");

		String sdate = searchVO.getStart().replace("-", "");
		String edate = searchVO.getEnd().replace("-", "");
		
		//// 조회 조건을 설정하기 위한 방법
	    SerachDateStr serachDateStr = new SerachDateStr();
	    serachDateStr.setSdate(sdate);
	    serachDateStr.setEdate(edate);
	    
	    ////serachDateStr.setId(200);
	    serachDateStr.setId(loginUser.getId());
	    
	    //searchVO.setSite_code(loginService.getSiteCode());
	    //List<Reserve> list = reserveService.selectRsrvDetail(reserve);
	    ArrayList<Reserve> list = reserveService.selectRsrvList2(serachDateStr);
	    
		res.setContentType("text/html; charset=UTF-8");
		
		//리턴된 list 를 json 배열에 옮겨 담기
		JSONArray jarr = new JSONArray();
		
		int sortidx = 0;
		
		if (list.size() > 0) {
			sortidx = list.size(); 
		}
		
		for(Reserve reserve : list) {
			//reserve 값들을 저장할 js
			JSONObject job = new JSONObject();
			
			job.put("groupId", reserve.getRsrvNum());
			//저장할 문자열에 한글이 있다면 반드시 인코딩행서 저장해야 함
			job.put("title", reserve.getRsrvSubject());
			
			//날짜는 반드시 문자열로 바꿔서 저장할 것(fullcalendar에서 받을 format으로 변경
			String start = reserve.getRsrvDate().substring(0, 4) + "-" 
							+ reserve.getRsrvDate().substring(4, 6) + "-" 
							+ reserve.getRsrvDate().substring(6, 8);

			job.put("start", start);
			
			job.put("sortIdx", sortidx);   /// 일정을 순서대로 보이게 하기 위함(2024.04.04)
			
			/////////////////////////////////////////////////////////////
			//// 추가(2024.04.05)
			/////////////////////////////////////////////////////////////
			job.put("rsrvname", reserve.getRsrvName());  //// 예약자명 2024.04.05
			job.put("rsrvtelno", reserve.getRsrvTelno());  //// 연락처 2024.04.05
			job.put("rsrvtime", reserve.getRsrvTime());  //// 예약시간 2024.04.05
			job.put("rsrvinwon", reserve.getRsrvInwon());  //// 인원 2024.04.05
			job.put("rsrvmemo", reserve.getRsrvMemo());  //// 메모 2024.04.05
			job.put("writedate", reserve.getWriteDate().toString());  //// 작성일자 2024.04.10 

			jarr.add(job);
			
			sortidx = sortidx - 1;
			
		} //for

		JSONObject obj = new JSONObject();

	    PrintWriter out = res.getWriter();

	    obj.put("success", "ok");
	    obj.put("list", jarr);
	    
	    out.print(obj);
	    out.close();
	    return null;
	}
	
	
	/////////////////////////////////////////////////////
	//// 달력 데이터등록 화면
	/////////////////////////////////////////////////////
	//@RequestMapping(value = "/adms/calendar/management/create_ajx.do",method = RequestMethod.POST)
	@RequestMapping(value = "create_ajx.do", method = RequestMethod.POST)
	@ResponseBody
	public String createAction(
	        @RequestBody String filterJSON,
	        HttpServletRequest request,
	        HttpServletResponse res,
	        ModelMap model) throws Exception {
			
	    //LoginVO loginVO = loginService.getLoginInfo();
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
			
	    JSONObject obj = new JSONObject();
	    
	    ////////////////////////////////////////////
	    ////////////////////////////////////////////
	    res.setContentType("text/html; charset=UTF-8");
	    
	    PrintWriter out = res.getWriter();
	 
	    //================================ json Object parse ============================
	    ///////////////////////////////////////////////////////////////////////////////////////////////////////
	    //// com.fasterxml.jackson.core/jackson-databind --> 사용 library import시 주의(2024.04.05)
	    ///////////////////////////////////////////////////////////////////////////////////////////////////////
	    ObjectMapper mapper = new ObjectMapper();            
	    ////tbl_calendarVO searchVO = (tbl_calendarVO)mapper.readValue(filterJSON, new TypeReference<tbl_calendarVO>(){ });
	    Reserve rsrv = (Reserve)mapper.readValue(filterJSON, new TypeReference<Reserve>(){ });
	    //================================ json Object parse ============================
	    
	    //searchVO.setSite_code(loginService.getSiteCode());
	    //searchVO.setCret_id(loginVO.getId());
	    //searchVO.setCret_ip(request.getRemoteAddr());
	    //searchVO.getStart().replace("-", "")
	    String rsrvDate = rsrv.getRsrvDate().replace("-", "");   //// 예약일자 format 제거(2024.04.05)
	    rsrv.setRsrvDate(rsrvDate);
	    
	    //rsrv.setId(200);
	    int id = 0;
	    id = loginUser.getId();
	     
	    rsrv.setId(id);
	    rsrv.setWriter(id);

		if (reserveService.insertReserve(rsrv) > 0) {
		    obj.put("success", "ok");
		}else {
		    obj.put("success", "fail");
		}
			
	    out.print(obj);
	    
	    return null;
	}

	//// 달력 데이터 업데이트
	/////@RequestMapping(value="/adms/calendar/management/update_ajx.do", method=RequestMethod.POST)
	@RequestMapping(value="update_ajx.do", method=RequestMethod.POST)
	@ResponseBody
	public String updateAction(
	        @RequestBody String filterJSON,
	        HttpServletRequest request,
	        HttpServletResponse res,
	        ModelMap model) throws Exception {
		
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");

	    //LoginVO loginVO = loginService.getLoginInfo();
		
	    JSONObject obj = new JSONObject();
	    
	    res.setContentType("text/html; charset=UTF-8");
	    
	    PrintWriter out = res.getWriter();
	 
	    //================================ json Object parse ============================
	    ///////////////////////////////////////////////////////////////////////////////////////////////////////
	    //// com.fasterxml.jackson.core/jackson-databind --> 사용 library import시 주의(2024.04.05)
	    ///////////////////////////////////////////////////////////////////////////////////////////////////////
	    ObjectMapper mapper = new ObjectMapper();            
	    ////tbl_calendarVO searchVO = (tbl_calendarVO)mapper.readValue(filterJSON, new TypeReference<tbl_calendarVO>(){ });
	    Reserve rsrv = (Reserve)mapper.readValue(filterJSON, new TypeReference<Reserve>(){ });
	    //================================ json Object parse ============================
	    //searchVO.setSite_code(loginService.getSiteCode());
	    //searchVO.setModi_id(loginVO.getId());
	    //searchVO.setModi_ip(request.getRemoteAddr());
	    
	    String rsrvDate = rsrv.getRsrvDate().replace("-", "");   //// 예약일자 format 제거(2024.04.05)
	    rsrv.setRsrvDate(rsrvDate);
	    
	    //rsrv.setId(200);
	    //rsrv.setId(200);
	    int id = 0;
	    id = loginUser.getId();
	     
	    rsrv.setId(id);
	    rsrv.setWriter(id);
    
		if(reserveService.updateReserve(rsrv) > 0) {
		    obj.put("success", "ok");
		}else {
		    obj.put("success", "fail");
		}

	    out.print(obj);
	    return null;
	}

	//// 달력데이터삭제
	////@RequestMapping(value = "/adms/calendar/management/delete_ajx.do",method=RequestMethod.POST)
	@RequestMapping(value = "delete_ajx.do", method=RequestMethod.POST)
	@ResponseBody
	public String deleteAction(
	        @RequestBody String filterJSON,
	        HttpServletRequest request,
	        HttpServletResponse res,
	        ModelMap model) throws Exception {
	    //LoginVO loginVO = loginService.getLoginInfo();
	    
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");

	    JSONObject obj = new JSONObject();
	    
	    res.setContentType("text/html; charset=UTF-8");

	    PrintWriter out = res.getWriter();

	    //================================ json Object parse ============================
	    ///////////////////////////////////////////////////////////////////////////////////////////////////////
	    //// com.fasterxml.jackson.core/jackson-databind --> 사용 library import시 주의(2024.04.05)
	    ///////////////////////////////////////////////////////////////////////////////////////////////////////
	    ObjectMapper mapper = new ObjectMapper();
	    Reserve rsrv = (Reserve)mapper.readValue(filterJSON, new TypeReference<Reserve>(){ });
	    //================================ json Object parse ============================
	    
	    //rsrv.setId(200);
	    rsrv.setId(loginUser.getId());
	    
	    if (reserveService.deleteReserve(rsrv) > 0) {
	    	obj.put("success", "ok");
		}else {
			obj.put("success", "fail");
		}

	    out.print(obj);
	    
	    return null;
	}
	
	//////////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////////
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
