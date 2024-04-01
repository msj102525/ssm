package com.sdm.ssm.goodsmanage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sdm.ssm.admin.model.vo.Notice;
import com.sdm.ssm.common.Paging;
import com.sdm.ssm.common.Search;
import com.sdm.ssm.goodsmanage.model.service.GoodsPrintService;
import com.sdm.ssm.goodsmanage.model.vo.GoodsPrint;

@Controller
public class GoodsPrintController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsPrintController.class);

	@Autowired
	private GoodsPrintService goodsPrintService;

	
	// 재고 보기 서비스
	@RequestMapping(value="glist.do", 
			method=RequestMethod.GET) 
	public String goodsListMethod(						
			@RequestParam(name = "id", required = false) int id,
			@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "limit", required = false) String slimit, 
			Model model) {

		logger.info("12jti2i3gt1");
		
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
		int listCount = goodsPrintService.selectListCount(id); 
		  
		  // 페이징 계산 처리 실행 Paging paging = new
		  Paging paging = new Paging(listCount, currentPage, limit, "glist.do"); 
		  paging.calculate(); 
		  //출력할 페이지에 대한 목록 조회 
		  paging.setId(id);
		  ArrayList<GoodsPrint> list = goodsPrintService.selectGoodsPrint(paging); 
		  // 받은 결과로 성공/실패 페이지 내보냄 
		  if (list!= null && list.size() > 0) {
			  model.addAttribute("list", list);
			  model.addAttribute("paging", paging); 
			  model.addAttribute("currentPage",currentPage); 
			  model.addAttribute("limit", limit); 
			  return "goods/goodsListView"; } 
		  else { model.addAttribute("message", currentPage +" 페이지 목록 조회 실패!"); 
		  	return "common/error"; 
		  	}
	}

	//  검색용 (페이징 처리 포함)
	@RequestMapping(value="gsearch.do", 
			method= RequestMethod.GET)
	public String goodsNameSearch(
			@RequestParam(name = "id", required = false) int id,
			@RequestParam("action") String action, 
			Search search,
			@RequestParam(name = "page", required = false) 
			String page, 
			Model model) {

			// 검색 결과에 대한 페이징 처리를 위한 페이지 지정
			int currentPage = 1;
			if (page != null) {
				currentPage = Integer.parseInt(page);
			}

			// 뷰 페이지에 사용할 페이징 관련 값들 계산 처리
			int listCount = 0;
			Paging paging = new Paging(listCount, currentPage, 10, "gsearch.do");
			paging.calculate();
			search.setId(id);
			ArrayList<GoodsPrint>list = null;

			if(action.equals("goodsName")) {
				listCount = goodsPrintService.selectSearchGoodsNameCount(search);
				paging.setListCount(listCount);
				paging.calculate();
				
				search.setStartRow(paging.getStartRow());
				search.setEndRow(paging.getEndRow());
				list = goodsPrintService.selectSearchGoodsName(search);
				
			} else if(action.equals("pdName")) {
				listCount = goodsPrintService.selectSearchPdNameCount(search);
				paging.setListCount(listCount);
				paging.calculate();
				search.setStartRow(paging.getStartRow());
				search.setEndRow(paging.getEndRow());
				list = goodsPrintService.selectSearchPdName(search);
			}
			
				model.addAttribute("list", list);
				model.addAttribute("paging", paging);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("action", action);
				
				if (list != null && list.size() > 0) {
					return "goods/goodsListView";
				} else {
					model.addAttribute("message", search.getKeyword() + "조회 실패!");
					return "common/error";
				}
		}

	
	
	
	
	// 팝업 창 이동 - 저장
	@RequestMapping("savepopup.do")
	public String movesavePopupPage() {
		return "goods/savepopup";
	}
	
	// 팝업 창 이동 - 삭제
	@RequestMapping("deletepopup.do")
	public String movedeletePopupPage(@RequestParam("selectedGoods") String selectedGoods, Model model) {
	    model.addAttribute("selectedGoods", selectedGoods); // 선택된 상품 정보를 모델에 추가하여 JSP에 전달
	    return "goods/deletepopup"; // 팝업 페이지의 경로
	}
	
	// 상품 추가 페이지 이동
	@RequestMapping("gmoveinsert.do")
	public String moveGoodsInsertPage(@RequestParam(name = "id", required = false) int id, Model model) {
		model.addAttribute("id", id);
		return "goods/goodsInsert";
	}

	
	
	// 상품 추가
	@RequestMapping(value = "ginsert.do", method = RequestMethod.POST)
	public String goodsInsertMethod(GoodsPrint goodsPrint, 
			Model model, 
			@RequestParam(name = "id", required = false) int id) {
		
		logger.info("ginsert.do : " + goodsPrint);
		goodsPrint.setID(id);
		
		if(goodsPrintService.insertGoods(goodsPrint) > 0) {
			return "redirect:glist.do";
		}else {
			model.addAttribute("message", "새 상품 등록 실패!");
			return "common/error";
		}
	}
	
		// 상품 삭제
		@RequestMapping(value = "gdelete.do", method = { RequestMethod.POST, RequestMethod.GET})
		public String goodsdeleteMethod(
				Model model, 
				GoodsPrint goodsPrint,
				@RequestParam(name = "id") int id,
                @RequestParam(name = "goodsNo") int goodsNo) {
			
			logger.info("gdelete.do : " + goodsPrint);
			goodsPrint.setID(id);
			
			if(goodsPrintService.deleteGoods(goodsPrint) > 0) {
				return "redirect:glist.do";
			}else {
				model.addAttribute("message", "새 상품 등록 실패!");
				return "common/error";
			}
		}
	
		// 발주처 보기 서비스
		@RequestMapping(value="plist.do", 
				method=RequestMethod.GET) 
		public String produceListMethod(						
				@RequestParam(name = "id", required = false) int id,
				@RequestParam(name = "page", required = false) String page,
				@RequestParam(name = "limit", required = false) String slimit, 
				Model model) {

			logger.info("12jti2i3gt1");
			
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
			int listCount = goodsPrintService.selectListCount(id); 
			  
			  // 페이징 계산 처리 실행 Paging paging = new
			  Paging paging = new Paging(listCount, currentPage, limit, "glist.do"); 
			  paging.calculate(); 
			  //출력할 페이지에 대한 목록 조회 
			  paging.setId(id);
			  ArrayList<GoodsPrint> list = goodsPrintService.selectProducePrint(paging); 
			  // 받은 결과로 성공/실패 페이지 내보냄 
			  if (list!= null && list.size() > 0) {
				  model.addAttribute("list", list);
				  model.addAttribute("paging", paging); 
				  model.addAttribute("currentPage",currentPage); 
				  model.addAttribute("limit", limit); 
				  return "goods/produceListView"; } 
			  else { model.addAttribute("message", currentPage +" 페이지 목록 조회 실패!"); 
			  	return "common/error"; 
			  	}
		}
	
}
