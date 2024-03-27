package com.sdm.ssm.reserve.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sdm.ssm.reserve.model.vo.Reserve;

@Repository("reserveDao")
public class ReserveDao {
	
	@Autowired //root-context.xml 에서 생성한 객체를 자동 연결함
	private SqlSessionTemplate sqlSessionTemplate;

	public int insertReserve(Reserve reserve) {
		return sqlSessionTemplate.insert("mapper.insertReserve", reserve);
	}

	public int updateReserve(Reserve reserve) {
		return sqlSessionTemplate.update("mapper.updateReserve", reserve);
	}

	public int deleteReserve(Reserve reserve) {
		return sqlSessionTemplate.delete("mapper.deleteReserve", reserve);
	}

	public Reserve selectRsrvDetail(Reserve reserve) {
		return sqlSessionTemplate.selectOne("mapper.selectRsrvDetail", reserve);
	}

}
