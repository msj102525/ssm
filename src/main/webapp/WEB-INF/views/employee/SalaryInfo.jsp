<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>직원 급여 정보</title>
<style>
/* 스타일은 여기에 작성합니다. */
</style>
</head>
<body>
    <%-- 헤더와 사이드바 불러오기 --%>
    <c:import url="/WEB-INF/views/common/header.jsp" />
    <c:import url="/WEB-INF/views/common/sidebar.jsp" />
    <div class="container">
        <h2>직원 급여 정보</h2>
        <!-- 급여 정보 표시 -->
        <table id="salaryInfoTable">
            <thead>
                <tr>
                    <th>직원번호</th>
                    <th>이름</th>
                    <th>은행 이름</th>
                    <th>계좌 번호</th>
                    <th>보험료</th>
                    <th>세금</th>
                    <th>월급</th>
                    <th>삭제</th> <!-- 삭제 버튼 추가 -->
                </tr>
            </thead>
            <tbody>
                <c:forEach var="salaryInfo" items="${requestScope.employees}">
                    <tr onclick="loadSalaryInfoDetails(${salaryInfo.empId})">
                        <td>${salaryInfo.empId}</td>
                        <td>${salaryInfo.empName}</td>
                        <td>${salaryInfo.bankName}</td>
                        <td>${salaryInfo.bankAccountNo}</td>
                        <td>${salaryInfo.premium}</td>
                        <td>${salaryInfo.tax}</td>
                        <td>${salaryInfo.monthlySalary}</td>
                        <td>
                            <form action="deleteSalary" method="post"
                                onsubmit="return confirm('정말 삭제하시겠습니까?');">
                                <input type="hidden" name="empId" value="${salaryInfo.empId}">
                                <input type="submit" value="삭제">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 선택된 직원의 상세 정보 -->
        <table id="loadSalaryInfoDetails" style="display: none;">
            <tbody>
                <tr>
                    <th>직원 번호</th>
                    <td id="detailEmpId"></td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td id="detailEmpName"></td>
                </tr>
                <tr>
                    <th>은행 이름</th>
                    <td id="detailBankName"></td>
                </tr>
                <tr>
                    <th>계좌 번호</th>
                    <td id="detailBankAccountNo"></td>
                </tr>
                <tr>
                    <th>보험료</th>
                    <td id="detailPremium"></td>
                </tr>
                <tr>
                    <th>세금</th>
                    <td id="detailTax"></td>
                </tr>
                <tr>
                    <th>월급</th>
                    <td id="detailMonthlySalary"></td>
                </tr>
            </tbody>
        </table>
        
        <!-- 시급 입력 폼 -->
        <div class="hourly-wage-form">
            <form action="calculateMonthlySalary" method="post">
                <h4 class="page-title">월급 계산</h4>
                <label for="hourlyWage">시급:</label>
                <input type="number" id="hourlyWage" name="hourlyWage" required>
                <button type="submit">
                    <i class="totalSalact"></i> 월급 계산
                </button>
            </form>
        </div>
        
        <!-- 버튼 그룹 -->
        <div class="button-group">
            <!-- 등록 페이지 이동 버튼 -->
            <button onclick="location.href='insertSalary.do'">등록 하기</button>
            <!-- 수정 페이지로 이동 버튼 -->
            <button onclick="location.href='updateSalaryInfo.do'">수정하기</button>
            <!-- 목록으로 돌아가기 버튼 -->
            <button onclick="location.href='mainEmpPage.do'">목록으로 돌아가기</button>
            <!-- 직원 급여 내보내는 버튼 -->
            <button onclick="location.href='insertSalary.do'">내보내기 하기</button>
        </div>
    </div>
    
    <%-- 푸터 불러오기 --%>
    <c:import url="/WEB-INF/views/common/footer.jsp" />

    <script>
        // 서버로부터 모든 직원의 급여 정보를 가져와서 테이블에 추가하는 함수
        function loadAllSalaryInfos() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    var salaryInfos = JSON.parse(this.responseText); // 서버로부터 받은 JSON 데이터 파싱
                    var tableBody = document.querySelector("#salaryInfoTable tbody"); // 테이블의 tbody 요소 가져오기

                    // 기존 데이터를 모두 지우고 새로운 데이터를 추가
                    tableBody.innerHTML = '';

                    // salaryInfos 배열을 순회하면서 각 직원의 정보를 테이블에 추가
                    salaryInfos.forEach(function(salaryInfo) {
                        var row = tableBody.insertRow(); // 새로운 행 생성

                        // 각 필드에 대한 셀 추가
                        var empIdCell = row.insertCell();
                        empIdCell.textContent = salaryInfo.empId;

                        var empNameCell = row.insertCell();
                        empNameCell.textContent = salaryInfo.empName;

                        var bankNameCell = row.insertCell();
                        bankNameCell.textContent = salaryInfo.bankName;

                        var bankAccountNoCell = row.insertCell();
                        bankAccountNoCell.textContent = salaryInfo.bankAccountNo;

                        var premiumCell = row.insertCell();
                        premiumCell.textContent = salaryInfo.premium;

                        var taxCell = row.insertCell();
                        taxCell.textContent = salaryInfo.tax;

                        var monthlySalaryCell = row.insertCell();
                        monthlySalaryCell.textContent = salaryInfo.monthlySalary;
                    });
                }
            };
            xhttp.open("GET", "/getAllSalaryInfos", true); // 서버로 요청을 보냄
            xhttp.send();
        }

        // 페이지 로드 시 모든 직원의 급여 정보를 가져와서 테이블에 추가
        window.onload = function() {
            loadAllSalaryInfos();
        };
    </script>
</body>
</html>
