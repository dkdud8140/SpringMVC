<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/views/include/include_head.jspf"%>

<style>
form#join_form {
	width: 400px;
	padding: 40px;
	background-color: #191919;
	text-align: center;
	margin: 60px auto;
}

form#join_form h2 {
	color: white;
	font-weight: 500;
}

form#join_form input {
	outline: 0;
	display: block;
	width: 200px;
	margin: 20px auto;
	padding: 14px 10px;
	color: white;
	border-radius: 10px;
	background: none;
	border: 2px solid #3498db;
	transition: 0.3s;
}

form#join_form button {
	border: 0;
	outline: 0;
	background: none;
	display: block;
	margin: 20px auto;
	text-align: center;
	border: 1px solid #2ecc71;
	color: white;
	border-radius: 10px;
	cursor: pointer;
}

form#join_form input:focus {
	width: 280px;
	border-color: #2ecc8d;
}

form#join_form button:hover {
	background-color: #2ecc8d;
}
</style>




<body>
	<%@ include file="/WEB-INF/views/include/include_header.jspf"%>
	<section class="main_sec">
		<form id="join_form" method="POST">
			<h2>회원가입</h2>
			<input name="m_username" placeholder="사용자 ID"> <input
				type="password" name="m_password" placeholder="비밀번호"> <input
				type="password" name="m_re_password" placeholder="비밀번호확인">
			<button>가입</button>

		</form>
	</section>

	<%@ include file="/WEB-INF/views/include/include_footer.jspf"%>
</body>


</html>