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
    public int insertEmployee(Employee employee) {
        return employeeDao.insertEmployee(employee);
    }

    @Override
    public int updateEmployee(Employee employee) {
        return employeeDao.updateEmployee(employee);
    }

    @Override
    public int deleteEmployee(int empId) {
        return employeeDao.deleteEmployee(empId);
    }

    @Override
    public List<Employee> searchEmployeeByName(String empName) {
        return employeeDao.searchEmployeeByName(empName);
    }

	@Override
	public Employee getEmployeeDetails(int empId) {
		return employeeDao.getEmployeeDetails(empId);
	}

	@Override
	public List<Employee> getAllEmployees(int id) {
		// TODO Auto-generated method stub
		return employeeDao.getAllEmployees(id);
	}



	

	
}
