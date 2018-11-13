<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="small-top">
	<div class="container">
		<div class="col-lg-4 date-sec hidden-sm-down">
			<h5>#JMT</h5>
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
			<ul class="nav navbar-nav ">
				<li style="padding-top: 10px"><input type="radio"
					name="subMenuCheck" value="sumnail" checked> 썸네일로 보기 <input
					type="radio" name="subMenuCheck" value="map"> 지도로 보기</li>
				<li class="nav-item"><a class="nav-link" href="#">한식</a></li>
				<li class="nav-item"><a class="nav-link" href="#">중식</a></li>
				<li class="nav-item"><a class="nav-link" href="#">일식/수산물</a></li>
				<li class="nav-item"><a class="nav-link" href="#">패스트푸드</a></li>
				<li class="nav-item"><a class="nav-link" href="#">분식</a></li>
				<li class="nav-item"><a class="nav-link" href="#">양식</a></li>
				<li class="nav-item"><a class="nav-link" href="#">뷔페/퓨전음식</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${path}/subView/favorite.jsp"><img src="${path}/img/favorite.png"
						id="favoriteImg">즐겨찾기</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${path}/memberView/myPage.jsp">마이페이지</a></li>
			</ul>
		</div>
	</div>
</div>
<style>
body > header > div.small-top > div > div > h5{
	margin:0;
}
</style>