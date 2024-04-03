package com.sdm.ssm.employee.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sdm.ssm.employee.model.vo.SalaryInfo;

@Repository("salaryInfoDao")
public class SalaryInfoDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public ArrayList<SalaryInfo> selectSalaryInfoMethod(int empId) {
		List<SalaryInfo> list = sqlSessionTemplate.selectList("SalaryInfoMapper.selectSalaryInfoMethod",empId);
		return (ArrayList<SalaryInfo>)list;
	}
}
