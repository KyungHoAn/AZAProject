<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>과제</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="/webjars/stomp-websocket/stomp.min.js"></script>
<script src="/webjars/sockjs-client/sockjs.min.js"></script>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<!-- <script src="https://kit.fontawesome.com/79647d7f04.js" crossorigin="anonymous"></script> -->
<!-- <script defer src="/resources/javascript/message/asserts/ui.js"></script> -->
<script defer src="/resources/javascript/alert/alertUI.js"></script>
<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
<!-- Load Favicon-->
<link href="assets/img/favicon.ico" rel="shortcut icon"
	type="image/x-icon">
<!-- Load Material Icons from Google Fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Material+Icons|Material+Icons+Outlined|Material+Icons+Two+Tone|Material+Icons+Round|Material+Icons+Sharp"
	rel="stylesheet">
<!-- Load Simple DataTables Stylesheet-->

<!-- Roboto and Roboto Mono fonts from Google Fonts-->
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Roboto+Mono:400,500"
	rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css" rel="stylesheet">
<!-- Load main stylesheet-->



<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/b-print-2.2.3/sl-1.4.0/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.12.1/b-2.2.3/b-colvis-2.2.3/b-html5-2.2.3/b-print-2.2.3/sl-1.4.0/datatables.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Varela+Round&display=swap"
	rel="stylesheet">
<style>
*, body { 
font-family: Pretendard, 'Noto Sans KR';
}
</style>
<link href="/resources/css/styles.css" rel="stylesheet">
<link href="/resources/css/common.css" rel="stylesheet">

<script type="text/javascript">
		
		window.onload = function () { 
			$("#updateBtn").hide();
			$("#lessonNameList").hide();
			
			if(${user.role eq 'teacher'}){
				$("#checkDiv").hide();
			}else if(${user.role eq 'student'}){
				$("#checkDiv").show();
				$("#goUpdateBtn").hide();
				$("#deleteBtn").hide();
			}else{
				$("#checkDiv").hide();
				$("#goUpdateBtn").hide();
				$("#deleteeBtn").hide();
			}
			
			if(${paper.homeworkCheck} == 1){
				$("#homeworkCheck").prop("disabled",true);
			}
		}
		
 		$(function() {
			
			$( "button.btn.btn-outline-primary:contains('수정')").on("click" , function() {
				
				document.getElementById("homeworkTitle").readOnly=false;
				document.getElementById("studentName").readOnly=false;
				document.getElementById("homeworkDueDate").readOnly=false;
				document.getElementById("homeworkContent").readOnly=false;
				
				$("#goUpdateBtn").hide();
				$("#updateBtn").show();
				$("#lessonNameList").show();
				$("#lessonNameListInput").hide();
				
			    const homeworkDueDate = document.getElementById('homeworkDueDate');
			    homeworkDueDate.type = "date";
			});
		});
 		
 		$(function() {
 			
			$( "button.btn.btn-outline-primary:contains('확인')").on("click" , function() {
				$("form").attr("method", "POST").attr("action","/paper/updatePaperHomework").submit();
				$("#lessonNameList").hide();
				$("#lessonNameListInput").show();
			});
 		});
 		
		function deleteBtn() {
			if(window.confirm("정말 삭제하시겠습니까?")){
				if(true){
					$("form").attr("method", "POST").attr("action","/paper/deletePaperHomework").submit();
				}else{
					alert('삭제가 취소되었습니다.');
				}
			}	
		}
		
		function cancelBtn() {
			history.go(-1);
		}
		
		$(document).ready(function(){
		    $("#homeworkCheck").change(function(){
		        if($("#homeworkCheck").is(":checked")){
		            $("#homeworkCheck").prop("disabled",true);
		            $("form").attr("method", "POST").attr("action","/paper/updatePaperHomeworkCheck").submit();
		        }
		    });
		});

</script>

</head>
<body>
	<div class="border border-top-0 p-3 p-sm-5 bg-light">
		<form>
		
			<div class="col flex-shrink-0 mb-5 mb-md-0" style="margin: 10px 0px 10px 0px">
		        <h1 class="display-4 mb-0">과 제 조 회</h1>
		        <div class="text-muted">Homework</div>
	    	</div>
			
			<input type="hidden" name="homeworkCode" id="homeworkCode" value="${paper.homeworkCode }"/>
			
	        <div class="input-group mb-3" style="margin: 20px 0px 20px 0px" id="lessonNameList">
	            <button class="btn btn-outline-primary" type="button" style="width:120px;">수업명</button>
	            <select class="form-select" aria-label="Default select example" id="lessonName" name="lessonName">
	            	<c:set var="i" value="0"/>
	            	<c:forEach var="lesson" items="${list }">
	            	<c:set var="i" value="${i+1 }"/>
	            		<option align="center" value="${lesson.lessonName }">${lesson.lessonName }
	            	</c:forEach>
                </select>
	        </div>
	        
	        <div class="input-group mb-3" style="margin: 20px 0px 20px 0px" id="lessonNameListInput">
	            <button class="btn btn-outline-primary" type="button" style="width:120px;">수업명</button>
                <input class="form-control" type="text" placeholder="" aria-label="Example text with button addon" 
	             id="lessonName" name="lessonName" value="${paper.lessonName}" aria-describedby="button-addon1" readOnly="true">
	        </div>
	        <div class="input-group mb-3">
	            <button class="btn btn-outline-primary" type="button" style="width:120px;">과제 제목</button>
	            <input class="form-control" type="text" placeholder="" aria-label="Example text with button addon" 
	             id="homeworkTitle" name="homeworkTitle" value="${paper.homeworkTitle}" aria-describedby="button-addon1" readOnly="true">
	        </div>
	        <div class="input-group mb-3">
	            <button class="btn btn-outline-primary" type="button" style="width:120px;">학생 이름</button>
	            <input class="form-control" type="text" placeholder="" aria-label="Example text with button addon" 
	            id="studentName" name="studentName" value="${paper.studentName}" aria-describedby="button-addon1" readOnly="true">
	        </div>
	        <div class="input-group mb-3">
	            <button class="btn btn-outline-primary" type="button" style="width:120px;">과제 마감 날짜</button>
	            <input class="form-control" type="text" placeholder="" aria-label="Example text with button addon" 
	            id="homeworkDueDate" name="homeworkDueDate" value="${paper.homeworkDueDate}" aria-describedby="button-addon1" readOnly="true">
	        </div>
	        <div class="mb-0">
	            <button class="btn btn-outline-primary" type="button" style="width:120px; margin:0px 0px 15px 0px;" >과제 내용</button>
	            <textarea class="form-control"  id="homeworkContent" name="homeworkContent" placeholder="과제 내용을 입력하세요" value="${paper.homeworkContent}" rows="12" readonly>${paper.homeworkContent}</textarea>
	        </div>
	         <div id="checkDiv" class="form-check" align="center" style="margin:20px 0px 0px 0px; font-size:20px;" >
                 <input class="form-check-input" id="homeworkCheck" name="homeworkCheck" type="checkbox" value="">
                 <label class="form-check-label" for="flexCheckDefault">과제 완료 체크</label>
            </div>    
		
		</form>
			<br/>	
		    <div align="center">			
			 	 <button id="goUpdateBtn"  class="btn btn-outline-primary">수정</button>
			 	 <button id="updateBtn" class="btn btn-outline-primary">확인</button>
			 	 <button id="deleteBtn" onclick="deleteBtn();" class="btn btn-outline-primary">삭제</button>
			 	 <button id="cancelBtn" onclick="cancelBtn();" class="btn btn-outline-primary">취소</button>
			</div>
	</div>
</body>
</html>