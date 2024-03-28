<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 페이지 표시에 사용 될 값들을 변수 선언 -->
<c:set var="currentPage" value="${ requestScope.paging.currentPage }" />
<c:set var="urlMapping" value="${ requestScope.paging.urlMapping }" />
<c:set var="startPage" value="${ requestScope.paging.startPage }" />
<c:set var="endPage" value="${ requestScope.paging.endPage }" />
<c:set var="maxPage" value="${ requestScope.paging.maxPage }" />

<c:set var="action" value="${ requestScope.action }" />
<c:set var="keyword" value="${ requestScope.keyword }" />
<c:set var="begin" value="${ requestScope.begin }" />
<c:set var="end" value="${ requestScope.end }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%-- 목록 페이징 처리 --%>
<%-- 검색을 안 하는 경우 --%>
<c:if test="${ empty action and empty keyword }">
    <div style="text-align:center;">
        <%-- 맨 처음 페이지 링크 --%>
        <c:if test="${ currentPage eq 1 }">
        	[맨처음] &nbsp;
        </c:if>
        <c:if test="${ currentPage gt 1 }">
        	<a href="/ssm/${urlMapping}?page=1">[맨처음]</a> &nbsp;
        </c:if>
        <%-- 이전 그룹 페이지 링크 --%>
        <c:if test="${ (startPage - 10) ge 1 }">
            <a href="/ssm/${urlMapping}?page=${ startPage - 10 }">[이전그룹]</a> &nbsp;
        </c:if>
        <c:if test="${ startPage - 10 lt 1 }">
            [이전그룹] &nbsp;
        </c:if>

        <%-- 페이지 번호 링크 --%>
        <c:forEach begin="${ startPage }" end="${ endPage }" step="1" var="p">
            <c:choose>
                <c:when test="${ p eq currentPage }">
                    <%-- 현재 페이지는 링크가 아닌 텍스트로 표시 --%>
                    <font color="blue" size="4"><b>${ p }</b></font>
                </c:when>
                <c:otherwise>
                    <%-- 다른 페이지는 링크로 표시 --%>
                    <a href="/ssm/${urlMapping}?page=${ p }">${ p }</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <%-- 다음 그룹 페이지 링크 --%>
        <c:if test="${ startPage + 10 le maxPage }">
            <a href="/ssm/${urlMapping}?page=${ startPage + 10 }">[다음그룹]</a> &nbsp;
        </c:if>
        <c:if test="${ startPage + 10 gt maxPage }">
            [다음그룹] &nbsp;
        </c:if>

        <%-- 맨 마지막 페이지 링크 --%>
        <c:if test="${ currentPage lt maxPage }">
            <a href="/ssm/${urlMapping}?page=${ maxPage }">[맨끝]</a> &nbsp;
        </c:if>
        <c:if test="${ currentPage eq maxPage }">
        	[맨끝] &nbsp;
        </c:if>
    </div>
</c:if>

<%-- 검색(제목, 작성자, 내용) 페이징 처리 --%>
<%-- <% if(action != null && keyword != null){ %> --%>
<c:if test="${ not empty action and not empty keyword  }">
<div style="text-align:center;">
	<%-- <% if(currentPage <= 1){ %> --%>
	<c:if test="${ currentPage eq 1 }">
		[맨처음] &nbsp;
	</c:if>
	<%-- <% }else{ //currentPage > 1 %> --%>
	<c:if test="${ currentPage gt 1 }">
		<a href="/ssm/${ urlMapping }?page=1&action=${ action }&keyword=${ keyword }">[맨처음]</a> &nbsp;
	</c:if>
	<%-- <% } %> --%>
	<%-- 이전 페이지 그룹으로 이동 --%>
	<%-- <% if((currentPage - 10) < startPage && (currentPage - 10) > 1){  //이전그룹이 있다면 %> --%>
	<c:if test="${ (currentPage - 10) le startPage and (currentPage - 10) ge 1 }">
		<a href="/ssm/${ urlMapping }?page=${ startPage - 10 }&action=${ action }&keyword=${ keyword }">[이전그룹]</a> &nbsp;
	</c:if>
	<%-- <% }else{ //이전그룹이 없다면 %> --%>
	<c:if test="${ !((currentPage - 10) le startPage && (currentPage - 10) ge 1) }">
		[이전그룹] &nbsp;
	</c:if>
	<%-- <% } %> --%>
	
	<%-- 현재 페이지가 속한 페이지그룹 숫자 출력 --%>
	<%-- <% for(int p = startPage; p <= endPage; p++){ 
			if(p == currentPage){
	%> --%>
	<c:forEach begin="${ startPage }" end="${ endPage }" step="1" var="p">
		<c:if test="${ p eq currentPage }">
			<font color="blue" size="4"><b>${ p }</b></font>
		</c:if>
	<%-- <%     }else{ %> --%>
		<c:if test="${ p ne currentPage }">
			<a href="/ssm/${ urlMapping }?page=${ p }&action=${ action }&keyword=${ keyword }">${ p }</a>
		</c:if>
	</c:forEach>
	<%-- <% }} %> --%>
	<%-- 다음 페이지 그룹으로 이동 --%>
	<%-- <% if((currentPage + 10) > endPage && (currentPage + 10) < maxPage){  //다음그룹이 있다면 %> --%>
	<c:if test="${ (currentPage + 10) gt endPage and (currentPage + 10) lt maxPage }">
		<a href="/ssm/${ urlMapping }?page=${ startPage + 10 }&action=${ action }&keyword=${ keyword }">[다음그룹]</a> &nbsp;
	</c:if>
	<%-- <% }else{ //다음그룹이 없다면 %> --%>
	<c:if test="${ !((currentPage + 10) gt endPage and (currentPage + 10) lt maxPage) }">
		[다음그룹] &nbsp;
	</c:if>
	<%-- <% } %> --%>
	
	<%-- <% if(currentPage >= maxPage){ %> --%>
	<c:if test="${ currentPage ge maxPage }">
		[맨끝] &nbsp;
	</c:if>
	<%-- <% }else{ //currentPage < maxPage  %> --%>
	<c:if test="${ currentPage lt maxPage }">
		<a href="/ssm/${ urlMapping }?page=${ maxPage }&action=${ action }&keyword=${ keyword }">[맨끝]</a> &nbsp;
	</c:if>
	<%-- <% } %> --%>
</div>
</c:if>
<%-- <% } %> --%>

