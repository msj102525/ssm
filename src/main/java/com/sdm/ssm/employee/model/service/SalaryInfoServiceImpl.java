package com.sdm.ssm.employee.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.ssm.employee.model.dao.SalaryInfoDao;
import com.sdm.ssm.employee.model.vo.SalaryInfo;

@Service
public class SalaryInfoServiceImpl implements SalaryInfoService {
	
	@Autowired
	private SalaryInfoDao salaryInfoDao;

	@Override
	public ArrayList<SalaryInfo> selectSalaryInfoMethod(int empId) {
		return salaryInfoDao.selectSalaryInfoMethod(empId);
	}
	 @Override
	 public boolean insertSalaryInfo(SalaryInfo salaryInfo) {
	   return salaryInfoDao.insertSalaryInfo(salaryInfo);
	    }
	@Override
	public List<SalaryInfo> selectSalaryInfoByEmpId(int empId) {
		return salaryInfoDao.selectSalaryInfoByEmpId(empId);
	}


}
