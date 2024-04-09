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
	public ArrayList<SalaryInfo> selectSalaryInfoMethod(int Id) {
		return salaryInfoDao.selectSalaryInfoMethod(Id);
	}
	@Override
	public List<SalaryInfo> selectSalaryInfoByEmpId(int Id) {
		return salaryInfoDao.selectSalaryInfoByEmpId(Id);
	}
	@Override
	public List<SalaryInfo> getSalaryDate(int Id) {
		return salaryInfoDao.getSalaryDate(Id);
	}


}
