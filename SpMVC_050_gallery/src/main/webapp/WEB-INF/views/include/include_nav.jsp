<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

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