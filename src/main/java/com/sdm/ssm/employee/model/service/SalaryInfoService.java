package com.sdm.ssm.employee.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.sdm.ssm.employee.model.vo.SalaryInfo;

public interface SalaryInfoService {

	ArrayList<SalaryInfo> selectSalaryInfoMethod(int Id);

	List<SalaryInfo> selectSalaryInfoByEmpId(int Id);

	List<SalaryInfo> getSalaryDate(int Id);
	
	
	
	
}
