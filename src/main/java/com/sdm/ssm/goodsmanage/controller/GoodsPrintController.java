package com.sdm.ssm.goodsmanage.controller;

import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
			method= {RequestMethod.GET, RequestMethod.POST}) 
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
		  else { model.addAttribute("message"," 등록된 상품이 없습니다. 상품을 먼저 등록해주세요 "); 
		  	return "goods/goodsListError"; 
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

	
	// 상품 추가 페이지 이동
	@RequestMapping("gmoveinsert.do")
	public String moveGoodsInsertPage() {
		return "goods/goodsInsert";
	}

	
	
	// 상품 추가
	@RequestMapping(value = "ginsert.do", method = RequestMethod.POST)
	public String InsertgoodsMethod(
			@RequestParam(name = "id") int id,
			GoodsPrint goodsPrint, 
			Model model) {
		logger.info("ginsert.do : " + goodsPrint);
		
		goodsPrint.setId(id);
		if(goodsPrintService.insertGoods(goodsPrint)>0) {
			return "goods/goodsInsert";
			}
		else {
			model.addAttribute("message", "새 상품 등록 실패");
			return "common/error";
		}
	}
	
	// 상품 수정
		@RequestMapping(value="gupdate.do", method=RequestMethod.POST)
		public ResponseEntity<String> goodsupdateMethod(
				@RequestBody String param) throws ParseException {

			JSONParser jparser = new JSONParser();
			JSONArray jarr = (JSONArray)jparser.parse(param);

			for(int i = 0; i < jarr.size(); i++) {
				JSONObject job = (JSONObject)jarr.get(i);
				
				GoodsPrint goodsPrint = new GoodsPrint();
				goodsPrint.setId(Integer.parseInt(job.get("id").toString()));
				goodsPrint.setGoodsNo(Integer.parseInt(job.get("goodsNo").toString()));
				goodsPrint.setGoodsPrice(Integer.parseInt(job.get("goodsPrice").toString()));
				goodsPrint.setMinOrderQuantity(Integer.parseInt(job.get("minOrderQuantity").toString()));
				goodsPrint.setMinAlarmQuantity(Integer.parseInt(job.get("minAlarmQuantity").toString()));
				goodsPrint.setPdQuantity(Integer.parseInt(job.get("pdQuantity").toString()));
				// 상품 삭제 메소드 작성
				int result1 = goodsPrintService.updateGoodsGT(goodsPrint);
				int result2 = goodsPrintService.updateGoodsIT(goodsPrint);
				
				// 에러 발생 시 
				if(result1 <= 0 && result2 <=0) {
					return new ResponseEntity<String>("failed", HttpStatus.REQUEST_TIMEOUT);
				}			
			}
			return new ResponseEntity<String>("success", HttpStatus.OK);
		}
	
	
	
	
	// 상품 삭제
	@RequestMapping(value="gdelete.do", method=RequestMethod.POST)
	public ResponseEntity<String> goodsdeleteMethod(
			@RequestBody String param) throws ParseException {

		JSONParser jparser = new JSONParser();
		JSONArray jarr = (JSONArray)jparser.parse(param);

		for(int i = 0; i < jarr.size(); i++) {
			JSONObject job = (JSONObject)jarr.get(i);
			
			GoodsPrint goodsPrint = new GoodsPrint();
			goodsPrint.setId(Integer.parseInt(job.get("id").toString()));
			goodsPrint.setGoodsNo(Integer.parseInt(job.get("goodsNo").toString()));
			// 상품 삭제 메소드 작성
			int result = goodsPrintService.deleteGoods(goodsPrint);
			
			// 에러 발생 시 
			if(result <= 0) {
				return new ResponseEntity<String>("failed", HttpStatus.REQUEST_TIMEOUT);
			}			
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	
	
	
	 // 발주처 보기 서비스
	@RequestMapping(value = "plist.do", method = RequestMethod.GET)
	public String produceListMethod(@RequestParam(name = "id", required = false) int id,
			@RequestParam(name = "page", required = false) String page,
			@RequestParam(name = "limit", required = false) String slimit, Model model) {

		logger.info("12jti2i3gt1");

		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}

		// 한 페이지에 게시글 10개씩 출력되게 한다면
		int limit = 10;
		if (slimit != null) {
			limit = Integer.parseInt(slimit); // 전송받은 한 페이지에 출력할 목록 갯수를 적용 }
		}

		// 총 페이지수 계산을 위해 게시글 전체 갯수 조회해 옴
		int listCount = goodsPrintService.selectListCount(id);

		// 페이징 계산 처리 실행
		Paging paging = new Paging(listCount, currentPage, limit, "plist.do");
		paging.calculate(); // 출력할 페이지에 대한 목록 조회
		paging.setId(id);
		ArrayList<GoodsPrint> list = goodsPrintService.selectProducePrint(paging);
		// 받은 결과로 성공/실패 페이지 내보냄
		if (list != null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);
			return "goods/produceListView";
		} else {
			model.addAttribute("message", currentPage + " 페이지 목록 조회 실패!");
			return "common/error";
		}
	}
	
	
	// 발주처 추가 페이지 이동
	@RequestMapping("pmoveinsert.do")
	public String moveProduceInsertPage() {
		return "goods/produceInsert";
	}
	
		
	// 발주처 추가
	@RequestMapping(value = "pinsert.do", method = RequestMethod.POST)
	public String InsertproduceMethod(
			@RequestParam(name = "id") int id,
			GoodsPrint goodsPrint, 
			Model model) {
		logger.info("pinsert.do : " + goodsPrint);
			
		goodsPrint.setId(id);
		if(goodsPrintService.insertProduce(goodsPrint)>0) {
			model.addAttribute("message", "새 발주처 등록 성공");
			return "goods/produceInsert";
			}
		else {
			model.addAttribute("message", "새 발주처 등록 실패");
			return "common/error";
		}
	}	
	
	// 발주처
	@RequestMapping(value="pupdate.do", method=RequestMethod.POST)
	public ResponseEntity<String> produceupdateMethod(
			@RequestBody String param) throws ParseException {

		JSONParser jparser = new JSONParser();
		JSONArray jarr = (JSONArray)jparser.parse(param);

		for(int i = 0; i < jarr.size(); i++) {
			JSONObject job = (JSONObject)jarr.get(i);
			
			GoodsPrint goodsPrint = new GoodsPrint();
			goodsPrint.setId(Integer.parseInt(job.get("id").toString()));
			goodsPrint.setGoodsNo(Integer.parseInt(job.get("goodsNo").toString()));
			goodsPrint.setPdPhone(job.get("pdPhone").toString());
			goodsPrint.setPdAddress(job.get("pdAddress").toString());
			goodsPrint.setGoodsUnit(job.get("goodsUnit").toString());
			goodsPrint.setNation(job.get("nation").toString());
			// 상품 삭제 메소드 작성
			int result1 = goodsPrintService.updateProduceGT(goodsPrint);
			int result2 = goodsPrintService.updateProducePT(goodsPrint);
			
			// 에러 발생 시 
			if(result1 <= 0 && result2 <=0) {
				return new ResponseEntity<String>("failed", HttpStatus.REQUEST_TIMEOUT);
			}			
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}

	
	// 발주처 삭제
	@RequestMapping(value="pdelete.do", method=RequestMethod.POST)
	public ResponseEntity<String> producedeleteMethod(
			@RequestBody String param) throws ParseException {

		JSONParser jparser = new JSONParser();
		JSONArray jarr = (JSONArray)jparser.parse(param);

		for(int i = 0; i < jarr.size(); i++) {
			JSONObject job = (JSONObject)jarr.get(i);
				
			GoodsPrint goodsPrint = new GoodsPrint();
			goodsPrint.setId(Integer.parseInt(job.get("id").toString()));
			goodsPrint.setGoodsNo(Integer.parseInt(job.get("goodsNo").toString()));
			// 상품 삭제 메소드 작성
			int result = goodsPrintService.deleteProduce(goodsPrint);
				
			// 에러 발생 시 
			if(result <= 0) {
				return new ResponseEntity<String>("failed", HttpStatus.REQUEST_TIMEOUT);
			}			
		}
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	
	
	
	
		
	// 명세서 보기 페이지 이동
	@RequestMapping("specify.do")
	public String moveSpecifyPage() {
		return "goods/specify";
	}
	
	
	// 명세서 보기 - 상품 이름
	@RequestMapping(value = "goodsNameSearch.do")	
	public String goodsNameSearchMethod(
			@RequestParam(name = "id", required = false) int id,
			@RequestParam("action") String action, 
			Model model,
			Search search) {

		search.setId(id);
		
		ArrayList<GoodsPrint>list = null;
		list = goodsPrintService.selectSSearchGoodsName(search);
		model.addAttribute("list", list);
		
		return "goods/specify";
		
	}	
	
	// 명세서 보기 - 발주처
	@RequestMapping(value = "pdNameSearch.do")	
	public String pdNameSearchMethod(
			@RequestParam(name = "id", required = false) int id,
			@RequestParam("action") String action, 
			Model model,
			Search search) {

		search.setId(id);
		
		ArrayList<GoodsPrint>list = null;
		list = goodsPrintService.selectSSearchpdName(search);
		model.addAttribute("list", list);
		
		return "goods/specify";
		
	}
}
