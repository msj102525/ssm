package com.sdm.ssm.employee.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("calentdarDao")
public class CalendarDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
}
