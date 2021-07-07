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

	<c:forEach
		items="${GALLERYS}"
		var="GALLERY">
		
		<div id="list_box_inner">
			<div>
				<h2>
					<a href="${rootPath}/gallery/detail/${GALLERY.g_seq}">${GALLERY.g_subject}</a>
				</h2>
				
				<img src="static/profile-picture.png"><p>${GALLERY.g_writer}</p>
				
			</div>
			
			<div>
				<img src="${rootPath}/files/${GALLERY.g_image}" width="100px">
			</div>
			
			<div>
				<p>${GALLERY.g_content}</p>
			</div>
		</div>
	</c:forEach>

</div>

