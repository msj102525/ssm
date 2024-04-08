/**
 * 
 */
 
 $(function() {
		//해당 유저의 불편사항 최신순 5개 조회
		$.ajax({
					url : "inconvtop5.do",
					type : "post",
					dataType : "json",
					data: { id: $("#loginUserId").val()},
					success : function(data) {
						console.log("success : " + data);
						//object --> string
						var str = JSON.stringify(data);
						//string --> json
						var json = JSON.parse(str);
						var string = "";
						values = "";
						for ( var i in json.ilist) {
							if (json.ilist[i].status == '1') {
								string = "조치전"
							} else if (json.ilist[i].status == '2') {
								string = "조치중"
							} else {
								string = "조치완료"
							}
							;
							values += "<tr onclick='javascript:location.href=\"inconvdetail.do?ino="
									+ json.ilist[i].ino
									+ "\";'><td>"
									+ decodeURIComponent(json.ilist[i].ititle)
											.replace(/\+/gi, " ")
									+ "</td><td>"
									+ string + "</td></tr>";
						}
						// 결과가 5개 미만일 때 빈 행을 추가하여 총 5개의 행
						for (var j = json.ilist.length; j < 5; j++) {
							values += "<tr><td>&nbsp;</td><td>&nbsp;</td></tr>";
						}

						$('#inconvinienceUser').html(
								$('#inconvinienceUser').html() + values);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("error : " + jqXHR + ", " + textStatus
								+ ", " + errorThrown);
					}
				});
				$.ajax({
					url : "inconvtop10.do",
					type : "post",
					dataType : "json",
					success : function(data) {
						console.log("success : " + data);

						//object --> string
						var str = JSON.stringify(data);

						//string --> json
						var json = JSON.parse(str);
						var string = "";
						values = "";
						for ( var i in json.ilist) {
							if (json.ilist[i].status == '1') {
								string = "조치전"
							} else if (json.ilist[i].status == '2') {
								string = "조치중"
							} else {
								string = "조치완료"
							}
							;
							values += "<tr onclick='javascript:location.href=\"inconvdetail.do?ino="
									+ json.ilist[i].ino
									+ "\";'><td>"
									+ decodeURIComponent(json.ilist[i].ititle)
											.replace(/\+/gi, " ")
									+ "</td><td>"
									+ json.ilist[i].iwriter
									+ "</td><td>"
									+ string + "</td></tr>";
						}
						// 결과가 10개 미만일 때 빈 행을 추가하여 총 10개의 행
						for (var j = json.ilist.length; j < 10; j++) {
							values += "<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>";
						}

						$('#inconvinienceAdmin').html(
								$('#inconvinienceAdmin').html() + values);
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log("error : " + jqXHR + ", " + textStatus
								+ ", " + errorThrown);
					}
				});
	});//document ready
	//그래프그리기
$(function() {
		// 현재 년도 구하기
		var currentYear = new Date().getFullYear();

		// 그래프 그리기 함수 호출
		drawVisualization(currentYear);

		// 왼쪽 버튼 클릭 시 이벤트 처리
		$("#leftButton").click(function() {
			currentYear -= 1; // 현재 년도에서 1을 빼기
			drawVisualization(currentYear); // 그래프 다시 그리기
		});

		// 오른쪽 버튼 클릭 시 이벤트 처리
		$("#rightButton").click(function() {
			currentYear += 1; // 현재 년도에서 1을 더하기
			drawVisualization(currentYear); // 그래프 다시 그리기
		});

		function drawVisualization(year) {
			$.ajax({
				url : "countUser.do",
				type : "post",
				data : {
					year : year
				},
				dataType : "json",
				success : function(data) {
					var countMap = data.countMap;
					var countSubMap = data.countSubMap;
					var calculateSalesMap = data.salesMap;
					google.charts.load('current', {
						'packages' : [ 'corechart' ]
					});
					google.charts.setOnLoadCallback(function() {
						drawChart(countMap, countSubMap, year);
						drawChart2(calculateSalesMap, year);
					});
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("error : " + jqXHR + ", " + textStatus + ", "
							+ errorThrown);
				}
			});
		}

		function drawChart(countMap, countSubMap, year) {
			var data = google.visualization.arrayToDataTable([
					[ 'Month', '가입자 수', '서비스 이용자 수' ],
					[ '01', parseInt(countMap["01"]),
							parseInt(countSubMap["01"]) ],
					[ '02', parseInt(countMap["02"]),
							parseInt(countSubMap["02"]) ],
					[ '03', parseInt(countMap["03"]),
							parseInt(countSubMap["03"]) ],
					[ '04', parseInt(countMap["04"]),
							parseInt(countSubMap["04"]) ],
					[ '05', parseInt(countMap["05"]),
							parseInt(countSubMap["05"]) ],
					[ '06', parseInt(countMap["06"]),
							parseInt(countSubMap["06"]) ],
					[ '07', parseInt(countMap["07"]),
							parseInt(countSubMap["07"]) ],
					[ '08', parseInt(countMap["08"]),
							parseInt(countSubMap["08"]) ],
					[ '09', parseInt(countMap["09"]),
							parseInt(countSubMap["09"]) ],
					[ '10', parseInt(countMap["10"]),
							parseInt(countSubMap["10"]) ],
					[ '11', parseInt(countMap["11"]),
							parseInt(countSubMap["11"]) ],
					[ '12', parseInt(countMap["12"]),
							parseInt(countSubMap["12"]) ] ]);

			var options = {
				title : year + '년도 월간 이용자수/가입자수 추이',
				vAxis : {
					title : 'Users'
				},
				hAxis : {
					title : 'Month'
				},
				seriesType : 'bars'
			};

			var chart = new google.visualization.ComboChart(document
					.getElementById('chart_div'));
			chart.draw(data, options);
		}
		function drawChart2(calculateSalesMap, year) {
			var data = google.visualization.arrayToDataTable([
					[ 'Month', '매출'],
					[ '01', parseInt(calculateSalesMap["01"])],
					[ '02', parseInt(calculateSalesMap["02"])],
					[ '03', parseInt(calculateSalesMap["03"])],
					[ '04', parseInt(calculateSalesMap["04"])],
					[ '05', parseInt(calculateSalesMap["05"])],
					[ '06', parseInt(calculateSalesMap["06"])],
					[ '07', parseInt(calculateSalesMap["07"])],
					[ '08', parseInt(calculateSalesMap["08"])],
					[ '09', parseInt(calculateSalesMap["09"])],
					[ '10', parseInt(calculateSalesMap["10"]) ],
					[ '11', parseInt(calculateSalesMap["11"]) ],
					[ '12', parseInt(calculateSalesMap["12"])]
						]);

			var options = {
				title : year + '년도 월별 매출',
				vAxis : {
					title : 'Sales'
				},
				hAxis : {
					title : 'Month'
				},
				seriesType : 'bars'
			};

			var chart = new google.visualization.ComboChart(document
					.getElementById('chart_div2'));
			chart.draw(data, options);
		}
	});	
	

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart3);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart3() {

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Topping');
        data.addColumn('number', 'Slices');
        data.addRows([
          ['Mushrooms', 3],
          ['Onions', 1],
          ['Olives', 1],
          ['Zucchini', 1],
          ['Pepperoni', 2]
        ]);

        // Set chart options
        var options = {'title':'How Much Pizza I Ate Last Night',
                       'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div_sale'));
        chart.draw(data, options);
      }