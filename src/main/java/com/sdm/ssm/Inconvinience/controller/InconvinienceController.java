package com.sdm.ssm.Inconvinience.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sdm.ssm.Inconvinience.model.service.InconvinienceService;
import com.sdm.ssm.Inconvinience.model.vo.InconvinienceBoard;
import com.sdm.ssm.admin.controller.NoticeController;
import com.sdm.ssm.common.Paging;
import com.sdm.ssm.common.Search;
import com.sdm.ssm.common.SearchDate;

@Controller
public class InconvinienceController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	@Autowired
	private InconvinienceService inconvService;
	// 새 게시글 등록 페이지 내보내기용 메소드
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
		@RequestMapping("iwform.do")
		public String moveInconvWritePage() {
			return "inconvinienceboard/inconvWriteForm";
		}
		@RequestMapping("inconvdetail.do")
		public String moveNoticeDetailPage(
				@RequestParam("ino") int inconvNo,
				@RequestParam(name="page", required=false) String page, Model model) {
			int currentPage = 1;
			if(page != null && page.length()>0) {
				currentPage = Integer.parseInt(page);
			}
			InconvinienceBoard inconvBoard = inconvService.selectInconv(inconvNo);
			
			if(inconvBoard != null) {
				model.addAttribute("inconvBoard", inconvBoard);
				model.addAttribute("currentPage", currentPage);
				return "inconvinienceboard/inconvDetailView";
			} else {
				model.addAttribute("message", inconvNo + "번 글이 존재하지 않습니다.");
				return "common/error";
			}
		
		}
		// 리스트내보내기
		@RequestMapping("inconvlist.do")
		public String noticeListMethod(@RequestParam(name = "page", required = false) String page,
				@RequestParam(name = "limit", required = false) String slimit, Model model) {
			int currentPage = 1;
			if (page != null && page.length()>0) {
				currentPage = Integer.parseInt(page);
			}

			// 한 페이지에 게시글 10개씩 출력되게 한다면
			int limit = 10;

			// 총 페이지수 계산을 위해 게시글 전체 갯수 조회해 옴
			int listCount = inconvService.selectListCount(); // 페이징 계산 처리 실행
			Paging paging = new Paging(listCount, currentPage, limit, "inconvlist.do");
			paging.calculate();
			// 출력할 페이지에 대한 목록 조회
			ArrayList<InconvinienceBoard> list = inconvService.selectList(paging);
			// 받은 결과로 성공/실패 페이지 내보냄
			if (list != null && list.size() > 0) {
				model.addAttribute("list", list);
				model.addAttribute("paging", paging);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("limit", limit);

				return "inconvinienceboard/inconvListView";
			} else {
				model.addAttribute("message", currentPage + " 페이지 목록 조회 실패!");
				return "common/error";
			}
		}
		// 검색용

		@RequestMapping("inconvsearch.do")
		public String noticeSearch(@RequestParam("action") String action, Search search,
				@RequestParam(name = "page", required = false) String page, Model model) {
			logger.info("asdfadf");
			int currentPage = 1;
			if (page != null) {
				currentPage = Integer.parseInt(page);
			}
			int listCount = 0;
			Paging paging = new Paging(0,currentPage, 10, "inconvsearch.do");
			ArrayList<InconvinienceBoard> list =null;
			logger.info("sadfasdf"+ search.toString());
			switch (action) {
			case "title":
				listCount = inconvService.selectSearchTitleCount(search.getKeyword());
				paging.setListCount(listCount);
				paging.calculate();
				search.setStartRow(paging.getStartRow());
				search.setEndRow(paging.getEndRow());
				list = inconvService.selectSearchTitle(search);
				break;
			case "writer":
				listCount = inconvService.selectSearchWriterCount(search.getKeyword());
				paging.setListCount(listCount);
				paging.calculate();
				search.setStartRow(paging.getStartRow());
				search.setEndRow(paging.getEndRow());
				list = inconvService.selectSearchWriter(search);
				break;
			case "date":
				SearchDate searchDate = new SearchDate(search.getBegin(),search.getEnd());
				listCount = inconvService.selectSearchDateCount(searchDate);
				paging.setListCount(listCount);
				paging.calculate();
				search.setStartRow(paging.getStartRow());
				search.setEndRow(paging.getEndRow());
				list = inconvService.selectSearchDate(search);
				break;
			}

			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("search", search);

			return "inconvinienceboard/inconvListView";
		}
}
