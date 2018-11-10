<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="../css/bootstrap.min.css" rel="stylesheet">

<link href="../css/sub.css" rel="stylesheet">

</head>
<body>
	<div class="top-head left">
		<div class="row">
			<div class="col-md-6 col-lg-4">
				<div onclick="location.href='../mainView/JmtMain.jsp'" style="cursor:pointer">
					<h1>#JMT<br> 판교 맛따라 멋따라</h1><br><br><br>
				</div>
				<h2>나의 즐겨찾기 보기</h2>
			</div>
		</div>
	</div>

	<!-- 내가 즐겨찾기한 음식점 보여주기 -->

		<div class="row" style="padding-left:50px;padding-top:300px">
			<div class="column">
				<img src="../img/media-10.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-5.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-3.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-8.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-2.jpg" class="bestFiveImg">
			</div>
		</div>
		
		<div class="row">
			<div class="column">
				<input type="text" size=15 class="bestFiveResName">
			</div>
			<div class="column">
				<input type="text" size=15 class="bestFiveResName">
			</div>
			<div class="column">
				<input type="text" size=15 class="bestFiveResName">
			</div>
			<div class="column">
				<input type="text" size=15 class="bestFiveResName">
			</div>
			<div class="column">
				<input type="text" size=15 class="bestFiveResName">
			</div>
		</div>
		
		<br><br><br>
	<footer style="background-color:black">
		<div class="row" >
			<div class="col-lg-4 col-md-12">
				<h6 class="heading-footer">ABOUT US</h6>
				<p>Lorem Ipsum is simply dummy text of the printing and
					typesetting industry. Lorem Ipsum has been the industry's standard
					dummy text ever since the 1500s, when an unknown printer took a
					galley.</p>
				<p>
					<i class="fa fa-phone"></i> <span>Call Us :</span> +91 9999 878 398
				</p>
				<p>
					<i class="fa fa-envelope"></i> <span>Send Email :</span>
					info@webenlance.com
				</p>
			</div>
			<div class="col-lg-2 col-md-4">
				<h6 class="heading-footer">QUICK LINKS</h6>
				<ul class="footer-ul">
					<li><a href="#"> Career</a></li>
					<li><a href="#"> Privacy Policy</a></li>
					<li><a href="#"> Terms & Conditions</a></li>
					<li><a href="#"> Client Gateway</a></li>
					<li><a href="#"> Ranking</a></li>
					<li><a href="#"> Case Studies</a></li>
				</ul>
			</div>
			<div class="col-lg-4 col-md-4">
				<h6 class="heading-footer">LATEST NEWS</h6>
				<div class="post">
					<p>
						Key Republicans sign letter warning against candidate<span>August
							3,2015</span>
					</p>
					<p>
						Obamacare Appears to Be Making People Healthie <span>August
							3,2015</span>
					</p>
					<p>
						Syria war: Why the battle for Aleppo matters<span>August
							3,2015</span>
					</p>
				</div>
			</div>
			<div class="col-lg-2 col-md-4 social-icons">
				<h6 class="heading-footer">FOLLOW</h6>
				<ul class="footer-ul">
					<li><a href="#"><i class=" fa fa-facebook"></i> Facebook</a></li>
					<li><a href="#"><i class=" fa fa-twitter"></i> Twitter</a></li>
					<li><a href="#"><i class=" fa fa-google-plus"></i> Google+</a></li>
					<li><a href="#"><i class=" fa fa-linkedin"></i> Linkedin</a></li>
				</ul>
			</div>
		</div>
	</footer>
		
</body>
</html>