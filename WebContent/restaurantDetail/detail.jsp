<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점 상세페이지</title>
<link href="../css/detail.css" rel="stylesheet">
<link href="../css/sub.css" rel="stylesheet">
<link rel="stylesheet" href="../css/main.css">

<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<link href="../css/custom.css" rel="stylesheet">
<link href="../css/responsive-style.css" rel="stylesheet">
<link rel="stylesheet" href="../css/font-awesome.min.css" />
<link href="../css/lightbox.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/loaders.css" />

<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
	$(function(){
		$("#bookmark").click(function(){
			var img1 = document.getElementById('starImg');
			if(img1.src.indexOf('_fill')==-1){ //_fill이라는 단어가 존재하지 않으면 star.png을 보여줌
				img1.src = img1.src.replace('.png','_fill.png');
			}else{
				img1.src = img1.src.replace('_fill.png','.png');
			}
				
		});
	});
</script>
</head>
<body>
<%@include file="top.jsp" %>
<section id=resInfo>
	<div class="resTitle">음식점 이름</div>
	<div id="resContainer">
		<div id="imgContainer">
			<img src="../img/food.JPG" alt="음식이미지" />
		</div>
		<div class="like">
			<div>	
				<span>이번주 따봉 n</span>
			</div>
			<div>
				<div class="smallLike">
					<img src="../img/like.jpg" id="likeImg" style="cursor:pointer"/>
				</div>
				<span>n</span>
			</div>
			<div>
				<div id="bookmark">
						<img src="../img/star.png" id="starImg" style="cursor:pointer"/>
				</div>
			</div>
		</div>
		<div class="textInfo">
			<p>소분류</p>
			<p>도로명주소</p>
		</div>
		<div>
		<input type="button" class="btn btn-default" id="login" value="지도 보기">
		</div>

	</div>


</section>
<%@ include file="review.jsp" %>


	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/core.js"></script>

</body>
</html>