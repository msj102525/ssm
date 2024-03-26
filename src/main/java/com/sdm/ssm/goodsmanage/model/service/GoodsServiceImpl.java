package com.sdm.ssm.goodsmanage.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.goodsmanage.model.dao.GoodsDao;
import com.sdm.ssm.goodsmanage.model.vo.Goods;

@Service("GoodsService")
public class GoodsServiceImpl implements GoodsService{

	@Autowired
	private GoodsDao goodsDao;
	
	@Override
	public int selectListCount() {
		return goodsDao.selectListCount(); 
	}

	@Override
	public ArrayList<Goods> selectList(Paging paging) {
		return goodsDao.selectList(paging);
	}

}