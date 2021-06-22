<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section class="main">
		<form class="update_box" method="POST">
			<fieldset>
				<legend>학생정보수정하기</legend>
				<div>
					<label>학번</label> 
					<input name="st_num" id="st_num" placeholder="${stuVO.st_num}" readonly="readonly" value ="${stuVO.st_num}" >
				</div>

				<div>
					<label>이름</label> 
					<input name="st_name" id="st_name" placeholder="${stuVO.st_name}" value ="${stuVO.st_name}" >
				</div>
				<div>
					<label>전공</label> 
					<input name="st_dept" id="st_dept" placeholder="${stuVO.st_dept}" value="${stuVO.st_dept}">
				</div>
				<div>
					<label>학년</label> 
					<input name="st_grade" id="st_grade"	placeholder="${stuVO.st_grade}" value="${stuVO.st_grade}">
				</div>
				<div>
					<label>전화번호</label> 
					<input name="st_tel" id="st_tel" placeholder="${stuVO.st_tel}" value="${stuVO.st_tel}">
				</div>
				<div>
					<label>주소</label> 
					<input name="st_addr" id="st_addr" placeholder="${stuVO.st_addr}" value ="${stuVO.st_addr}">
				</div>
				
				<div class="btn_box" data-seq="${stuVO.st_num}">
					<button class="btn_insert">수정하기</button>
					<button class="btn_insert" type="reset">리셋하기</button>
					<button class="btn_insert" id ="delete"><span>삭제하기</span></button>
					<button class="btn_insert">돌아가기</button>
				</div>

			</fieldset>
		</form>

	</section>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>


<script>
	
	document.addEventListener("click",(e)=>{
		let tagName = e.target.id;
		let url = `${rootPath}`;
		
		if(tagName === "#delete" ) {
			let text = e.target.textContent;
			alert(text);
			
			if(text === "삭제하기") {
				alert(getSEQ);
				location.href="${rootPath}/student/delete;
			}
		}
		
		
	})


</script>










</html>