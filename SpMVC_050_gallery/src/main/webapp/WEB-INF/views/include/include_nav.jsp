<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<style>
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
	
	nav#main_nav {
		display: flex;
		margin-left: auto;
	}
	
	nav#main_nav li{	
		list-style: none;
		display: inline-block;	
		padding : 5px;
		font-size: 13px;
		color: #ccc;
	}
	
	nav#main_nav li:hover {
		color: black;
		cursor: pointer;
	}
	
	
	nav#main_nav li:first-child {
		font-family: 'Nanum Gothic', sans-serif;
	}
	
	
</style>



<header>
	<div id="header_box">
		<a href="${rootPath}" ><h3>AY's Gallery</h3></a>
		<nav id="main_nav" >
			<ul>
				<li id="home">HOME</li>
				
				<c:if test="${MEMBER.m_level <=6 }">
					<li id="input">이미지등록</li>
				</c:if>
				
				<c:if test="${empty MEMBER}">
					<li id="login">로그인</li>
					<li id="join">회원가입</li>
				</c:if>
				
				<c:if test="${not empty MEMBER}">
					<li>${MEMBER.m_nick}님 환영합니다!</li>
					<li id="logout">로그아웃</li>
					
					<c:if test="${MEMBER.m_level == 0 }">
					</c:if>
					
				</c:if>
			</ul>
		</nav>
	</div>

</header>