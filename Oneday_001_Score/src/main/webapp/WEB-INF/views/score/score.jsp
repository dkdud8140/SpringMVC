<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section class="main">
		<div class="wrap_table">
			<button class="btn_insert">점수 등록하기</button>
			<table class="main_table">
				<tr class="title">
					<th>학번</th>
					<th>이름</th>
					<th>컴퓨터언어</th>
					<th>생활영어</th>
					<th>미디어의이해</th>
					<th>일본어회화2</th>
					<th>총점</th>
					<th>평균</th>
				</tr>
				<c:forEach items="${subList}" var="sub" varStatus="index">
					<tr>
						<th>${sub.stnum}</th>
						<th>${sub.stname}</th>
						<th>${sub.sub1}</th>
						<th>${sub.sub2}</th>
						<th>${sub.sub3}</th>
						<th>${sub.sub4}</th>
						<th>${sub.sum}</th>
						<th>${sub.avg}</th>
					<tr>
				</c:forEach>
			</table>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>