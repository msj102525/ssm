package com.sdm.ssm.goodsmanage.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.goodsmanage.model.dao.GoodsPrintDao;
import com.sdm.ssm.goodsmanage.model.vo.GoodsPrint;

@Service
public class GoodsPrintServiceImpl implements GoodsPrintService{

	@Autowired	//자동 DI 처리됨; 자동 객체 생성됨
	private GoodsPrintDao goodsPrintDao;

	@Override
	public int selectListCount() {
		return goodsPrintDao.selectListCount();
	}

	@Override
	public ArrayList<GoodsPrint> selectGoodsPrint(Paging paging) {
		return goodsPrintDao.selectGoodsPrint(paging);
	}

	
	
	

	

}