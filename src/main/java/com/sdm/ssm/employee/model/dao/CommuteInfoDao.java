package com.sdm.ssm.employee.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sdm.ssm.employee.model.vo.CommuteInfo;

@Repository("commutInfoDao")
public class CommuteInfoDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List<CommuteInfo> searchCommuteInfoByName(String empName) {
		return sqlSessionTemplate.selectList("commuteInfoMapper.searchCommuteInfoByName", empName);
	}

	public boolean recordCommuteInfo(CommuteInfo commuteInfo) {
		int result = sqlSessionTemplate.insert("commuteInfoMapper.insertCommuteInfo", commuteInfo);
		return result > 0;
	}

}

