<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>first</title>
<style>
body{
   /*  background-color:#f5f6f7;  */  
}

h1 {
    text-align: center;
    padding: 10px 10px;
    padding-bottom: 30px;
    border-bottom:1px solid #848484;
}

.form-0 {
    position: relative;
}

.board-top {
    width : 80%;
    height: 50px;
    margin: 0 auto;
    max-width: 100%;
}

hr{
    width: 100%;
}

.form-1 {
    display: flex;
    flex-direction: column;
    width: 1200px;
    margin: 0 auto;
}

.write-1 { 
    height: 50px;
    border : none;
    font-size: 40px;
    background-color: #f5f6f7;
    outline: none;
}

.write-2 {
    margin-top: 30px;
    font-size: 15px;
    border: none;
    background-color: #f5f6f7;
    outline: none;
}

.write-3 {
    margin-top: 10px;
}

.write-4 {
    margin-top: 10px;

    width: 70px;
    height: 30px;
    border: none;
    background-color: rgb(250, 180, 49);
    Cursor:pointer;
}

.write-5 {
    position: absolute;
    bottom: 0;
    left: 200px;
    width: 70px;
    height: 30px;
    border: none;
    background-color: rgb(250, 180, 49);
    Cursor:pointer;
}

/*문의 게시판 id랑 pw css class 입니다.*/

.inqu-write {
    display: flex;
}

.write-3-1 {
    width: 100px;
    height: 30px;

    margin-right: 10px;
}
.write-3-2 {
    width: 100px;
    height: 30px;
}
</style>
</head>
<body>
 <h1>공지사항 작성</h1>
        <div class='form-0'>

            <form class='form-1' action="#" method="POST"  enctype="multipart/form-data">
                <input class='write-1' type="text" name="noticeTitle" maxlegth="44" placeholder="제목 입력, 최대 44자까지 가능합니다" required>
                <hr>
                <textarea class='write-2' name="noticeContent" rows="20" cols="20" maxlength="254" placeholder="내용 작성,최대 254자 가능합니다" required></textarea>
                <input class='write-3' type="file" name="file" id="fileToUpload">

                <hr>
			<input class="write-4" onclick="javascript:location.href='${pageContext.servletContext.contextPath}/nwrite.do?page=1;">올리기</input>
            </form>
	<c:url var="lb" value="nlist.do">
		<c:param name="page"  value="${page}"/>
	</c:url>
	<button class="listbtn" onclick="javascript:location.href='${pageContext.servletContext.contextPath}/${lb}';">목록</button>
	${page}${page}${page}${page}${page}asfs


        </div>

<%-- <h1 align="center">게시 원글 등록 페이지</h1>
<br>

<!-- form 에서 입력값들과 파일을 함께 전송하려면 반드시 속성 추가해야 함 :  
	enctype="multipart/form-data"
	파일을 첨부해서 보낼 때는 POST
-->
<form action="ninsert.do" method="get" >
<table align="center" width="500" border="1" cellspacing="0" cellpadding="5">
	<tr>
		<th>제 목</th>
		<td><input type="text" name="noticeTitle" size="50"></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><input type="text" name="writer" readonly value="#"></td>
	</tr>
	<tr>
		<th>중요도</th>
		<td><input type="checkbox" name="importancy"></td>
	</tr>
	<tr>
		<th>내 용</th>
		<td><textarea rows="5" cols="50" name="noticeContent"></textarea></td>
	</tr>
	<tr>
		<c:url var="nl" value="nlist.do">
				<c:param name="page" value="1"/>
		</c:url>
	
		<th colspan="2">
			<input type="submit" value="등록하기"> &nbsp; 
			<input type="reset" value="작성취소"> &nbsp;
			<input type="button" value="목록" 
			onclick="javascript:location.href='${nl}'; return false;">
		</th>		
	</tr>
</table>
</form> --%>
<br>

<hr>
<c:import url="/WEB-INF/views/common/footer.jsp" />
</body>
</html>












