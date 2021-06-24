<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
		<table>
			<tr>
				<th>학번</th>
				<th>이름</th>
				<th>과목명</th>
				<th>성적</th>
			</tr>

			<c:choose>
			<c:when test="${empty SDLIST}">
				<tr>
					<td colspan="4">데이터 없음</td>
				</tr>
			</c:when>

			<c:otherwise>
				<c:forEach items="${SDLIST}" var="SD" varStatus="seq">
					<tr>
						<td>${SD.sc_stnum}</td>
						<td>${SD.sc_stname}</td>
						<td>${SD.sc_sbname}</td>
						<td class = "number">${SD.sc_score}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
			
			</c:choose>

		</table>
		
		<div class = "btn_box">
			<button class="score insert">성적등록</button>
			<button class="score student list">학생정보 바로가기</button>
		</div>
