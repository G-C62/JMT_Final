<<<<<<< HEAD:WebContent/mainView/top.jsp
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
	<div class="navbar top-nav">
		<div class="container">
			<button class="navbar-toggler hidden-lg-up " type="button"
				data-toggle="collapse" data-target="#exCollapsingNavbar2"
				aria-controls="exCollapsingNavbar2" aria-expanded="false"
				aria-label="Toggle navigation">&#9776;</button>
			<div class="collapse navbar-toggleable-md" id="exCollapsingNavbar2">
				<ul class="nav navbar-nav ">
					<li>
						<input type="radio" name="subMenuCheck" value="sumnail"checked > 썸네일로 보기
					
						<input type="radio" name="subMenuCheck" value="map"> 지도로 보기
					</li>
					<li class="nav-item"><a class="nav-link" href="#">한식</a></li>
					<li class="nav-item"><a class="nav-link" href="#">중식</a></li>
					<li class="nav-item"><a class="nav-link" href="#">일식/수산물</a></li>
					<li class="nav-item"><a class="nav-link" href="#">패스트푸드</a></li>
					<li class="nav-item"><a class="nav-link" href="#">분식</a></li>
					<li class="nav-item"><a class="nav-link" href="#">양식</a></li>
					<li class="nav-item"><a class="nav-link" href="#">뷔페/퓨전음식</a></li>
					<li class="nav-item"><a class="nav-link" href="../subView/favorite.html"><img src="../img/favorite.png" id="favoriteImg">즐겨찾기</a></li>
					<li class="nav-item"><a class="nav-link" href="../memberView/myPage.jsp">마이페이지</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="top-head left">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-4">
					<h1>
						#JMT<br> 판교 맛따라 멋따라
					</h1>
				</div>
				<form id="loginFrom">
					<input type="button" class="btn btn-default" id="login" value="로그인">

					<input type="button" class="btn btn-default" id="popbutton" value="회원가입"><br/>
					<!-- 모달 보여주는 곳  -->
					
				</form>
				<div class="input-group">
					<input type="text" placeholder="search for" class="form-control">
					<span class="input-group-btn">
						<button type="button" class="btn btn-search">Search</button>
					</span>
				</div>

			</div>
		</div>
	</div>
	<div class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- remote ajax call이 되는영역 -->
							</div>
						</div>
					</div>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				<ul class="nav navbar-nav ">
					<li>
						<input type="radio" name="subMenuCheck" value="sumnail"checked > �뜽�꽕�씪濡� 蹂닿린
					
						<input type="radio" name="subMenuCheck" value="map"> 吏��룄濡� 蹂닿린
					</li>
					<li class="nav-item"><a class="nav-link" href="#">�븳�떇</a></li>
					<li class="nav-item"><a class="nav-link" href="#">以묒떇</a></li>
					<li class="nav-item"><a class="nav-link" href="#">�씪�떇/�닔�궛臾�</a></li>
					<li class="nav-item"><a class="nav-link" href="#">�뙣�뒪�듃�뫖�뱶</a></li>
					<li class="nav-item"><a class="nav-link" href="#">遺꾩떇</a></li>
					<li class="nav-item"><a class="nav-link" href="#">�뼇�떇</a></li>
					<li class="nav-item"><a class="nav-link" href="#">酉뷀럹/�벂�쟾�쓬�떇</a></li>
					<li class="nav-item"><a class="nav-link" href="../subView/favorite.jsp"><img src="../img/favorite.png" id="favoriteImg">利먭꺼李얘린</a></li>
					<li class="nav-item"><a class="nav-link" href="../memberView/myPage.jsp">留덉씠�럹�씠吏�</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="top-head left">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-4">
					<h1>
						#JMT<br> �뙋援� 留쏅뵲�씪 硫뗫뵲�씪
					</h1>
				</div>
				<form id="loginFrom">
					<input type="button" class="btn btn-default" id="login" value="濡쒓렇�씤">

					<input type="button" class="btn btn-default" id="popbutton" value="�쉶�썝媛��엯"><br/>
					<!-- 紐⑤떖 蹂댁뿬二쇰뒗 怨�  -->
					
				</form>
				<div class="input-group">
					<input type="text" placeholder="search for" class="form-control">
					<span class="input-group-btn">
						<button type="button" class="btn btn-search">Search</button>
					</span>
				</div>

			</div>
		</div>
	</div>
	<div class="modal fade">
						<div class="modal-dialog">
							<div class="modal-content">
								<!-- remote ajax call�씠 �릺�뒗�쁺�뿭 -->
							</div>
						</div>
					</div>
>>>>>>> 1e16c4fd1937115c9b1b71b203a697c0e3bbcddf:WebContent/mainView/mainTop.jsp
</header>