<%-- 검색(등록날짜) 페이징 처리 --%>
<%-- <% if(action != null && action.equals("date")){ %> --%>
<c:if test="${ not empty action and action eq 'date' or action eq 'enrolldate' }">
<div style="text-align:center;">
	<%-- <% if(currentPage <= 1){ %> --%>
	<c:if test="${ currentPage le 1 }">
		[맨처음] &nbsp;
	</c:if>
	<%-- <% }else{ //currentPage > 1 %> --%>
	<c:if test="${ currentPage gt 1 }">
		<a href="/ssm/${ urlMapping }?page=1&action=${ action }&begin=${ begin }&end=${ end }">[맨처음]</a> &nbsp;
	</c:if>
	<%-- <% } %> --%>
	<%-- 이전 페이지 그룹으로 이동 --%>
	<%-- <% if((currentPage - 10) < startPage && (currentPage - 10) > 1){  //이전그룹이 있다면 %> --%>
	<c:if test="${ (currentPage - 10) lt startPage and (currentPage - 10) gt 1 }">
		<a href="/ssm/${ urlMapping }?page=${ startPage - 10 }&action=${ action }&begin=${ begin }&end=${ end }">[이전그룹]</a> &nbsp;
	</c:if>
	<%-- <% }else{ //이전그룹이 없다면 %> --%>
	<c:if test="${ !((currentPage - 10) lt startPage and (currentPage - 10) gt 1) }">
		[이전그룹] &nbsp;
	</c:if>
	<%-- <% } %> --%>
	
	<%-- 현재 페이지가 속한 페이지그룹 숫자 출력 --%>
	<%-- <% for(int p = startPage; p <= endPage; p++){ 
			if(p == currentPage){
	%> --%>
	<c:forEach begin="${ startPage }" end="${ endPage }" step="1" var="p">
		<c:if test="${ p eq currentPage }">
			<font color="blue" size="4"><b>${ p }</b></font>
		</c:if>
	<%-- <%     }else{ %> --%>
		<c:if test="${ p != currentPage }">
			<a href="/ssm/${ urlMapping }?page=${ p }&action=${ action }&begin=${ begin }&end=${ end }">${ p }</a>
		</c:if>
	</c:forEach>
	<%-- <% }} %> --%>
	
	<%-- 다음 페이지 그룹으로 이동 --%>
	<%-- <% if((currentPage + 10) > endPage && (currentPage + 10) < maxPage){  //다음그룹이 있다면 %> --%>
	<c:if test="${ (currentPage + 10) gt endPage and (currentPage + 10) lt maxPage }">
		<a href="/ssm/${ urlMapping }?page=${ startPage + 10 }">[다음그룹]</a> &nbsp;
	</c:if>
	<%-- <% }else{ //다음그룹이 없다면 %> --%>
	<c:if test="${ !((currentPage + 10) gt endPage and (currentPage + 10) lt maxPage) }">
		[다음그룹] &nbsp;
	</c:if>
	<%-- <% } %> --%>
	
	<%-- <% if(currentPage >= maxPage){ %> --%>
	<c:if test="${ currentPage ge maxPage }">
		[맨끝] &nbsp;
	</c:if>
	<%-- <% }else{ //currentPage < maxPage  %> --%>
	<c:if test="${ currentPage lt maxPage }">
		<a href="/ssm/${ urlMapping }?page=${ maxPage }&action=${ action }&begin=${ begin }&end=${ end }">[맨끝]</a> &nbsp;
	</c:if>
	<%-- <% } %> --%>
</div>
</c:if>
<%-- <% } %> --%>

</body>
</html>