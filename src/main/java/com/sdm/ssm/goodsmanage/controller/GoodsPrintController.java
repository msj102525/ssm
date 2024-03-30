package com.sdm.ssm.goodsmanage.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.goodsmanage.model.service.GoodsPrintService;
import com.sdm.ssm.goodsmanage.model.vo.GoodsPrint;

@Controller
public class GoodsPrintController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsPrintController.class);

	@Autowired
	private GoodsPrintService goodsPrintService;

	@RequestMapping("glist.do") // GET이니까 METHOD 생략,
	public String boardListMethod(
			@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "limit", required = false) String slimit, Model model) {
		// PAGE가 PARAMETER가 옴, BOARD에 멤버변수로 PAGE가 없기때문에 커맨드객체는 사용할 수 없다.
		// url에서? 뒤는 쿼리, @RequestParam은 뒤에 받아주는 변수에 따라 알아서 parsing해줌
		// 값이 안왔을 경우를 대비해서 string으로 받고 null인지 확인하는게 좋음. int로 받으면 값이 안왔을 때 구분 할 수 없다.
		// RequestParam은 속성을 안쓰고 하나 쓰면 자동으로 name이 받음, required=true를 하면 값이 안오면 error,
		// default는true
		// 즉, 반드시 값을 받아야하면 true , 값이 안오면 500error

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지에 게시글 10개씩 출력되게 한다면
		int limit = 10;
		if (slimit != null) {
			limit = Integer.parseInt(slimit); // 전송받은 한 페이지에 출력할 목록 갯수를 적용
		}

		// 총 페이지수 계산을 위해 게시글 전체 갯수 조회해 옴
		int listCount = goodsPrintService.selectListCount();
		// 페이징 계산 처리 실행
		Paging paging = new Paging(listCount, currentPage, limit, "glist.do");
		paging.calculate();

		// 출력할 페이지에 대한 목록 조회
		ArrayList<GoodsPrint> list = goodsPrintService.selectGoodsPrint(paging);

		// 받은 결과로 성공/실패 페이지 내보냄
		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);

			return "goods/goodsListView";
		} else {
			model.addAttribute("message", currentPage + " 페이지 목록 조회 실패!");
			return "common/error";
		}

	}


}
