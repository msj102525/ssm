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
	 public boolean insertSalaryInfo(SalaryInfo salaryInfo) {
	        int rowsAffected = sqlSessionTemplate.insert("SalaryInfoMapper.insertSalaryInfo", salaryInfo);
	        return rowsAffected > 0;
	    }
	  public List<SalaryInfo> selectSalaryInfoByEmpId(int empId) {
	        return sqlSessionTemplate.selectList("SalaryInfoMapper.selectSalaryInfoByEmpId", empId);
	    }
}


