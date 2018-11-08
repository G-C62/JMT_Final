<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점 상세페이지</title>
<link href="../css/detail.css" rel="stylesheet">
<link rel="stylesheet" href="../css/font-awesome.min.css" />
<%-- <script src="${pageContext.request.contextPath }/lib/jquery-3.3.1.min.js" /> --%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(function(){
		$("#bookmark").find("a").click(function(){
			$(this).children().attr("src","../img/star_fill.png");
		});
	});
</script>
</head>
<body>
<%@ include file="top.jsp" %>
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
					<img src="../img/like.svg" />
				</div>
				<span>n</span>
			</div>
			<div>
				<div id="bookmark">
					<a href="#" onclick="return false;">
						<img src="../img/star.png"/>
					</a>
				</div>
			</div>
		</div>
		<div class="textInfo">
			<p>소분류</p>
			<p>도로명주소</p>
		</div>
		<div class="map">
			<img />
		</div>
	</div>


</section>
<%@ include file="review.jsp" %>

</body>
</html>