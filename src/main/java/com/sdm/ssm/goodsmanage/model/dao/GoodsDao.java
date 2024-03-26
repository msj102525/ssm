package com.sdm.ssm.goodsmanage.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.sdm.ssm.common.Paging;
import com.sdm.ssm.goodsmanage.model.vo.Goods;

@Repository("goodsDao")
public class GoodsDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int selectListCount() {
		return sqlSessionTemplate.selectOne("goodsMapper.selectListCount") ;
	}

	public ArrayList<Goods> selectList(Paging paging) {
		List<Goods> list = sqlSessionTemplate.selectList("goodsMapper.selectList", paging);
		return (ArrayList<Goods>)list;
	}

}
