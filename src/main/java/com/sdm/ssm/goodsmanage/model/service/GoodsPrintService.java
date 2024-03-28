package com.sdm.ssm.goodsmanage.model.service;

import java.util.ArrayList;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.common.Search;
import com.sdm.ssm.goodsmanage.model.vo.GoodsPrint;

public interface GoodsPrintService {

	// 전체보기
	int selectListCount();

	ArrayList<GoodsPrint> selectGoodsPrint(Paging paging);

	// 상품명 검색
	int selectSearchGoodsNameCount(String keyword);

	ArrayList<GoodsPrint> selectSearchGoodsName(Search search);
	
	// 발주처 검색
	int selectSearchPdNameCount(String keyword);

	ArrayList<GoodsPrint> selectSearchPdName(Search search);

	
	
	

}
