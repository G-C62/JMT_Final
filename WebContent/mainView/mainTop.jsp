<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
					<li style="padding-top:10px">
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
					
					<c:choose>
						<c:when test="${empty sessionScope.memberID}">

						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/subView/favorite.jsp"><img src="../img/favorite.png" id="favoriteImg">즐겨찾기</a></li>
							<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/memberView/myPage.jsp">마이페이지</a></li>
						</c:otherwise>
					</c:choose>
					
				</ul>
			</div>
		</div>
	</div>
	
	<div class="top-head left">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-4" style="margin-left: 400px;margin-top: 30px;">
					<h1 style="cursor:pointer" onclick="location.href='${pageContext.request.contextPath}/mainView/JmtMain.jsp'" >
						 &ensp;&ensp;&ensp;&ensp;&ensp;#JMT<br> 판교 맛따라 멋따라
					</h1>
				</div>
				<form id="loginFrom">
					<c:choose>
						<c:when test="${empty sessionScope.memberID}">

							<input type="button" class="btn btn-default" id="login"
								value="로그인">
							<input type="button" class="btn btn-default" id="popbutton"
								value="회원가입">

							<br />
						</c:when>
						<c:otherwise>
							<input type="button" class="btn btn-default" id="logout"
								value="로그아웃">
						</c:otherwise>
					</c:choose>
					<span style="color:white; font-size:25px">${sessionScope.memberID}님 환영합니다.</span>

				</form>
				<from class="input-group" name="search" id="search">
					<input type="text" placeholder="search for" class="form-control"  name="keyWord" id="keyWord">
					<div id="suggest" style="display:none;background-color:white"></div>
					
					<span class="input-group-btn">
						<button type="button" class="btn btn-search">Search</button>
					</span>
				</from>
				

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
</header>