package com.sdm.ssm.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("recordTimeDao")
public class RecordTimeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
}
