<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <title>testGraph</title>
  </head>

  <body>
  
<c:import url="/WEB-INF/views/common/header.jsp" />
<h1 style="text-align: center;">그래프 연습</h1>
<c:import url="/WEB-INF/views/common/sidebar.jsp" />
<hr>
<br>

<div align="center">
<select style="height: 35px; width: 80px;" id="monthSelect">
	<option value="2024-01">2024-01</option>
    <option value="2024-02">2024-02</option>
    <option value="2024-03">2024-03</option>
    <option value="2024-04">2024-04</option>
    <option value="2024-05">2024-05</option>
    <option value="2024-06">2024-06</option>
    <option value="2024-07">2024-07</option>
    <option value="2024-08">2024-08</option>
    <option value="2024-09">2024-09</option>
    <option value="2024-10">2024-10</option>
    <option value="2024-11">2024-11</option>
    <option value="2024-12">2024-12</option>
</select> 
</div>
    <!--Div that will hold the pie chart-->
    <script type="text/javascript">

      google.charts.load('current', {'packages':['corechart']});

      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
	
    	var data = google.visualization.arrayToDataTable([
    	['월', '매출', '급여', '발주액', '월세', '기타비용', '수익'],
    	['1',  3500,      1500,         500,             50,           1460,      614.6],	
    	['2',  2000,      1268,         123,             50,           1000,      500],	
    	['3',  6026,      3000,         753,             50,           2375,      687],	
    	['4',  1500,      1270,         600,             50,           1245,      500],	
    	['5',  3759,      2303,         574,             50,           100,      597],	    	
    	]);
        // Set chart options
        var options = {
          title : '매출 그래프',
          vAxis: {title: '금액'},
          hAxis: {title: '월'},
          seriesType: 'bars',
          series: {5: {type: 'line'}}
        };

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    <div id="chart_div" style="width: 700px; height: 500px; margin: 0 auto;"></div>
  </body>
</html>