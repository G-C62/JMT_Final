<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.top-head{height:300px}
</style>
<header>
	<div class="small-top">
		<div class="container">
			<div class="col-lg-4 date-sec hidden-sm-down">
				<div id="Date"></div>
			</div>
		</div>
	</div>
	<div class="navbar top-nav">
		<div class="container">
			<button class="navbar-toggler hidden-lg-up " type="button"
				data-toggle="collapse" data-target="#exCollapsingNavbar2"
				aria-controls="exCollapsingNavbar2" aria-expanded="false"
				aria-label="Toggle navigation">&#9776;</button>
			<div class="collapse navbar-toggleable-md" id="exCollapsingNavbar2">
				<ul class="nav navbar-nav">
					<li class="nav-item">
						<input type="radio" name="subMenuCheck" value="sumnail" checked> 썸네일로 보기
						<input type="radio" name="subMenuCheck" value="map"> 지도로 보기						
					</li>
					<li class="nav-item"><a class="nav-link" href="#">한식</a></li>
					<li class="nav-item"><a class="nav-link" href="#">중식</a></li>
					<li class="nav-item"><a class="nav-link" href="#">일식/수산물</a></li>
					<li class="nav-item"><a class="nav-link" href="#">패스트푸드</a></li>
					<li class="nav-item"><a class="nav-link" href="#">분식</a></li>
					<li class="nav-item"><a class="nav-link" href="#">양식</a></li>
					<li class="nav-item"><a class="nav-link" href="#">뷔페/퓨전음식</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/subView/favorite.jsp"><img src="${pageContext.request.contextPath}/img/favorite.png" id="favoriteImg">즐겨찾기</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/memberView/myPage.jsp">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</div>
	
		<div class="top-head left">
		<div class="row" style="padding-left:50px;">
			<div class="col-md-6 col-lg-4">
				<div onclick="location.href='${pageContext.request.contextPath}/mainView/JmtMain.jsp'" style="cursor:pointer">
					<h2>#JMT<br> 판교 맛따라 멋따라</h2><br><br><br>
				</div>
				<h1>음식점 상세보기</h1>
			</div>
		</div>
	</div>
	
</header>