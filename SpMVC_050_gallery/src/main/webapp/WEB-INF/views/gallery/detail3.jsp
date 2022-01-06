<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" /> 

<div id="gallery_box">

<div>
	<c:if test="${empty GALLERY.g_image }">
		<img src = "${rootPath}/files/no_image.png" alt="main_image"/>
	</c:if>	
	<c:if test="${not empty GALLERY.g_image }">
		<img src = "${rootPath}/files/${GALLERY.g_image}" alt="main_image"/>
	</c:if>
</div>

	<div id = "gallery_info">
		<div><label>제목</label><p>${GALLERY.g_subject}</p></div>
		<div><label>SEQ</label><p>${GALLERY.g_seq}</p></div>
		<div><label>작성일 </label><p>${GALLERY.g_date} </p></div>
		<div><label>작성시각</label><p>${GALLERY.g_time} </p></div>
		<div><label>작성자 </label><p>${GALLERY.g_writer} </p></div>
		<div><label>내용 </label><p>${GALLERY.g_content} </p></div>
	</div>
	
	<div id = "gallery_files">
		<c:forEach items="${GALLERY.fileList}" var="FILE">
			<img src ="${rootPath}/files/${FILE.file_upname}" height="100px">
		</c:forEach>
	</div>
	
	<div id = "to_list">
		<a href="${rootPath}/gallery"><button>리스트로</button></a>
		<a href="${rootPath}/gallery"><button class = "gallery update">수정</button></a>
		<a href="${rootPath}/gallery"><button class = "gallery delete">삭제</button></a>
	</div>
	
	
</div>


<script>
	let update_button = document.querySelector("button.gallery.update")
	let delete_button = document.querySelector("button.gallery.delete")

	update_button.addEventListener("click",()=>{
		
		/*
			현재 ${GALLERY.g_seq} 값은 숫자형이다
			
			만약 ${GALLERY.g_seq} 값이 S0001 등과 같은 문자열형이라면
			아래 코드는 JS문법오류가 발생할 것이다.
			location.replace("${rooPath}/gallery/update?g_seq=" + ${GALLERY.g_seq}
			
			현재 작성한 코드는 JSP코드이다
			이 코드는 Response가 될 때 HTML 코드로 변환이 되고
			Script부분도 변환이 되는데
			
			변환되는 과정에서 ${GALLERY.g_seq}는 담겨있는 문자열인 S0001만 단독으로 나타난다 
			위 코드는 "/root-context/gallery/update?g_seq=" + S0001 처럼 변환이 된다
			
			결국 JS 코드가 실행될 때 + S0001처럼 변환되어 변수를 찾게된다
			그리고 S0001이라는 변수가 정의되지 않아 문법오류가 발생한다.
			
			** 
			EL tag를 사용하여 Script 부분에서 직접 값을 부착할 때는 DQ("") 부착하여 문법오류를 방지하자.
					
		*/
		
		alert("일련번호 ${GALLERY.g_seq} 인 게시물 수정")
		location.replace("${rooPath}/gallery/update?g_seq=${GALLERY.g_seq}")
	})
	
	delete_button.addEventListener("click",()=>{
		if(confirm("일련번호 ${GALLERY.g_seq} 인 게시물 삭제 ??")) {
			location.replace("${rooPath}/gallery/delete?g_seq=${GALLERY.g_seq}")
		}	
	})	
</script>

