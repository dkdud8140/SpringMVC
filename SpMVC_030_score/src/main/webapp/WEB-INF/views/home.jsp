<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale:1" />
<title>대한고교 성적입력 시스템</title>
<style>
@font-face {
    font-family: 'LAB디지털';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/LAB디지털.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	 font-family: 'LAB디지털';
}

body, html {
	width: 100vw;
	height: 100vh;
	display: flex;
	flex-direction: column;
	overflow: auto;
}

header {
	background: linear-gradient(to right, #1E9600, #FFF200, #FF0000);
	/*	background: url("${rootPath}/static/images/header_background2.jpg")	no-repeat;*/
	background-size: 100% 100%;
	background-position: top;
	background-attachment: fixed;
	text-align: center;
	color: white;
	text-shadow: 2px 2px 2px black;
	padding: 3rem;
}

section#main_sec {
	flex: 1;
	width: 100vw;
	display: flex;
	flex-direction: column;
	background: linear-gradient(to right, #1E9600, #FFF200, #FF0000);
	background-size: 100% 100%;
	background-position: top;
	background-attachment: fixed;
}

table {
	border: 0;
	width: 90%;
	border-collapse: collapse;
	border-spacing: 0;
	margin: 10px auto;
	align-content: center;
}

tr {
	border-bottom: 1px solid #ccc;
}

td, th {
	padding: 8px;
	text-align: center;
	border-right: 1px solid #ccc;
}

td:last-child, th:last-child {
	border: none;
}

td.number {
	text-align: right;
}

div.btn_box {
	width: 90%;
	/*table의 margin:10 auto로 설정되어 있기 때문에
	top margin은 0으로 bottom margin은 10px 좌우는 auto*/
	margin: 0 auto 10 auto;
	padding: 5px;
	text-align: right;
}

button:hover {
	box-shadow: 2px 2px 2px black;
	cursor: pointer;
}

div.btn_box button {
	border: 0;
	outline: 0;
	padding: 12px 16px;
	margin-left: 10px;
}

button.insert {
	background-color: #09194F;
	color: white;
}

button.list {
	background-color: #ff502f;
	color: white;
}

button.home {
	background-color: #F9CE00;
	color: black;
}


tr:nth-of-type(odd) {
	background-color: #FDFDEB;
}

tr:nth-of-type(even) {
	background-color: white;
}

tr:first-child {
	background-color: #09194F;
	color: #F9CE00;
}

tr:hover {
	background-color: #F9CE00;
	cursor: pointer;
}


h2 {
	width: 90%;
	padding: 1rem;
	color: white ;
	margin: 10px auto 0 auto;
	text-align: center;
}

form {
	width: 90%;
	margin: 0 auto 10px auto;
}

fieldset {
	background-color: white;
	border: 1px solod white;
	border-radius: 10px;
	padding : 0.7rem;
}

form label, form input {
	display: inline-block;
	margin : 5px;
	padding: 8px 16px;
}

form label {
	width: 30%;
	text-align: right;
	color: blue;
	font-weight: bold;
}
form input {
	width: 60%;
	outline: 0;
	border: #aaa;
	border-radius: 50px;
}

form input:hover {
	background-color: #FDFDEB ;
}

form button.save {
	background-color: #1E9600 ;
	color: white;
}

form button.reset {
	background-color: #FFF200;
	color: #1E9600;
}

form button.list {
	background-color: #FF0000;
	color: white;
}


</style>


</head>
<body>
	<header>
		<h1>대한고교 성적입력 시스템</h1>
		<p>대한고교 성적처리 시스템 2021.</p>
	</header>

	<section id="main_sec">
		<c:choose>
		
			<c:when test="${BODY == 'SCORE_VIEW'}">
				<%@ include file="/WEB-INF/views/score/list.jsp"%>
			</c:when>

			<c:when test="${BODY == 'STUDENT_VIEW'}">
				<%@ include file="/WEB-INF/views/student/list.jsp"%>
			</c:when>
			
			<c:when test="${BODY =='STUDENT_INPUT'}">
				<%@ include file="/WEB-INF/views/student/input.jsp"%>
			</c:when>

			<c:otherwise>
				<%@ include file="/WEB-INF/views/main.jsp"%>
			</c:otherwise>

		</c:choose>
	</section>

</body>

<script type="text/javascript">
	
	/*
		JS 코드에서 event를 등록할 때 현재 화면에 없는 DOM 요소에
		addEvent를 설정하면 없는 함수라는 오류가 발생한다
		그 이유는 현재 화면에 없는 DOM 요소를 querySelector하면
		그 결과값이 null이기 때문에 발생하는 문제이다
		
		JS 코드를 통합하여 모음으로 관리할 떄는
		addEvent를 하려고 하는 요소가 있는지를 먼저 검사한 후
		addEvent를 수행해 주어야 한다.
	*/

	let std_list = document.querySelector("button.student.list");
	let std_insert = document.querySelector("button.student.insert");
	let home = document.querySelector("button.student.home");
	
	if(std_list) {
		std_list.addEventListener("click",(e)=>{
			location.href="${rootPath}/student/"		
		})
	}
	
	if(std_insert) {
		std_insert.addEventListener("click",(e)=>{
			location.href="${rootPath}/student/insert"		
		})
	}
	
	if(home) {
		home.addEventListener("click",(e)=>{
			location.href="${rootPath}/"		
		})
	}
	

</script>


</html>