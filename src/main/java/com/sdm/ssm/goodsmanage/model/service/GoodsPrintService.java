package com.sdm.ssm.goodsmanage.model.service;

import java.util.ArrayList;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.common.Search;
import com.sdm.ssm.goodsmanage.model.vo.GoodsPrint;

public interface GoodsPrintService {

	// 전체보기
	int selectListCount(int id);

	ArrayList<GoodsPrint> selectGoodsPrint(Paging paging);

	// 상품명 검색
	int selectSearchGoodsNameCount(Search search);

	ArrayList<GoodsPrint> selectSearchGoodsName(Search search);
	
	// 발주처 검색
	int selectSearchPdNameCount(Search search);

	ArrayList<GoodsPrint> selectSearchPdName(Search search);

	// 상품 등록
	int insertGoods(GoodsPrint goodsPrint);

	// 상품 삭제
	int deleteGoods(GoodsPrint goodsPrint);

	// 발주처 리스트
	ArrayList<GoodsPrint> selectProducePrint(Paging paging);

	// 명세서 - 상품명
	ArrayList<GoodsPrint> selectSSearchGoodsName(Search search);

	// 명세서 - 발주처
	ArrayList<GoodsPrint> selectSSearchpdName(Search search);

	
	
	

}
