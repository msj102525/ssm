package com.sdm.ssm.employee.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sdm.ssm.common.Search;
import com.sdm.ssm.employee.model.vo.Employee;

@Repository("employeeDao")
public class EmployeeDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Employee> selectEmpList() {
        return sqlSessionTemplate.selectList("employeeMapper.selectEmpList");
	}

	public ArrayList<Employee> employeeListMethod() {
		List<Employee> list = sqlSessionTemplate.selectList("employeeMapper.employeeListMethod");
		return (ArrayList<Employee>)list;

	}

	public List<Employee> employeeSearchMethod(Search search) {
		List<Employee> list = sqlSessionTemplate.selectList("employeeMapper.employeeSearchMethod", search);	
		return (ArrayList<Employee>)list;
	}

	public String selectAllEmpMethod() {
		return sqlSessionTemplate.selectOne("employeeMapper.selectAllEmpMethod");
	}

	public Employee getEmployeeDetails(Long empId) {
		return sqlSessionTemplate.selectOne("employeeMapper.getEmployeeDetails", empId);
	}

	public Object insertEmployee(Employee employee) {
		return sqlSessionTemplate.insert("employeeMapper.insertEmployee",employee);
	}

	public Object updateEmployee(Employee employee) {
		return sqlSessionTemplate.update("employeeMapper.updateEmployee",employee);
	}

	public Object deleteEmployee(int empId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.delete("employeeMapper.updateEmployee",empId);
	}

	
}
