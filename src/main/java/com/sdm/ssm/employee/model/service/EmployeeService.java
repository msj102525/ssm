package com.sdm.ssm.employee.model.service;

import java.util.ArrayList;
import java.util.List;

import com.sdm.ssm.common.Search;
import com.sdm.ssm.employee.model.vo.CommuteInfo;
import com.sdm.ssm.employee.model.vo.Employee;

public interface EmployeeService {

	// 직원 목록
	List<Employee> getAllEmployees(int id);

	Employee getEmployeeDetails(int empId,int id);

	int insertEmployee(Employee employee);

	int deleteEmployee(int empId);

	List<Employee> employeeSearchMethod(Search search);

	List<Employee> searchEmployeeByName(String username);

	List<Employee> selectEmpList();

	ArrayList<Employee> employeeListMethod();

	int updateEmployee(int id, Employee employee);

	Employee selectEmpInfo(int id,String empName);



}
