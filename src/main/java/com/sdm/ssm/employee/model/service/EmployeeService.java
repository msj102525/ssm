package com.sdm.ssm.employee.model.service;

import java.util.ArrayList;
import java.util.List;

import com.sdm.ssm.common.Search;
import com.sdm.ssm.employee.model.vo.Employee;

public interface EmployeeService {

	ArrayList<Employee> employeeListMethod();

	List<Employee> selectEmpList();

	List<Employee> employeeSearchMethod(Search search);

	String selectAllEmpMethod();

	Employee getEmployeeDetails(Long empId);

	void insertEmployee(Employee employee);

	void updateEmployee(Employee employee);

	void deleteEmployee(int empId);

}
