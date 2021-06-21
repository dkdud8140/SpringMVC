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
				<legend>성적 정보 입력하기</legend>
				<div>
					<label>학번</label> 
					<input name="sc_stnum" id="sc_stnum" >
				</div>
				<div>
					<label for ="sc_subject">과목명</label> 
					<select name="sc_subject" id="sc_subject" >
						<option selected>과목명</option>
						<option>컴퓨터언어</option>
						<option>생활영어</option>
						<option>미디어의이해</option>
						<option>일본어회화2</option>
					</select>
				</div>
				<div>
					<label>점수</label> 
					<input name="sc_score" id="sc_score">
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