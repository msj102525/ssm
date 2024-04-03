package com.sdm.ssm.employee.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.sdm.ssm.employee.model.vo.SalaryInfo;

public interface SalaryInfoService {

	ArrayList<SalaryInfo> selectSalaryInfoMethod(int empId);
	
	
	
	
}
