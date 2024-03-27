package com.sdm.ssm.admin.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sdm.ssm.admin.model.vo.Notice;
import com.sdm.ssm.admin.service.NoticeService;
import com.sdm.ssm.common.Paging;

@Controller
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;
	
	//뷰 페이지 내보내기용 메소드 작성부-------------------------------------------
	
	//새 게시글 등록 페이지 내보내기용 메소드
	@RequestMapping("nwform.do")
	public String moveBoardWritePage() {
		return "notice/noticeWriteForm";
	}
	
	//리스트내보내기
	@RequestMapping("nlist.do")
	public String boardListMethod(@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "limit", required = false) String slimit, Model model) {
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지에 게시글 10개씩 출력되게 한다면
		int limit = 10;
		if (slimit != null) {
			limit = Integer.parseInt(slimit);
		}

		// 총 페이지수 계산을 위해 게시글 전체 갯수 조회해 옴
		int listCount = noticeService.selectListCount(); // 페이징 계산 처리 실행
		Paging paging = new Paging(listCount, currentPage, limit, "nlist.do");
		paging.calculate();
		// 출력할 페이지에 대한 목록 조회
		ArrayList<Notice> list = noticeService.selectList(paging);
		logger.info("리스트카운트 : "+listCount);
		// 받은 결과로 성공/실패 페이지 내보냄
		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);

			return "notice/noticeListView";
		} else {
			model.addAttribute("message", currentPage + " 페이지 목록 조회 실패!");
			return "common/error";
		}
	}
	
	
}
