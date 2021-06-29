<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Hompage</title>
<style>
<style>
* {
   box-sizing: border-box;
   margin: 0;
   padding: 0;
}


p b {
	color: blue;
}

section.content_box {
   border: 1px solid purple;
   padding: 12px 16px;
   display: flex;
   flex-wrap: wrap;
}

section.content_box div.content {
   border: 1px solid blue;
   margin: 5px auto;
   display: flex;
   width : 30%;
   height : 30vh;
   overflow: auto;
   
}

section.content_box div.content img {
   flex: 1;
   width: 30%;
   height: 80%;
}

section.content_box div.content div {
   flex: 2;
   margin: 5px;
}

@media(min-width:1200px) {
	section.content_box div.content {
		width: 20%;
		margin: 5px;
	}
}


@media(max-width:700px) {
	section.content_box div.content {
		width: 95%;
	}
}



a {
	text-decoration: none;
}

a:hover {
	color: gray;
}

nav#main_nav {
	background-color: green;
	display: flex;
	justify-content: center;
	align-content: center;
}

nav#main_nav form{
	margin: 0.6rem;
	width: 50%; 
}

nav#main_nav input{
	padding: 8px;
	border: 0;
	outline: 0;
	width: 100%;
	border-radius: 10px;
}



</style>


</head>
<body>
	
	<nav id="main_nav">
		<form>
			<input name = "search" placeholder="도서명입력 후 엔터">
		</form>
	</nav>


	<section class="content_box">
	
	<c:forEach items="${BOOKS}" var="BOOK">
		
		<div class = "content">
			<img src="${BOOK.image}">
			<div>
				<p class="title"><a href="${BOOK.link}" target="_NEW">${BOOK.title}</a></p>
				<p class="desc">${BOOK.description}</p>
				<p class="author"><strong>저자 : </strong>${BOOK.author}</p>
				<p class="publisher"><strong>출판사 : </strong>${BOOK.publisher}</p>
				
				<button class="insert">내 서재 등록</button>
				
			</div>	
		</div>
	
	</c:forEach>
	</section>
	
</body>
</html>