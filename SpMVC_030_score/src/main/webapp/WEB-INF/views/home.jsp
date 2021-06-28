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
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body, html {
	width: 100vw;
	height: 100vh;
	display: flex;
	flex-direction: column;
	overflow: auto;
}

header {
	background: linear-gradient(to right, red, orange, yellow, green, blue, navy, purple);
	background-size: 100% 100%;
	background-position: top;
	background-attachment: fixed;
	text-align: center;
	color: white;
	text-shadow: 2px 2px 2px black;
	padding: 3rem;
}

nav {
	background-color: black;
	color:white;
	width:100wv;
}

nav.fixed {
	position : fixed;
	top: 0;
	left: 0;
	right: 10px;
	border-bottom-right-radius: 20px;
	box-shadow: 3px 3px 3px rgba(0,0,0,0.5);
}

nav ul {
	list-style: none;
	display : flex;
	margin : 0 20px;
}

nav li {
	padding : 16px 12px;
	border-bottom: 3px solid transparent;
	transition:0.3s;
}

nav li:hover {
	border-bottom: 3px solid yellow;
	cursor: pointer;
}

nav li:nth-of-type(2) {
	margin-left : auto; 
}




section#main_sec {
	flex: 1;
	width: 100vw;
	display: flex;
	flex-direction: column;
	background: linear-gradient(to right, red, orange, yellow, green, blue, navy, purple);
	
	background-size: 100% 100%;
	background-position: top;
	background-attachment: fixed;
}
.box01{
        width: 100%;
        height: 100vh; 
        position: relative;
        }


.box01::before{
        content: "";
       background: url("${rootPath}/static/images/n.jpg") no-repeat ;
       background-size : 100% 100% ;
        background-size: cover;
        opacity: 0.5;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
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
	background-color: navy;
	color: white;
}

button.home {
	background-color: #F9CE00;
	color: black;
}

button.save {
	background-color: #1E9600;
	color: white;
}

button.reset {
	background-color: #FFF200;
	color: #1E9600;
}

button.list {
	background-color: #FF0000;
	color: white;
}

button.update {
	background-color: blue;
	color: white;
}

button.delete {
	background-color: red;
	color: yellow;
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
	color: white;
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
	padding: 0.7rem;
}

input:hover {
	background-color: #FDFDEB;
}

form label, form input {
	display: inline-block;
	margin: 5px;
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
</style>


</head>
<body>
	<header>
		<h1>대한고교 성적입력 시스템</h1>
		<p>대한고교 성적처리 시스템 2021.</p>
	</header>
	
	<nav id="main_nav">
		<ul>
			<li>HOME</li>
			<li>로그인</li>
			<li>로그아웃</li>
			<li>관리자</li>
		</ul>
	</nav>
	
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

			<c:when test="${BODY =='STUDENT_DETAIL'}">
				<%@ include file="/WEB-INF/views/student/detail.jsp"%>
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

	let std_list = document.querySelector("button.list");
	let std_insert = document.querySelector("button.insert");
	let home = document.querySelector("button.home");
	
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
	
	let table = document.querySelector("table.detail")
	
	if(table) {
	
		table.addEventListener("click",(e)=>{
			let target = e.target
			let tagName = target.tagName
			
			if(tagName==="TD") {
				let tr = target.closest("TR")
				let stNum = tr.dataset.stnum
				
				location.href = "${rootPath}/student/detail?st_num="+stNum
			}
		})
	}

	let main_nav = document.querySelector("nav#main_nav");
	let main_header =document.querySelector("header");
	
	// header box의 높이가 얼마냐
	let main_header_height = main_header.offsetHeight;
	
	// HTML 문저 전체의 크기, 좌표 등을 추출하기
	document.addEventListener("scroll",()=>{
		let doc_bound = document.querySelector("HTML").getBoundingClientRect();
	})
	
	

</script>
</html>