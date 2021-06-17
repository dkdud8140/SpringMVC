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
			<legend>저자정보등록</legend>
			<div>
				<label>저자명</label> <input name="au_name" id="au_name" placeholder="">
			</div>
			<div>
				<label>저자연락처</label> <input name="au_tel" id="au_tel" placeholder="">
			</div>
			<div>
				<label>저자주소</label> <input name="au_addr" id="au_addr"
					placeholder="">
			</div>
			<div>
				<label>주요장르</label> <input name="au_genre" id="au_genre"
					placeholder="">
			</div>

			<div class="btn_box">
				<button type="button" class="btn_author_insert">저자정보등록</button>
				<button type="reset" class="btn_author_new">새로작성</button>
				<button type="button" class="btn_author_list">List</button>
			</div>

		</fieldset>
	</form>




	<%@ include file="/WEB-INF/views/include/include_footer.jspf"%>
</body>
<script>
document.querySelector("button.btn_author_insert").addEventListener("click",()=>{
	location.href="${rootPath}/author/insert"
})

document.querySelector("button.btn_author_list").addEventListener("click",()=>{
	location.href="${rootPath}/author/"
})


</script>


</html>