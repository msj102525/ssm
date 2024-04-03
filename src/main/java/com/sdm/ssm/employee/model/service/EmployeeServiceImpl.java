package com.sdm.ssm.employee.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sdm.ssm.common.Search;
import com.sdm.ssm.employee.model.dao.EmployeeDao;
import com.sdm.ssm.employee.model.vo.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeDao employeeDao;
	

	@Override
	public ArrayList<Employee> employeeListMethod() {
		// TODO Auto-generated method stub
		return employeeDao.employeeListMethod();
	}

	@Override
	public List<Employee> selectEmpList() {	
		return employeeDao.selectEmpList();
	}

	@Override
	public List<Employee> employeeSearchMethod(Search search) {
		return employeeDao.employeeSearchMethod(search);
	}

	@Override
	public String selectAllEmpMethod() {
		return employeeDao.selectAllEmpMethod();
	}

	@Override
	public Employee getEmployeeDetails(Long empId) {
		// TODO Auto-generated method stub
		return employeeDao.getEmployeeDetails(empId);
	}

	@Override
	public void insertEmployee(Employee employee) {
		 return;
	}

	@Override
	public void updateEmployee(Employee employee) {
		return;
		
	}

	@Override
	public void deleteEmployee(int empId) {
		return;
		
	}
	
	
}
