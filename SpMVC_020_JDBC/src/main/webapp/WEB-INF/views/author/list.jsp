<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>
<style>
button.btn_book_insert {
	background-color: black;
	color: white;
}
</style>


<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf"%>
	<h1 class="page_title">저자정보</h1>
	<section class="main_sec">
		<div class="list_table_box">
			<table>
				<tr>
					<th>저자코드</th>
					<th>저자명</th>
					<th>저자연락처</th>
					<th>저자주소</th>
					<th>주요장르</th>
				</tr>
				
				
				<c:choose>
					<c:when test="${empty AUTHORS}">
						<tr><td colspan="5">No-data</td></tr>
					</c:when>
					
					<c:otherwise>
						<c:forEach items="${AUTHORS}" var="AUTH" varStatus="seq">
						<tr>
							<td>${AUTH.au_code}</td>
							<td>${AUTH.au_name}</td>
							<td>${AUTH.au_tel}</td>
							<td>${AUTH.au_addr}</td>
							<td>${AUTH.au_genre}</td>
						</tr>		
						</c:forEach>			
					</c:otherwise>
				</c:choose>
				
				
				
			</table>

			<div class="btn_box">
				<button class="btn_author_insert">저자정보등록</button>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/include_footer.jspf"%>
</body>
<script>
document.querySelector("button.btn_author_insert").addEventListener("click",()=>{
	location.href="${rootPath}/author/insert"
})
</script>


</html>