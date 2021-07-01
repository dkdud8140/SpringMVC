<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<c:forEach items="${NEWS_LIST}" var="NEWS">
		
		<div class = "content">
			<div>
				<p class="title"><a href="${NEWS.link}" target="_NEW">${NEWS.title}</a></p>
				<p class="originallink	">${NEWS.originallink}</p>
				<p class="link">${NEWS.link}</p>
				<p class="description">${NEWS.description}</p>
				<p class="pubDate">${NEWS.pubDate}</p>
				<button class="insert">내 기사 등록</button>
			</div>	
		</div>
	
	</c:forEach>