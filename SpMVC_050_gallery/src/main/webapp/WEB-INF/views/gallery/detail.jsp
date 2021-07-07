<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" /> 

<div id="gallery_box">

	<div id = "gallery_info">
		<div><label>제목</label><p>${GFLIST[0].g_subject}</p></div>
		<div><label>작성일 </label><p>${GFLIST[0].g_date} </p></div>
		<div><label>작성시각</label><p>${GFLIST[0].g_time} </p></div>
		<div><label>작성자 </label><p>${GFLIST[0].g_writer} </p></div>
		<div><label>내용 </label><p>${GFLIST[0].g_content} </p></div>
	</div>
	
	<div id = "gallery_files">
		<c:forEach items="${GFLIST}" var="FILE">
			<img src ="${rootPath}/files/${FILE.f_upname}" height="100px">
		</c:forEach>
	</div>
	
	<div id = "to_list">
		<a href="${rootPath}/gallery"><button>리스트로</button></a>
	</div>

</div>