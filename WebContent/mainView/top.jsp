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
						<input type="radio" name="subMenuCheck" value="sumnail"checked > ����Ϸ� ����
					
						<input type="radio" name="subMenuCheck" value="map"> ������ ����
					</li>
					<li class="nav-item"><a class="nav-link" href="#">�ѽ�</a></li>
					<li class="nav-item"><a class="nav-link" href="#">�߽�</a></li>
					<li class="nav-item"><a class="nav-link" href="#">�Ͻ�/���깰</a></li>
					<li class="nav-item"><a class="nav-link" href="#">�н�ƮǪ��</a></li>
					<li class="nav-item"><a class="nav-link" href="#">�н�</a></li>
					<li class="nav-item"><a class="nav-link" href="#">���</a></li>
					<li class="nav-item"><a class="nav-link" href="#">����/ǻ������</a></li>
					<li class="nav-item"><a class="nav-link" href="../subView/favorite.html"><img src="../img/favorite.png" id="favoriteImg">���ã��</a></li>
					<li class="nav-item"><a class="nav-link" href="../memberView/myPage.jsp">����������</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<div class="top-head left">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-4">
					<h1>
						#JMT<br> �Ǳ� ������ �ڵ���
					</h1>
				</div>
				<form id="loginFrom">
					<input type="button" class="btn btn-default" id="login" value="�α���">

					<input type="button" class="btn btn-default" id="popbutton" value="ȸ������"><br/>
					<!-- ��� �����ִ� ��  -->
					
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
								<!-- remote ajax call�� �Ǵ¿��� -->
							</div>
						</div>
					</div>
</header>