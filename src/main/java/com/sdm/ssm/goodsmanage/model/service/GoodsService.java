package com.sdm.ssm.goodsmanage.model.service;

import java.util.ArrayList;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.goodsmanage.model.vo.Goods;

public interface GoodsService {

	int selectListCount();

	ArrayList<Goods> selectList(Paging paging);
	

}
