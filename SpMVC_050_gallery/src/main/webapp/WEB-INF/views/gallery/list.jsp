<%@ page
	language="java"
	contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!-- 
<style>
	div.ga_box {
		display: flex;
	}
	div.ga_box div:first-of-type {
		flex:1;
	}
	div.ga_box div:last-of-type {
		flex:3;
	}
</style>
 -->
<div id = "list_box">

	<c:forEach items="${GALLERYS}"	var="GALLERY">
		
		<div id="list_box_inner">
			<div>
				<h2>
					<a href="${rootPath}/gallery/detail2/${GALLERY.g_seq}">${GALLERY.g_subject}(${GALLERY.g_seq})</a>
				</h2>
				
				<img src="static/profile-picture.png"><p>${GALLERY.g_writer}</p>
				
			</div>
			
			<div>
				<c:if test="${ empty GALLERY.g_image }">
					<img src="${rootPath}/files/no_image.png" width="100px">
				</c:if>
				<c:if test="${ not empty GALLERY.g_image }">
					<img src="${rootPath}/files/${GALLERY.g_image}" width="100px">
				</c:if>
			</div>
			
			<div>
				<p>${GALLERY.g_content}</p>
			</div>
		</div>
	</c:forEach>
	
</div>

<%@ include file="/WEB-INF/views/include/include_page_nav.jsp" %>

