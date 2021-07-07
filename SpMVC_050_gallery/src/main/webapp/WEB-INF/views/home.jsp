<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 홈페이지</title>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Otomanopee+One&display=swap');
	@import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&family=Nanum+Gothic&display=swap');	
		
	*, body {
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
	
	a {
		text-decoration: none;
		color: inherit;
		cursor: pointer;
	}
	
	body {
		background-color: #eee;
	}
	
	
	header {
		background-color: white;
		border: 0.5px solid #ccc;
		display: flex;
		align-content: center;
	}
	
	header div#header_box {
		width : 40%;
		font-family: 'Otomanopee One', sans-serif;
		display: flex;
		margin: 0 auto;
		padding: 8px;
	}
	
	
	div#body_box {
		width: 40%;
		margin: 0 auto;
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	
	
	
	div.input_service_btn {
		margin-top: 20px;
	}

	div.input_service_btn a {
		font-weight: 500;
		font-size : 12px;
		background-color: white;
		padding: 10px;
		border-radius: 5px;
	}




	div#list_box {
		width: 100%;
		font-family: 'Gamja Flower', cursive;
	}
	
	div#list_box_inner{
		width: 100%;
		background-color: white;
		border: 0.5px solid #ccc;
		margin: 30px 0;
	}
	
	div#list_box_inner img {
		width: 100%;
	}
	
	
	div#list_box_inner div:nth-child(1) {
		padding: 10px;
		display: flex;
		width:100%; 
	}

	
	div#list_box_inner div:nth-child(1) h2 {
		display: inline-block;
		width: 60%;
	}
	
	div#list_box_inner div:nth-child(1) img {
		display: inline-block;
		margin-left: auto;
		width: 30px;
		height : 30px;
		border-radius: 50%;
		margin-right: 5px;
	}
	
	div#list_box_inner div:nth-child(1) p {
		display: inline-block;
		text-align: right;
		margin: auto 0;
	}
	
	div#list_box_inner div:nth-child(2) {
		width: 100%;
		height: 400px;
		overflow: hidden;
		padding: 0;
	}
	
	div#list_box_inner div:nth-child(3) {
		padding: 10px 25px;
		font-size: 20px;
	}
	
	
	
	
	div#input_box, div#gallery_box {
		width: 80%;
		margin: auto;
	}
	
	div#input_box form, div#gallery_box div#gallery_info {
		margin-top: 50px;
		width: 100%;
	}
	
	div#input_box form div, div#gallery_box div#gallery_info div {
		margin: 15px auto;
		width: 100%;
	}
	
	div#input_box form label,div#gallery_info div label {
		display:inline-block;
		width: 20%;
	}
	
	div#input_box form input ,div#input_box form textarea,
	div#gallery_info div p {
		display:inline-block;
		width: 75%;
		padding: 8px;
		border: none;
	}
	
	div#input_box form textarea {
		height: 150px;
	}
	
	
	div#input_box form input:active , div#input_box form textarea:active,
	div#input_box form input:focus , div#input_box form textarea:focus  {
		border: 1px solid #88D7D7;
		outline: none;
	}
	
	
	div#input_box form button, div#to_list button {
		padding: 5px 20px;
		background-color: #88D7D7;
		border: none;
		outline: none;
		cursor: pointer;
		display : flex;
		margin-left: auto;
		margin-right: 5%;
	}
	
	div#gallery_info div p {
		background-color: white;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	div#gallery_files{
		display: flex;
		flex-wrap: wrap;
	}
	div#gallery_files img {
		margin: 2px;
	}
	
	
</style>



</head>
<body>


<header>
	<div id="header_box">
		<a href="${rootPath}" ><h3>AY's Gallery</h3></a>
	</div>
</header>

<div id = body_box>
	<c:choose>
		<c:when test="${BODY eq 'GA-INPUT'}">
			<%@ include file="/WEB-INF/views/gallery/input.jsp" %>
		</c:when>
		
		<c:when test="${BODY eq 'GA-LIST'}">
			<div class = "input_service_btn">
				<a href="${rootPath}/gallery/input">이미지 등록</a>
			</div>
			
			<%@ include file="/WEB-INF/views/gallery/list.jsp" %>
		</c:when>
		
		
		<c:when test="${BODY eq 'GA-DETAIL'}">
			<%@ include file="/WEB-INF/views/gallery/detail.jsp" %>
		</c:when>
		
		
		<c:otherwise>
			<div class = "input_service_btn">
				<a href="${rootPath}/gallery/input">이미지 등록</a>
			</div>
		</c:otherwise>
		
		
	</c:choose>
	
	<c:forEach items="${FILES}" var="FILE">
		<a href="${rootPath}/files/${FILE}" target="_NEW">
		<img 
			src="${rootPath}/files/${FILE}" 
			width="100px" height="100px"/>
		</a>
	</c:forEach>

</div>


</body>
</html>