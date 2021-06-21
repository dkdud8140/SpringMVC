<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<c:set var = "rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section class="main">
		<form class="update_box" method="POST">
			<fieldset>
				<legend>학생정보 입력하기</legend>
				<div>
					<label>이름</label> 
					<input name="st_name" id="st_name" >
				</div>
				<div>
					<label>전공</label> 
					<input name="st_dept" id="st_dept" >
				</div>
				<div>
					<label>학년</label> 
					<input name="st_grde" id="st_grade">
				</div>
				<div>
					<label>전화번호</label> 
					<input name="st_tel" id="st_tel" >
				</div>
				<div>
					<label>주소</label> 
					<input name="st_addr" id="st_addr" >
				</div>
				
				<div class="btn_box">
					<button class="btn_insert">입력하기</button>
					<button class="btn_insert" type="reset">리셋하기</button>
					<button class="btn_insert">돌아가기</button>
				</div>

			</fieldset>
		</form>

	</section>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>
</html>