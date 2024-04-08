package com.sdm.ssm.employee.model.service;

import java.util.ArrayList;
import java.util.List;

import com.sdm.ssm.common.Search;
import com.sdm.ssm.employee.model.vo.CommuteInfo;
import com.sdm.ssm.employee.model.vo.Employee;

public interface EmployeeService {

	ArrayList<Employee> employeeListMethod();

	List<Employee> selectEmpList();

	List<Employee> employeeSearchMethod(Search search);

	String selectAllEmpMethod();

	Employee getEmployeeDetails(int empId);

	int insertEmployee(Employee employee);

	int updateEmployee(Employee employee);

	int deleteEmployee(int empId);

	List<Employee> searchEmployeeByName(String empName);

}
