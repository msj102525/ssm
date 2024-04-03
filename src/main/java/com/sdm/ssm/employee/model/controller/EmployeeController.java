package com.sdm.ssm.employee.model.controller;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdm.ssm.common.Search;
import com.sdm.ssm.employee.model.service.EmployeeService;
import com.sdm.ssm.employee.model.service.SalaryInfoService;
import com.sdm.ssm.employee.model.vo.Employee;
import com.sdm.ssm.employee.model.vo.SalaryInfo;

@Controller
public class EmployeeController {
	
	
	
	@Autowired
    public EmployeeController(EmployeeService employeeService) {
        this.employeeService = employeeService;
	}
	
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private SalaryInfoService salaryInfoService;
	
//	@Autowired
//	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	//직원 관리 메인 페이지 이동
	@RequestMapping(value="mainEmpPage.do" , method={RequestMethod.POST, RequestMethod.GET})
	public String emplyeeMainPage (Employee employee , Model model) {
		return "employee/employeeMainPage";
	}
	
	//직원 정보 등록 페이지로 이동 
	 @RequestMapping(value="insertemp.do", method={RequestMethod.POST, RequestMethod.GET})
	    public String moveEmployeePage() {
	        return "employee/EmployeeRegister";
	    }
	
	// 직원 목록 페이지로 이동
	 @RequestMapping(value="selectemp.do", method={RequestMethod.POST, RequestMethod.GET})
	    public String moveSelectEmpPage(Employee employee, Model model) {
	        return "employee/EmployeeList";
	    }	
    
    // 직원 정보 수정페이지 이동 
	 @RequestMapping(value="updateEmployee.do", method= {RequestMethod.POST,RequestMethod.GET})
	    public String moveUpdateEmpPage(Employee employee, Model model, HttpServletRequest request) {
	        return "employee/upEmployee";
	    }
	 
	 //직원 급여 정보 페이지 이동
	 @RequestMapping(value="selectSalary.do", method={RequestMethod.POST, RequestMethod.GET})
	 public String moveSalaryPage(SalaryInfo salaryInfo , Model model , HttpServletRequest request) {
		 return "employee/SalaryInfo";
	 }
	 
    //직원 급여정보 등록 페이지 이동
	 @RequestMapping(value="insertSalary.do")
	    public String moveInsertSalaryPage(HttpServletRequest request, Employee employee) {
	        return "employee/salaryInfoDate";
	    }
	// 직원 급여 정보 수정 페이지 이동
	 @RequestMapping("updateSalaryInfo.do")
	 public String moveUpdateSalaryPage(SalaryInfo salaeyInfo , Model model , HttpServletRequest request) {
		 
		 return "employee/salaryInfoDate";
	 }
	 
	 //메세지 페이지 이동
	 @RequestMapping("kakaoM.do")
	 public String movekoMessagePage(Model model ,HttpServletRequest request) {
		 return "employee/kakao";
	 }
	 
	// 처리용---------------------------------
	//회원 정보 조회 처리용
	/*
	 * @RequestMapping("selectEmployee.do") public String
	 * employeeListMethod(Employee employee, Model model, HttpServletRequest
	 * request) { ArrayList<Employee> list = (ArrayList<Employee>)
	 * employeeService.employeeListMethod(); model.addAttribute("list", list);
	 * return "employee/EmployeeList"; }
	 */
	
	/*
	 * @RequestMapping(value="/employeeDetails" , method={RequestMethod.POST,
	 * RequestMethod.GET}) public ResponseEntity<Employee>
	 * getEmployeeDetails(@RequestParam("empId") Long empId) { Employee employee =
	 * employeeService.getEmployeeDetails(empId); return
	 * ResponseEntity.ok(employee); }
	 */
	 @RequestMapping(value="/employeeDetails", method={RequestMethod.POST, RequestMethod.GET})
	 @ResponseBody
	 public ResponseEntity<Employee> getEmployeeDetails(@RequestParam("empId") Long empId) {
	     Employee employee = employeeService.getEmployeeDetails(empId);
	     return ResponseEntity.ok(employee);
	 }

	 // 직원 검색	 
	 @PostMapping("/employees/search")
	    public String employeeSearchMethod(@RequestBody Search search, Model model) {
	        List<Employee> list = employeeService.employeeSearchMethod(search);
	        model.addAttribute("employees", list);
	        return "employee/EmployeeList";
	    }
	 	  
	 // 급여 정보 조회용		  
	 @RequestMapping("selectSalary.do")
	 public String selectSalaryInfoMethod(@RequestParam("empId") int empId, Model model) {
	     ArrayList<SalaryInfo> list = salaryInfoService.selectSalaryInfoMethod(empId);
	     model.addAttribute("salaryInfos", list);
	     return "employee/SalaryInfo";
	 }

	    
	    public void insertEmployee(Employee employee) {
	    	employeeService.insertEmployee(employee);
	    }
	    
	    public void updateEmployee(Employee employee) {
	    	employeeService.updateEmployee(employee);
	    }
	    
	    public void deleteEmployee(int empId) {
	    	employeeService.deleteEmployee(empId);
	    }
}
