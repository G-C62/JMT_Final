<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>River Bootstrap 4 Template by Grafreez</title>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/responsive-style.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<link href="${pageContext.request.contextPath}/css/lightbox.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loaders.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<style type="text/css">
#search {
	height:100%;
	width: 100%
}
.modal-body{background-color:white}
</style>
<script type="text/javascript">
	$(function() {
		$("#popbutton").click(function() {
			$('div.modal').load("join.jsp")
			$('div.modal').modal("show");
		});
 		$("#login").click(function() {
			$('div.modal').load("login.jsp")
			$('div.modal').modal("show");
		});
 		$("#logout").click(function() {
			top.location.href = "${pageContext.request.contextPath}/mainView/logout.jsp";
		});
 		$("#keyWord").keyup(function(){
			if($(this).val()==""){
 				$("#suggest").hide();
 				return;
 			}
			$.ajax({
 				url:"../autoCompleteRestaurant",		//서버주소
 				type:"post",	//요청방식
 				dataType:"json",//서버가 보내준 데이터 타입 text,json,xml,html
 				data:"keyWord="+$(this).val(),	//서버에게 보내는 파라미터 정보
 				success:function(result){	//성공했을 시 함수
 					var str="";
 					$.each(result, function(index, item){
 						console.log(item);
 						str+="<a href='#'>"+item+"</a><br>";
 					})
 					$("#suggest").html(str);
 					$("#suggest").show();	
 				},	
 				error:function(err){
 					console.log(err+" --> 발생함 ");
 				} 	//실패했을 시 함수
 			});
			if($(this).val()==""){
 				$("#suggest").hide();
 				return;
 			}
		});
		$(document).on("click", "a", function(){
 			$("#keyWord").val($(this).text());
 			$("#suggest").hide();
 		});
	});
</script>
</head>

<body>
<%@ include file="mainTop.jsp" %>
	<section id=search>
		<div>
			<h3>한식 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left:50px">
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg" onclick="location.href='../jmt?command=detail&resId=25398530'" style="cursor:pointer">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>
		
		<div>
			<h3>중식 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left:50px">
			<div class="column">
				<img src="../img/media-3.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-10.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-3.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-10.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-3.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>
		
		<div>
			<h3>일식/수산물 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left:50px">
			<div class="column">
				<img src="../img/media-4.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-5.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-4.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-5.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-4.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>
		
		<div>
			<h3>패스트푸드 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left:50px">
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>
		
		<div>
			<h3>분식 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left:50px">
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>
		
		<div>
			<h3>양식 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left:50px">
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>
		
		<div>
			<h3>뷔페/퓨전요리 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left:50px">
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>
		
	</section>


<%@ include file="footer.jsp" %>

	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/core.js"></script>
	
</body>
</html>