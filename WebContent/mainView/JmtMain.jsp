<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>River Bootstrap 4 Template by Grafreez</title>

<link href="../css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<link href="../css/custom.css" rel="stylesheet">
<link href="../css/responsive-style.css" rel="stylesheet">
<link rel="stylesheet" href="../css/font-awesome.min.css" />
<link href="../css/lightbox.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/loaders.css" />
<link rel="stylesheet" href="../css/main.css">

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
			$('div.modal').load("join.html")
			$('div.modal').modal("show");
		});
 		$("#login").click(function() {
			$('div.modal').load("login.html")
			$('div.modal').modal("show");
		}); 
	});
</script>
</head>

<body>
<%@ include file="top.jsp" %>
	<section id=search>
		<div>
			<h3>한식 추천메뉴</h3>
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
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/core.js"></script>
	
</body>
</html>
