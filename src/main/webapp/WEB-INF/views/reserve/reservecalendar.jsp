<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style type="text/css">
	#menu { 
		float:right;
		list-style-type:none; 
		margin:0 0 1em;
		padding:8px 0 0 10px; 
		white-space:nowrap; 
		width:100%;
	}
	
	.pagination {
	   justify-content: center;
	}
</style>
<title>ssm</title>
<script type="text/javascript" src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
</head>
<body>
<hr>
<div align="center">
	<!-- 달력 테이블 -->
	<table class="table" border="1" id="calTable">
		<col width="100"><col width="100"><col width="100"><col width="100">
		<col width="100"><col width="100"><col width="100">
			<tr height="100">
				<!-- 첫번째 행 (보이는 년,월과 버튼) -->
			 	<td colspan="7" align="center" style="padding-top: 20px">
			 	
			 	<a href='javascript:prevYear()'><img src='image/left.gif'></a>
			 	<a href='javascript:prevMonth()'><img src='image/prec.gif'></a>
			 	
				<font id="yyyy" color="black" style="font-size: 40px">
		 		</font>
				<font color="black" style="font-size: 40px">년
		 		</font>
				<font id="MM" color="black" style="font-size: 40px">
		 		</font>
				<font color="black" style="font-size: 40px">월
		 		</font>
		 		
		 		<a href='javascript:nextMonth()'><img src='image/next.gif'></a>
		 		<a href='javascript:nextYear()'><img src='image/last.gif'></a>

			 	</td>
			</tr>	
		 	
		 	<!-- 두번째 행 (요일) -->
		 	<tr height="50">
		 		<th align="center">일</th>
		 		<th align="center">월</th>
		 		<th align="center">화</th>
		 		<th align="center">수</th>
		 		<th align="center">목</th>
		 		<th align="center">금</th>
		 		<th align="center">토</th>
		 	</tr>
		 	
	</table>
