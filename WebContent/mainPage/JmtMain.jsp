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

<!--Bootstrap core CSS-->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
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
	height: 500px;
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
	})
</script>
</head>

<body>
<%@ include file="top.jsp" %>
	<section id=search>
		<div>
			<h3>한식 추천메뉴</h3>
		</div>
		<div class="row">
			<div class="column">
				<img src="../img/media-9.jpg" alt="Mountains"
					style="width: 250px; float: left">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" alt="Snow"
					style="width: 250px; float: left">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" alt="Mountains"
					style="width: 250px; float: left">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" alt="Snow"
					style="width: 250px; float: left">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" alt="Mountains"
					style="width: 250px; float: left">
			</div>
		</div>
	</section>


<%@ include file="footer.jsp" %>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/core.js"></script>
	<script src="../js/lightbox-aplus-jquery.min.js"></script>
	
</body>
</html>
