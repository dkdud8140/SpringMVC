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
	<h1 class="page_title">출판사정보</h1>
	<section class="main_sec">
		<div class="list_table_box">
			<table>
				<tr>
					<th>출판사코드</th>
					<th>출판사명</th>
					<th>출판사대표</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>주요장르</th>
				</tr>
				<c:choose>
				
					<c:when test="${empty COMPS}">
						<tr>
							<td colspan="6">데이터가 없음</td>
						</tr>
					</c:when>
					
					<c:otherwise>
						<c:forEach items="${COMPS}" var="COMP" varStatus="seq">
							<tr>
								<td>${COMP.cp_code}</td>
								<td>${COMP.cp_title}</td>
								<td>${COMP.cp_ceo}</td>
								<td>${COMP.cp_tel}</td>
								<td>${COMP.cp_addr}</td>
								<td>${COMP.cp_genre}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					
				</c:choose>

			</table>

			<div class="btn_box">
				<button class="btn_comp_insert">출판사등록</button>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/include_footer.jspf"%>
</body>
<script>
document.querySelector("button.btn_comp_insert").addEventListener("click",()=>{
	location.href="${rootPath}/comp/insert"
})
</script>


</html>