</div>
<!-- 
<script type="text/javascript">
	let now = new Date();
	let year = now.getFullYear();	//년
	let month = now.getMonth()+1;	//월
	let date = now.getDate();	//일
	let day = now.getDay();	//요일 0~6
	//alert(date);
	
	$('#yyyy').text(year);
	$('#MM').text(month);

	getCalListData();

	//-----------------------------------------------
	//// bbslist를 취득
	//-----------------------------------------------
	function getCalListData() {
		
		let selectYear = $('#yyyy').text();
		let selectMonth = $('#MM').text();
		
		$.ajax({
			url:"callistData.do",
			type:"get",
			data:{
				year:selectYear,
				month:selectMonth
			},
			success:function(list){
				//alert('success');
				//alert("년/월 : "+selectYear+"/"+selectMonth);
				
				$('.calCls').remove();
				
				let lastDay = (new Date(selectYear, selectMonth, 0)).getDate();	// 마지막 일수
				//alert("마지막날 일수 : "+lastDay);
				let firstDayOfWeek = (new Date(selectYear, selectMonth-1, 1)).getDay();	//첫날 요일
				//alert("첫날요일 : "+firstDayOfWeek);
				let lastDayOfWeek = (new Date(selectYear, selectMonth, 0)).getDay();	//마지막날 요일
				//alert("마지막날요일 : "+lastDayOfWeek);
				
				let middle = '<tr class="calCls" height="100" align="left" valign="top">';
				
				/* 첫번째 줄 회색칸 */
				for(i = 1; i <= firstDayOfWeek; i++) {
					middle += "<td style='background-color: #cecece'>&nbsp;</td>";
				} 
				
				/* 날짜 표시 */
				for(i = 1; i <= lastDay; i++) {
					
					middle += "<td>"
						+ callist(selectYear, selectMonth, i)
						+ "&nbsp;&nbsp;"
						+ showPen(selectYear, selectMonth, i)
						+ makeTable(selectYear, selectMonth, i, list)
						+ "</td>";
					
			     	if( (i + firstDayOfWeek) % 7 == 0 && i != lastDay) {				
						middle += "</tr><tr class='calCls' height='100' align='left' valign='top'>";				
					} 			
				}
				
				/* 마지막 줄 회색칸 */
				for(i = 1; i <= 6 - lastDayOfWeek; i++) {
					middle += "<td style='background-color: #cecece'>&nbsp;</td>";
				} 
				
				middle += "</tr>";
				
				$("#calTable").append(middle);	
			},
			
			error:function(){
				alert('error');
			}
		});
	};

	//이전 년도
	function prevYear() {
		year -= 1;
		$('#yyyy').text(year);
		
		getCalListData();
	}

	//이전 월
	function prevMonth() {
		month -= 1;
		if(month < 1) {
			month = 12;
			year -= 1;
		}
		
		$('#yyyy').text(year);
		$('#MM').text(month);
		
		getCalListData();
	}

	//다음 월
	function nextMonth() {
		month += 1;
		if(month > 12) {
			month = 1;
			year += 1;
		}
		
		$('#yyyy').text(year);
		$('#MM').text(month);
		
		getCalListData();
	}

	//다음 년도
	function nextYear() {
		year += 1;
		
		$('#yyyy').text(year);
		
		getCalListData();
	}

	/* 날짜를 클릭하면 그 날의 일정을 모두 볼 수 있는 callist.jsp로 이동하는 url 만드는 메소드 */
	function callist(year, month, day) {
		let str = "&nbsp;<a href='calDayList.do?year="+year+"&month="+month+"&day="+day+"'>"+day+"</a>";
		/* <a href='calDetail.do?year=2021&month=3&day=19'>19</a> */
		return str;
		
	}

	/* 일정을 추가하기 위해서 pen 이미지를 클릭하면 calwrite.jsp로 이동하는 url 만드는 메소드 */
	function showPen(year, month, day) {
		let str = "";
		let image = "<img src='image/pen.png' width='18px' height='18px'>";
		
		str += "<a href='calWrite.do?year="+year+"&month="+month+"&day="+day+"'>"+image+"</a>";
		
		/* ex)	<a href='calwrite.jsp?year=2021&month=3&day=19'><img src='image/pen2.png' width='18px' height='18px'></a> */
		
		return str;
	}

	/* 달력의 날짜 별로 스케줄을 설정할 테이블을 작성하는 메소드 */
	function makeTable(year, month, day, list) {
		let str = "";
		let dates = (year+"") + two(month+"") + two(day+"");	//월과 일은 한자리일때 두자리로 바꿔줌
		str += "<table>";
		str += "<col width='100'>";
		
		$.each(list, function (i, val) {
			if(val.rdate.substring(0, 8) == dates) { //'list안의 날짜'가 '입력하는 날짜'와 같을 때,
				str += "<tr>"
				+ "<td style='line-height: 3px; overflow: hidden; border-collapse:collapse;'>"
				+ "<a href='calDetail.do?seq=" + val.seq + "'>"
				+ "<font style='font-size:13px; color:blue'>"
				+ dot3(val.title)
				+ "</font>"
				+ "</a>"
				+ "</td>"
				+ "</tr>";
			}
		})
		
		str += "</table>";
		
		return str;
		
	}
	
	
	/* 한 문자를 두 문자로 변경해주는 메소드 (ex 3월 - > 2021319 가 아닌 20210319로 만든다) */
	function two(msg) {
		
		return msg.length < 2 ? "0"+msg : msg;
		//길이가 2보다 작으면 앞에 0을 붙여준다.
	}
	
	
	/* 일정의 제목이 길 때 ... 으로 처리하는 메소드 (ex 4글자 제한일 때, CGV에서 데이트 -> CGV에... ) */
	function dot3(msg) {
		let str = "";
		if(msg.length > 4) {
			str = msg.substring(0, 4); // ex) CGV에서 데이트 -> CGV에...
			str += "...";
		}
		else {
			str = msg;
		}
		return str;
	}

</script> -->

</body>
</html>