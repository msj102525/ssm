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
        return new ArrayList<>(list);
    }

    public List<Employee> employeeSearchMethod(Search search) {
        List<Employee> list = sqlSessionTemplate.selectList("employeeMapper.employeeSearchMethod", search);
        return new ArrayList<>(list);
    }

    public String selectAllEmpMethod() {
        return sqlSessionTemplate.selectOne("employeeMapper.selectAllEmpMethod");
    }

    public Employee getEmployeeDetails(Long empId) {
        return sqlSessionTemplate.selectOne("employeeMapper.getEmployeeDetails", empId);
    }

    public int insertEmployee(Employee employee) {
        return sqlSessionTemplate.insert("employeeMapper.insertEmployee", employee);
    }

    public int updateEmployee(Employee employee) {
        return sqlSessionTemplate.update("employeeMapper.updateEmployee", employee);
    }

    public int deleteEmployee(int empId) {
        return sqlSessionTemplate.delete("employeeMapper.deleteEmployee", empId);
    }

    public List<Employee> searchEmployeeByName(String empName) {
        return sqlSessionTemplate.selectList("employeeMapper.searchEmployeeByName", empName);
    }
}
