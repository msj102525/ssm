package com.sdm.ssm.goodsmanage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.common.Search;
import com.sdm.ssm.goodsmanage.model.dao.GoodsPrintDao;
import com.sdm.ssm.goodsmanage.model.vo.GoodsPrint;

@Service
public class GoodsPrintServiceImpl implements GoodsPrintService{

	@Autowired	//자동 DI 처리됨; 자동 객체 생성됨
	private GoodsPrintDao goodsPrintDao;

	// 전체 보기
	@Override
	public int selectListCount(int id) {
		return goodsPrintDao.selectListCount(id);
	}

	@Override
	public ArrayList<GoodsPrint> selectGoodsPrint(Paging paging) {
		return goodsPrintDao.selectGoodsPrint(paging);
	}

	
	// 상품명 검색
	@Override
	public int selectSearchGoodsNameCount(Search search) {
		return goodsPrintDao.selectSearchGoodsNameCount(search);
	}

	@Override
	public ArrayList<GoodsPrint> selectSearchGoodsName(Search search) {
		return goodsPrintDao.selecSearchGoodsName(search);
	}

	// 발주처 검색
	@Override
	public int selectSearchPdNameCount(Search search) {
		return goodsPrintDao.selectSearchPdNameCount(search);
	}

	@Override
	public ArrayList<GoodsPrint> selectSearchPdName(Search search) {
		return goodsPrintDao.selectSearchPdName(search);
	}

	
	
	

	

}