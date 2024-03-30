<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/goods/goodsDetail.css" />
<title>Insert title here</title>
</head>
<body>
<c:import url="/WEB-INF/views/common/header.jsp" />

<hr>
<br>
<c:import url="/WEB-INF/views/common/sidebar.jsp" />
<h1 align="left">재고 등록</h1>
<div style="align:center;text-align:center;">
<br>
<br>
<br>
</div>

<div style="margin-left: auto; margin-right: auto; width: 1400px;">
    <form action="/your-submit-url" method="post">
        <table align="center" border="1" cellspacing="25" width="100%">
            <tr>
                <th style="text-align: center; white-space: nowrap;">번호</th>
                <th style="text-align: center; white-space: nowrap;">상품명</th>
                <th style="text-align: center; white-space: nowrap;">수량</th>
                <th style="text-align: center; white-space: nowrap;">단위</th>
                <th style="text-align: center; white-space: nowrap;">발주 최소 수량</th>
                <th style="text-align: center; white-space: nowrap;">알림 최소 수량</th>
                <th style="text-align: center; white-space: nowrap;">발주처</th>
                <th style="text-align: center; white-space: nowrap;">발주 연락처</th>
                <th style="text-align: center; white-space: nowrap;">원산지</th>
            </tr>
            <tr>               	
                    <td align="center" style="white-space: nowrap;">${ goodsPrint.goodsNo } +1</td>
                    <td align="center" style="white-space: nowrap;">
						<input type="text" maxlength='100' name="goodsName" style="width: 50px; margin-right: 0px; vertical-align: middle;" />                     
					</td>
                    <td align="center" style="white-space: nowrap;">
						<input type="number" name="pdQuantity" style="width: 50px; margin-right: 0px; vertical-align: middle;" />                          
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="text" maxlength='10' name="goodsUnit" style="width: 50px; margin-right: 0px; vertical-align: middle;" />                            
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number" name="minOrderQuantity" name="goodsName" style="width: 50px; margin-right: 0px; vertical-align: middle;" />                           
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="number" name="minAlarmQuantity" style="width: 50px; margin-right: 0px; vertical-align: middle;" />                          
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="text" maxlength='100'  name="pdName"  style="width: 50px; margin-right: 0px; vertical-align: middle;" />                         
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="text" maxlength='30' name="pdPhone"  style="width: 50px; margin-right: 0px; vertical-align: middle;" />                          
					</td>
					<td align="center" style="white-space: nowrap;">
						<input type="text" maxlength='10'  name="nation"  style="width: 50px; margin-right: 0px; vertical-align: middle;" />                      
					</td>
					
              </tr>
        </table>
    </form>
</div>





</body>
</html>