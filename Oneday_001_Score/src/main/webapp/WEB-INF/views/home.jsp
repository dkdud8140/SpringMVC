<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section class="main">
		<div class="btn_box">
			<button class="btn_insert">학생 등록하기</button>
			<button class="btn_insert">성적 등록하기</button>
		</div>
		<table class="main_table">
			<tr class="title">
				<th>학번</th>
				<th>이름</th>
				<th>전공</th>
				<th>학년</th>
				<th>응시과목</th>
				<th>총점</th>
				<th>평균</th>
			</tr>
			<c:forEach var="vDTO" items="${vList}">
				<tr data-seq="${vDTO.v_num}">
					<th>${vDTO.v_num}</th>
					<th>${vDTO.v_name}</th>
					<th>${vDTO.v_dept}</th>
					<th>${vDTO.v_grade}</th>
					<th>${vDTO.v_count}</th>
					<th>${vDTO.v_sum}</th>
					<th>${vDTO.v_avg}</th>
				<tr>
			</c:forEach>
		</table>


	</section>


	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>

<script>
	
	document.addEventListener("click",(e)=>{
		let tagName = e.target.tagName;
		let url = `${rootPath}`;
		
		if(tagName === "TH" ) {
			
			let getSEQ= e.target.closest("TR").dataset.seq;
			location.href="${rootPath}/student/info?num=" + getSEQ;
		}
		
		if(tagName === "BUTTON" ) {
			let text = e.target.textContent;
			
			if(text === "학생 등록하기") {
				location.href="${rootPath}/student/insert";
			}
			if(text === "성적 등록하기") {
				location.href="${rootPath}/score/insert";
			}
		}
		
		
	})


</script>



</html>