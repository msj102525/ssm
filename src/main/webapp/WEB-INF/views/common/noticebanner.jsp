<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>공지사항 롤링</title>
  <script src="/ssm/resources/js/jquery-3.7.0.min.js"></script>
  <script>
  $(function(){
	  $(function()
			  {
			      var ticker = function()
			      {
			          setTimeout(function(){
			              $('#ticker li:first').animate( {marginTop: '-20px'}, 400, function()
			              {
			                  $(this).detach().appendTo('ul#ticker').removeAttr('style');
			              });
			              ticker();
			          }, 3000);
			      };
			      ticker();
			  });
  });
  </script>
  <style>
 .block {border:2px solid orange; padding:0 5px; height:20px; overflow:hidden; background:#fff; width:400px; font-family:Gulim; font-size:12px;
 text-align: center;margin: 0 auto;}
.block ul, .block li 
{margin:0; padding:0; list-style:none;}
.block li a {display:block; height:20px; line-height:20px; color:#555; text-decoration:none;}
  </style>
</head>
<body>
<div class="block">
    <ul id="ticker">
    </ul>
</div>
<script>
$(function(){
	//중요도 높은 공지사항 5개 롤링
	$.ajax({
		url: "ntop5.do",
		type: "post",
		dataType: "json",
		success: function(data){
			console.log("success : " + data);
			//object --> string
			var str = JSON.stringify(data);
			//string --> json
			var json = JSON.parse(str);
			values = "";			
			for(var i in json.nlist){
			values += "<li><a href='ndetail.do?nno=" + json.nlist[i].noticeNo+"'> 사장님들께 알립니다 ! "
					+ decodeURIComponent(json.nlist[i].noticeTitle).replace(/\+/gi, " ")
					+"</a></li>"}
			$('#ticker').html(values);
		},
		error: function(jqXHR, textStatus, errorThrown){
			console.log("error : " + jqXHR + ", " + textStatus + ", " + errorThrown);
		}
	});
});
</script>
</body>
</html>

 