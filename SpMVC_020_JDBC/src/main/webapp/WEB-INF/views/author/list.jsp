<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf" %>
<style>
	button.btn_book_insert {
		background-color: black;
		color: white;
	}

</style>


<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf" %>
	<h1 class="page_title">저자정보</h1>
	<div class="list_table_box">
	<table>
		<tr>
			<th>저자명</th>
			<th>저자연락처</th>
			<th>저자주소</th>
			<th>주요장르</th>
		</tr>
		<tr>
			<td>저자명</td>
			<td>저자연락처</td>
			<td>저자주소</td>
			<td>주요장르</td>
		</tr>
	</table>
	
	<div class="btn_box">
		<button class="btn_author_insert">저자정보등록</button>
	</div>
	</div>
	<%@ include file="/WEB-INF/views/include/include_footer.jspf" %>
</body>
<script>
document.querySelector("button.btn_author_insert").addEventListener("click",()=>{
	location.href="${rootPath}/author/insert"
})
</script>


</html>