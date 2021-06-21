<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<style>
div.wrap_info_table {
	width: 50%;
	margin: 10px auto 100px auto;
}

table.info_table {
	width: 100%;
	border-collapse: collapse;
	font-weight: lighter;
}

table.info_table tr.title {
	background-color: #F4E4F6;
	cursor: auto;
}

table.info_table tr {
	border-bottom: 1px solid #ddd;
}

.last-tr {
	background-color: #FEFBFD;
}

table.info_table tr th {
	padding: 10px;
}

.btn_update {
	background-color: #DA90AF;
	color: white;
	padding: 5px 8px;
	border-radius: 3px;
	margin-left: auto;
	margin: 5px 5px 5px 85%;
	width: 15%;
	height: 30px;
	overflow: hidden;
	border: none;
}

.btn_update:hover {
	cursor: pointer;
	text-shadow: 1px 1px 1px black;
}


</style>


<body>

	<%@ include file="/WEB-INF/views/include/header.jsp"%>


	<section class="main">
		<div class="wrap_info_table" data-seq ="${stuVO.st_num}"> 
			<table class="info_table" >
				<tr class="title">
					<th>학번</th>
					<th>이름</th>
					<th>전공</th>
					<th>학년</th>
					<th>전화번호</th>
					<th>주소</th>
				</tr>
				<tr>
					<th>${stuVO.st_num}</th>
					<th>${stuVO.st_name}</th>
					<th>${stuVO.st_dept}</th>
					<th>${stuVO.st_grade}</th>
					<th>${stuVO.st_tel}</th>
					<th>${stuVO.st_addr}</th>
				<tr>
			</table>

			<button class="btn_update" >학생정보 수정</button>
		</div>

		<div class="wrap_info_table">
			<table class="info_table">
				<tr class="title">
					<th>No.</th>
					<th>과목명</th>
					<th>점수</th>
				</tr>
				<c:forEach items="${sVoList}" var="sVoList" varStatus="index">
					<tr>
						<th>${index.count}</th>
						<th>${sVoList.sc_subject}</th>
						<th>${sVoList.sc_score}</th>
					</tr>
				</c:forEach>
				<tr class ="last-tr">
					<th></th>
					<th>평균 : ${scoreDTO.avg}</th>
					<th>총점 : ${scoreDTO.sum}</th>
				</tr>


			</table>
			<button class="btn_update">성적정보 수정</button>
		</div>
	</section>



	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>


<script>

	document.addEventListener("click",(e)=>{
	
		let tagName = e.target.tagName;
		let url = `${rootPath}`;
		
		if(tagName === "BUTTON") {
			let text = e.target.textContent;
			let getSEQ= e.target.closest("DIV").dataset.seq;
			
			if(text === "학생정보 수정") {
				
				location.href="${rootPath}/student/update?stnum=" + getSEQ;
			}
		}
		
		
	})
	


</script>




</html>