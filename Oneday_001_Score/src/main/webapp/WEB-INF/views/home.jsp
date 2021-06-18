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
			<c:forEach items="${vList}" var="VDTO"  varStatus="index">
				<tr>
				<th class = "num">${VDTO.v_num}</th>
				<th>${VDTO.v_name}</th>
				<th>${VDTO.v_dept}</th>
				<th>${VDTO.v_grade}</th>
				<th>${VDTO.v_count}</th>
				<th>${VDTO.v_sum}</th>
				<th>${VDTO.v_avg}</th>
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
		if(tagName === "TD") {
			
			let tr = e.target.closest("TR");
			
			let st_num = tr.num.value;
			
			alert(st_num);
		}
		
	
		
	})


</script>



</html>