package com.sdm.ssm.employee.model.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sdm.ssm.common.Search;
import com.sdm.ssm.employee.model.service.CommuteInfoService;
import com.sdm.ssm.employee.model.service.EmployeeService;
import com.sdm.ssm.employee.model.service.SalaryInfoService;
import com.sdm.ssm.employee.model.vo.CommuteInfo;
import com.sdm.ssm.employee.model.vo.Employee;
import com.sdm.ssm.employee.model.vo.SalaryInfo;
import com.sdm.ssm.user.model.vo.User;

@Controller
public class EmployeeController {

	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private SalaryInfoService salaryInfoService;
	@Autowired
	private CommuteInfoService commuteInfoService;
	
	//@Autowired
	//private SalaryInfoService salaryInfoService;
	

	// 직원 관리 메인 페이지 이동
	@RequestMapping(value = "mainEmpPage.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String emplyeeMainPage(Employee employee, Model model) {
		return "employee/employeeMainPage";
	}

	// 직원 정보 등록 페이지로 이동
	@RequestMapping(value = "insertemp.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String moveEmployeePage() {
		return "employee/EmployeeRegister";
	}

	// 직원 목록 페이지로 이동
	@RequestMapping(value = "selectemp.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String moveSelectEmpPage(Employee employee, Model model) {
		return "employee/EmployeeList";
	}

	// 직원 정보 수정페이지 이동
	@RequestMapping(value = "updateEmployee.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String moveUpdateEmpPage(Employee employee, Model model, HttpServletRequest request) {
		return "employee/upEmployee";
	}

	// 직원 급여 정보 페이지 이동
	@RequestMapping(value = "selectSalary.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String moveSalaryPage(SalaryInfo salaryInfo, Model model, HttpServletRequest request) {
		return "employee/SalaryInfo";
	}

	// 직원 급여정보 등록 페이지 이동
	@RequestMapping(value = "insertSalary.do")
	public String moveInsertSalaryPage(HttpServletRequest request, Employee employee) {
		return "employee/salaryInfoDate";
	}

	// 직원 급여 정보 수정 페이지 이동
	@RequestMapping("updateSalaryInfo.do")
	public String moveUpdateSalaryPage(SalaryInfo salaryInfo, Model model, HttpServletRequest request) {
		return "employee/salaryInfoDate";
	}

	// 근태관리 페이지로 이동
	@RequestMapping(value = "selectcommutePage.do")
	public String moveSelectCommutelnPage() {
		return "employee/CommuteInfoPage";
	}

	// 출퇴근시간 조회 페이지 이동
	@RequestMapping(value = "recordTimePage.do")
	public String moveRecordTimePage() {
		return "employee/CommuteQRPage";
	}

	// QR 페이지 이동
	@RequestMapping("QRimages.do")
	public String moveQRPage() {
		return "employee/QRcommuteInfo"; // 이동할 페이지의 이름을 반환합니다.
	}

	// 메세지 페이지 이동
	@RequestMapping("kakaoM.do")
	public String moveKakaoMessagePage(Model model, HttpServletRequest request) {
		return "employee/kakao";
	}
	// 직원 정보 수정페이지 이동 및 정보 가져오기
		@GetMapping("moveUpdateEmpPage.do")
		public String moveUpdateEmpPage(@RequestParam("empId") int empId, Model model) {
		    Employee employee = employeeService.getEmployeeDetails(empId);
		    model.addAttribute("employee", employee);
		    return "employee/upEmployee"; // 수정할 직원 정보를 가져와서 수정 페이지로 이동
		}

	// 처리용----------------------------------------------------------------------------
	
