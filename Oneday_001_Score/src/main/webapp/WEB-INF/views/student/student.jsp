<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>


<style>

</style>


<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section class="main">
		<div class="wrap_table">
		 <button class = "btn_insert">학생 등록하기</button>
			<table class="main_table">
				<tr class="title">
					<th>학번</th>
					<th>이름</th>
					<th>전공</th>
					<th>학년</th>
					<th>전화번호</th>
					<th>주소</th>
				</tr>
				<c:forEach items="${stuList}" var="stu" varStatus="index">
					<tr>
						<th>${stu.st_num }</th>
						<th>${stu.st_name }</th>
						<th>${stu.st_dept }</th>
						<th>${stu.st_grade }</th>
						<th>${stu.st_tel }</th>
						<th>${stu.st_addr }</th>
					<tr>
				</c:forEach>
			</table>
			</div>
	</section>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>