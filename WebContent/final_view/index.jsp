<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>#JMT</title>

<%@ include file="shareView/resources.jsp"%>

<!-- custom style -->
<link href="${path}/css/sub.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/css/main.css">
<link href="${path}/css/detail.css"
	rel="stylesheet">
<style type="text/css">
#search {
	height: 100%;
	width: 100%
}

.modal-body {
	background-color: white
}
header{
		display:contents;
	}
</style>
<script type="text/javascript">
	$(function() {
		$("#popbutton").click(function() {
			$('div.modal').load("memberView/join.jsp")
			$('div.modal').modal("show");
		});
		$("#login").click(function() {
			$('div.modal').load("memberView/login.jsp")
			$('div.modal').modal("show");
		});
		$("#keyWord").keyup(function() {
			if ($(this).val() == "") {
				$("#suggest").hide();
				return;
			}
			$.ajax({
				url : "../autoCompleteRestaurant", //서버주소
				type : "post", //요청방식
				dataType : "json",//서버가 보내준 데이터 타입 text,json,xml,html
				data : "keyWord=" + $(this).val(), //서버에게 보내는 파라미터 정보
				success : function(result) { //성공했을 시 함수
					var str = "";
					$.each(result, function(index, item) {
						console.log(item);
						str += "<a href='#'>" + item + "</a><br>";
					})
					$("#suggest").html(str);
					$("#suggest").show();
				},
				error : function(err) {
					console.log(err + " --> 발생함 ");
				} //실패했을 시 함수
			});
			if ($(this).val() == "") {
				$("#suggest").hide();
				return;
			}
		});
		$(document).on("click", "a", function() {
			$("#keyWord").val($(this).text());
			$("#suggest").hide();
		});
	});
</script>

</head>
<body>
	<!-- nav+search -->
	<header>
		<%@ include file="shareView/nav.jsp"%>
		<!-- mainHeader -->
		<div class="top-head left">
			<div class="container">
				<div class="row">
					<div class="col-md-6 col-lg-4"
						style="margin-left: 400px; margin-top: 30px;">
						<h1 style="cursor: pointer"
							onclick="location.href='${path}/mainView/JmtMain.jsp'">
							&ensp;&ensp;&ensp;&ensp;&ensp;#JMT<br> 판교 맛따라 멋따라
						</h1>
					</div>
					<form id="loginFrom">
						<input type="button" class="btn btn-default" id="login"
							value="로그인"> <input type="button" class="btn btn-default"
							id="popbutton" value="회원가입"><br />
						<!-- 모달 보여주는 곳  -->

					</form>
					<from class="input-group" name="search" id="search"> <input
						type="text" placeholder="search for" class="form-control"
						name="keyWord" id="keyWord">
					<div id="suggest" style="display: none; background-color: white"></div>

					<span class="input-group-btn">
						<button type="button" class="btn btn-search">Search</button>
					</span> </from>


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
	<section id=search>
		<div>
			<h3>한식 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left: 50px">
			<div class="column">
				<img src="${path}/img/media-9.jpg" class="bestFiveImg"
					onclick="location.href='../jmt?command=detail&resId=25398530'"
					style="cursor: pointer">
			</div>
			<div class="column">
				<img src="${path}/img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="${path}/img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="${path}/img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="${path}/img/media-9.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>

		<div>
			<h3>중식 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left: 50px">
			<div class="column">
				<img src="../img/media-3.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-10.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-3.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-10.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-3.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>

		<div>
			<h3>일식/수산물 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left: 50px">
			<div class="column">
				<img src="../img/media-4.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-5.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-4.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-5.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-4.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>

		<div>
			<h3>패스트푸드 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left: 50px">
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>

		<div>
			<h3>분식 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left: 50px">
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>

		<div>
			<h3>양식 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left: 50px">
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>

		<div>
			<h3>뷔페/퓨전요리 추천메뉴</h3>
		</div>
		<div class="row" style="padding-left: 50px">
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-1.jpg" class="bestFiveImg">
			</div>
			<div class="column">
				<img src="../img/media-9.jpg" class="bestFiveImg">
			</div>
			<a href="#">+더보기</a>
		</div>

	</section>
	<%@ include file="shareView/footer.jsp"%>

</body>
</html>