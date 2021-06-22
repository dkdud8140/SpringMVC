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
	<h1 class="page_title">도서정보</h1>

	<section class="main_sec">
		<div class="list_table_box">
			<table>
				<tr>
					<th>No.</th>
					<th>ISBN</th>
					<th>도서명</th>
					<th>출판사</th>
					<th>저자</th>
					<th>출판연도</th>
					<th>가격</th>
					<th>페이지수</th>
				</tr>

				<c:choose>
					<c:when test="${empty BOOKS}">
						<tr><td colspan="8">No-data</td></tr>
					</c:when>

					<c:otherwise>
						<c:forEach items="${BOOKS}" var="BOOK" varStatus="ST">
							<tr>
								<td>${ST.index}</td>
								<td>${BOOK.bk_isbn}</td>
								<td>${BOOK.bk_title}</td>
								<td>${BOOK.bk_ccode}</td>
								<td>${BOOK.bk_acode}</td>
								<td>${BOOK.bk_date}</td>
								<td>${BOOK.bk_price}</td>
								<td>${BOOK.bk_pages}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
					
				</c:choose>

			</table>

			<div class="btn_box">
				<button class="btn_book_insert">도서등록</button>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/views/include/include_footer.jspf"%>
</body>
<script>
document.querySelector("button.btn_book_insert").addEventListener("click",()=>{
	location.href="${rootPath}/books/insert"
})
</script>


</html>