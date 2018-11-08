<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<header>
	<div class="small-top">
		<div class="container">
			<div class="col-lg-4 date-sec hidden-sm-down">
				<div id="Date"></div>
			</div>

		</div>
	</div>
	<nav class="navbar top-nav">
		<div class="container">
			<button class="navbar-toggler hidden-lg-up " type="button"
				data-toggle="collapse" data-target="#exCollapsingNavbar2"
				aria-controls="exCollapsingNavbar2" aria-expanded="false"
				aria-label="Toggle navigation">&#9776;</button>
			<div class="collapse navbar-toggleable-md" id="exCollapsingNavbar2">
				<ul class="nav navbar-nav ">
					<li class="nav-item"><input type="radio" name="menuChoose"
						value="sumnail" checked>썸네일로 보기 <input type="radio"
						name="menuChoose" value="map">지도로 보기</li>
					<li class="nav-item"><a class="nav-link" href="#">한식</a></li>
					<li class="nav-item"><a class="nav-link" href="#">중식</a></li>
					<li class="nav-item"><a class="nav-link" href="#">일식/수산물</a></li>
					<li class="nav-item"><a class="nav-link" href="#">패스트푸드</a></li>
					<li class="nav-item"><a class="nav-link" href="#">분식</a></li>
					<li class="nav-item"><a class="nav-link" href="#">양식</a></li>
					<li class="nav-item"><a class="nav-link" href="#">뷔페/퓨전음식</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="top-head left">
		<!-- <img src="img/food.JPG"> -->
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-4">
					<h1>
						#JMT<br>
						판교 맛따라  멋따라
					</h1>
				</div>
				<div id="loginFrom">
					<input type="button" class="btn btn-default" id="login" value="로그인">

					<input type="button" class="btn btn-default" id="popbutton"
						value="회원가입"> <br />
					<!-- 모달 보여주는 곳  -->
					<div class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- remote ajax call이 되는영역 -->
							</div>
						</div>
					</div>
				</div>
					<div class="input-group">
						<input type="text" placeholder="search for" class="form-control">
						<span class="input-group-btn">
							<button type="button" class="btn btn-search">Search</button>
						</span>
					</div>
				
			</div>
		</div>
	</div>
</header>