<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>



<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf"%>

	<form method="POST">
		<fieldset>
			<legend>출판사정보등록</legend>
			<div>
				<label>출판사명</label> <input name="cp_title" id="cp_title"
					placeholder="">
			</div>
			<div>
				<label>출판사대표</label> <input name="cp_ceo" id="cp_ceo"
					placeholder="">
			</div>
			<div>
				<label>연락처</label> <input name="cp_tel" id="cp_tel"
					placeholder="">
			</div>
			<div>
				<label>주소</label> <input name="cp_addr" id="cp_addr"
					placeholder="">
			</div>
			<div>
				<label>주요장르</label> <input name="cp_genre" id="cp_genre"
					placeholder="">
			</div>

			<div class="btn_box">
				<button type="button" class="btn_comp_insert">도서등록</button>
				<button type="reset" class="btn_comp_new">새로작성</button>
				<button type="button" class="btn_comp_list">List</button>
			</div>

		</fieldset>



	</form>

	<%@ include file="/WEB-INF/views/include/include_footer.jspf"%>
</body>
<script>
document.querySelector("button.btn_comp_insert").addEventListener("click",()=>{
	location.href="${rootPath}/comp/insert"
})
document.querySelector("button.btn_comp_list").addEventListener("click",()=>{
	location.href="${rootPath}/comp/"
})
</script>


</html>