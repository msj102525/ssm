package com.sdm.ssm.goodsmanage.model.service;

import java.util.ArrayList;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.goodsmanage.model.vo.GoodsPrint;

public interface GoodsPrintService {

	int selectListCount();

	ArrayList<GoodsPrint> selectGoodsPrint(Paging paging);
	

}
