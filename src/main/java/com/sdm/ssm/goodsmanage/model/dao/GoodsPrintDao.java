package com.sdm.ssm.goodsmanage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sdm.ssm.common.Paging;
import com.sdm.ssm.common.Search;
import com.sdm.ssm.goodsmanage.controller.GoodsPrintController;
import com.sdm.ssm.goodsmanage.model.vo.GoodsPrint;

@Repository
public class GoodsPrintDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public int selectListCount(int id) {
		return sqlSessionTemplate.selectOne("goodsMapper.selectListCount", id);
	}

	public ArrayList<GoodsPrint> selectGoodsPrint(Paging paging){
		List<GoodsPrint>list =sqlSessionTemplate.selectList("goodsMapper.selectGoodsPrint", paging);
		return (ArrayList<GoodsPrint>)list;
	}

	// 상품명 검색
	public int selectSearchGoodsNameCount(Search search) {
		return sqlSessionTemplate.selectOne("goodsMapper.selectSearchGoodsNameCount", search);
	}

	public ArrayList<GoodsPrint> selecSearchGoodsName(Search search) {
		List<GoodsPrint>list =sqlSessionTemplate.selectList("goodsMapper.selectSearchGoodsName", search);
		return (ArrayList<GoodsPrint>)list;
	}

	// 발주처 검색
	public int selectSearchPdNameCount(Search search) {
		return sqlSessionTemplate.selectOne("goodsMapper.selectSearchPdNameCount", search);
	}

	public ArrayList<GoodsPrint> selectSearchPdName(Search search) {
		List<GoodsPrint>list =sqlSessionTemplate.selectList("goodsMapper.selectSearchPdName", search);
		return (ArrayList<GoodsPrint>)list;
	}

	// 상품 등록
	public int insertGoods(GoodsPrint goodsPrint) {
		return sqlSessionTemplate.insert("goodsMapper.insertGoods", goodsPrint);
	}

	public int deleteGoods(GoodsPrint goodsPrint) {
		return sqlSessionTemplate.delete("goodsMapper.deleteGoods", goodsPrint);
	}

	public ArrayList<GoodsPrint> selectProducePrint(Paging paging) {
		List<GoodsPrint>list =sqlSessionTemplate.selectList("goodsMapper.selectProducePrint", paging);
		return (ArrayList<GoodsPrint>)list;
	}
	

	
}
