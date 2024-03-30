package com.sdm.ssm.goodsmanage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.goodsmanage.controller.GoodsPrintController;
import com.sdm.ssm.goodsmanage.model.vo.GoodsPrint;

@Repository
public class GoodsPrintDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int selectListCount() {
		return sqlSessionTemplate.selectOne("goodsMapper.selectListCount");
	}

	public ArrayList<GoodsPrint> selectGoodsPrint(Paging paging){
		List<GoodsPrint>list =sqlSessionTemplate.selectList("goodsMapper.selectGoodsPrint", paging);
		return (ArrayList<GoodsPrint>)list;
	}
	
}
