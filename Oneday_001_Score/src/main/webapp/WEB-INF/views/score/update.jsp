<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<style>


form.score_update_box{
	width: 50%;
	margin: 20px auto;
}

form.score_update_box fieldset {
	border: 1px solid #20605B;
	border-radius: 10px;
	padding: 20px;
	width: 100%;
}

form.score_update_box legend {
	text-align: center;
	padding: 10px;
	font-size: 20px;
	font-weight: bold;
}


div.score_correct_box {
	width: 100%;
	display: flex;
}


div.sub_box, div.score_box {
	display: inline;
	width: 35%;
}
div.score_correct_box div.btn_box {
	display :inline;
	text-align: left;
	width: 30%;
}


div.sub_box label , div.score_box label {
	display: inline;
	width: 40%;
	text-align: left;
	margin: 5px;
	padding: 10px;
	color: #20605B;
	font-weight: bold;
	
}

div.sub_box input , div.score_box input {
	display: inline;
	width: 60%;
	margin: 5px;
	padding: 10px;
	background-color: #E8F7F3;
	border: none;
}


div.score_correct_box div.btn_box button {
	background-color: #20605B;
	color: white;
	padding: 5px 8px;
	border-radius: 3px;
	width: 45%;
	height : 30px;
	overflow: hidden;
	border: none ;
	display: inline-block;
	margin : 5px;
}


</style>


<body>
	<%@ include file="/WEB-INF/views/include/header.jsp"%>

	<section class="main">
		<form class="score_update_box" id ="score_update" method="POST">
			<fieldset>
				<legend>성적정보수정하기</legend>
				
				<c:forEach items="${SCORES}" var="SC" varStatus="ST"> 
					<div class = "score_correct_box">
						
						<div class = "sub_box">
							<label>과목명</label> 
							<input name="sc_subject" id="sc_subject" value ="${SC.sc_subject}" >
						</div>
		
						<div class ="score_box">
							<label>점수</label> 
							<input name="sc_score" id="sc_score" value ="${SC.sc_score}" >
						</div>
						
						<div class="btn_box" data-seq="${SC.sc_stnum}">
							<button class="btn_insert">수정</button>
							<button class="btn_delete " id ="delete">삭제</button>
						</div>
					
					</div>
				</c:forEach>
				
				
			</fieldset>
		</form>

	</section>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>

</body>


<script>
	
	document.querySelector("form#score_update button.btn_insert").addEventListener("click",(e)=>{
		
		let url = `${rootPath}`;
		let form = document.querySelector("form#score_update");
		
		let sc_stnum = form.querySelector("input#sc_stnum");
		let sc_subject = form.querySelector("input#sc_subject");
		let sc_score = form.querySelector("input#sc_score");
		
	})
	
	document.querySelector("form#student_update button.btn_delete").addEventListener("click",(e)=>{
		let stnum = e.target.closest("div").dataset.seq
		
		let url = `${rootPath}`;
		location.href = url + "/student/delete?stnum=" + stnum;
		
	})
	
	
	

</script>

</html>