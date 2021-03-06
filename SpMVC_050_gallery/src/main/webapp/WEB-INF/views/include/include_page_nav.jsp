<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />

<style>
	section.page_box {
		width: 80%;
		margin: 10px auto;
		display: flex;
		justify-content: center;
		align-content: center;
	}
	
	section.page_box ul{
		width : 80%;
		display: flex;
		list-style: none;
	}
	
	section.page_box li{
		display: inline-block;
		width: 30px;
		height: 30px;
		border: 1px solid #DEE2E6;
		line-height: 1.25;
		text-align : center;
		color : #007BFF;
		background-color : #fff;
		
		cursor: pointer;
		white-space: nowrap;
	}
	
	section.page_box li:hover{
		color: #0056B3;
		background-color: #E9ECEF;
		border-color: #E9ECEF;
	}
	
	section.page_box li.active{
		color: #fff;
		background-color: #007BFF;
		border-color: #007BFF;
	}
	
	
</style>


<section class= "page_box">
	<ul class="page_nav_main">
	<li data-num="1">처음</li>
		<li data-num="${PAGE_NUM -1 }">&lt;</li>
		<c:forEach begin="1" end="10" var ="pageNum">
			<li data-num="${pageNum}"
			class = "<c:if test="${PAGE_NUM == pageNum}">active</c:if>"
			>${pageNum}</li>
		</c:forEach>
		<li data-num="${PAGE_NUM +1 }">&gt;</li>
		<li data-num="99">|&gt;</li>
	</ul>
</section>


<script type="text/javascript">
	const page_nav_main = document.querySelector("ul.page_nav_main")
	
	if(page_nav_main) {
		page_nav_main.addEventListener("click",(e)=>{
			const li = e.target
			
			if(li.tagName === "LI") {
				const pageNum = e.target.dataset.num
				location.href="${rootPath}/gallery?pageNum=" + pageNum
			}
			
		})
	}
</script>

