<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<link href="static/css/basic.css?ver=002" rel="stylesheet"/>

<style>
@import	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')	;

header {
	background-color: #66CCBD;
	text-align: center;
	align-content: center;
	padding: 1rem;
}

header h2 {
	color: #040B06;
	font-weight: 900;
	letter-spacing: 1px;
}

nav {
	width: 100%;
	background-color: #E8F7F3;
	font-size: 15px;
}

nav ul {
	list-style: none;
	display: flex;
}

nav li {
	padding: 0.5rem;
	cursor: pointer;
}

nav li:hover {
	font-weight: 600;
}

nav li:first-child {
	margin-left: 10px;
}

nav li:last-child {
	margin-left: auto;
	margin-right: 10px;
}
</style>


<head>
<meta charset="UTF-8">
<title>대한고교 성적처리 2021</title>
</head>

<header>
	<h2>대한 고교 성적처리 시스템</h2>
	<p>v.2021_001</p>
</header>
<nav>
	<ul>
		<li>HOME</li>
		<li>학생정보</li>
		<li>성적일람표</li>
		<li>로그인</li>
	</ul>
</nav>

<script>

	document.addEventListener("click", (e)=>{
		
		let url = `${rootPath}`;
		let tagname = e.target.tagName;
		
		if(tagname === "LI") {
			let menutext = e.target.textContent	
			
			if(menutext === "HOME") {
				url += "/";
			} else if(menutext === "학생정보") {
				url += "/student";
			} else if(menutext === "성적일람표") {
				url += "/score";
			} else if(menutext === "로그인") {
				url += "/member/login";
			}
			location.href = url;
		}
		
		
	})

</script>