	// 세션에 저장된 사용자 정보를 가져오는 메서드 예시
	public User getLoggedInUser(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return (User) session.getAttribute("loggedInUser");
        }
        return null;
    }
	// 상세 조회를 위한 메서드 추가
	@GetMapping("employeeDetails.do")
	@ResponseBody
	public ResponseEntity<Employee> getEmployeeDetails(@RequestParam("empId") int empId) {
	    try {
	        Employee employee = employeeService.getEmployeeDetails(empId);
	        if (employee != null) {
	            return ResponseEntity.ok(employee);
	        } else {
	            return ResponseEntity.notFound().build(); // 해당 직원을 찾을 수 없는 경우 404 응답 반환
	        }
	    } catch (Exception e) {
	        // 예외 처리
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 서버 오류가 발생한 경우 500 응답 반환
	    }
	}
	// 직원 등록
	// 직원 등록 페이지에서 직원 정보를 저장하는 메서드
	@PostMapping("insertEmp.do")
	public ResponseEntity<String> insertEmployee(HttpServletRequest request, @RequestBody Employee employee) {
	    // 세션에서 로그인한 사용자 정보를 가져옴
	    User loggedInUser = getLoggedInUser(request);
	    if (loggedInUser != null) {
	        // 세션에 저장된 사용자의 ID를 직원의 사용자 ID로 설정
	        employee.setId(loggedInUser.getId()); // 또는 다른 필드를 선택하여 설정할 수 있습니다.
	        // 직원 등록 처리
	        int result = employeeService.insertEmployee(employee);
	        if (result > 0) {
	            return new ResponseEntity<>("직원 등록 성공", HttpStatus.OK);
	        } else {
	            return new ResponseEntity<>("직원 등록 실패", HttpStatus.INTERNAL_SERVER_ERROR);
	        }
	    } else {
	        return new ResponseEntity<>("로그인이 필요합니다", HttpStatus.UNAUTHORIZED);
	    }
	}
	

	// 직원 정보 수정 처리
		@PostMapping("updateEmployee.do")
		public ResponseEntity<String> updateEmployee(@RequestBody Employee employee) {
		    int result = employeeService.updateEmployee(employee);
		    if (result > 0) {
		        return new ResponseEntity<>("직원 정보 수정 성공", HttpStatus.OK);
		    } else {
		        return new ResponseEntity<>("직원 정보 수정 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		    }
		}

	// 직원 삭제
	@PostMapping("deleteEmployee.do")
	public ResponseEntity<String> deleteEmployee(@RequestParam("empId") int empId) {
		int result = employeeService.deleteEmployee(empId);
		if (result > 0) {
			return new ResponseEntity<>("직원 삭제 성공", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("직원 삭제 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	// 직원 검색
	@PostMapping("employeessearch.do")
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
	
		// 특정 직원의 이름으로 출퇴근 정보 검색
		@PostMapping("searchCommuteInfoByName.do")
		public ResponseEntity<List<CommuteInfo>> searchCommuteInfoByName(@RequestParam("empName") String empName) {
		    try {
		        List<CommuteInfo> commuteInfoList = commuteInfoService.searchCommuteInfoByName(empName);
		        if (!commuteInfoList.isEmpty()) {
		            return ResponseEntity.ok(commuteInfoList);
		        } else {
		            return ResponseEntity.notFound().build(); // 해당 직원의 출퇴근 정보를 찾을 수 없는 경우 404 응답 반환
		        }
		    } catch (Exception e) {
		        // 예외 처리
		        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 서버 오류가 발생한 경우 500 응답 반환
		    }
		}

	// 특정 직원의 급여 정보 조회
	@GetMapping("selectEmpSalary.do")
	public ResponseEntity<List<SalaryInfo>> selectSalaryInfoByEmpId(@RequestParam("empId") int empId) {
	    try {
	        List<SalaryInfo> salaryInfoList = salaryInfoService.selectSalaryInfoByEmpId(empId);
	        if (!salaryInfoList.isEmpty()) {
	            return ResponseEntity.ok(salaryInfoList);
	        } else {
	            return ResponseEntity.notFound().build(); // 해당 직원의 급여 정보를 찾을 수 없는 경우 404 응답 반환
	        }
	    } catch (Exception e) {
	        // 예외 처리
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 서버 오류가 발생한 경우 500 응답 반환
	    }
	}
	
	
	
}
