<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점 상세페이지</title>
<%@ include file="../shareView/resources.jsp" %>

<!-- custom style -->
<link href="${path}/css/sub.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${path}/css/main.css">

<script>
	$(function() {
		$("#bookmark").click(function() {
			var img1 = document.getElementById('starImg');
			if (img1.src.indexOf('_fill') == -1) { //_fill이라는 단어가 존재하지 않으면 star.png을 보여줌
				img1.src = img1.src.replace('.png', '_fill.png');
			} else {
				img1.src = img1.src.replace('_fill.png', '.png');
			}
		});
	});
</script>
<script>
	$(document).ready(function() {
		$("select[name=order]").on("change",function() {
			$.ajax({
				url : "${pageContext.request.contextPath}/ReviewInDetailAjaxServlet", //서버 요청 주소
				type : "post", //get or post 요청방식
				dataType : "json", //서버가 보내오는 데이터 타입(text,html,json,xml)
				data : "resId=${requestScope.partialDetail.resId}&orderby="+ $(this).val(), //서버에게 보내는 parameter 정보
				success : function(result) {
					//alert(result);
					var str = "";
					$.each(result,function(index,item) {
						//alert(item.id);
						console.log(item.reviewTitle);
						str += "<h3>"+ (index + 1)+ "번째 리뷰</h3> ";
						str += "리뷰 제목 : "+ item.reviewTitle	+ " <br>";
						str += "리뷰 내용 : "+ item.reviewContents+ "<br>";
						str += "리뷰 쓴 날짜 : "+ item.reviewDate+ "<br>";
						str += "리뷰 쓴 사람 아이디 : "+ item.memberId+ "<br>";
						str += "리뷰 이미지1  : "+ item.reviewImg1+ "<br>";
						str += "리뷰 이미지2 : "+ item.reviewImg2+ "<br>";
						str += "리뷰 이미지3 : "+ item.reviewImg3+ "<br>";
					});
					$("#reviewAjax").empty();
					$("#reviewAjax").append(str);
				},
				error : function(err) {
					alert(err+ "=> 예외발생!!");
				}
			});
		});
	});
</script>
<script type="text/javascript">
	$(function() {
		$("#reviewWrite").click(function() {
			$('div.modal').load("${pageContext.request.contextPath}/restaurantDetail/reviewWrite.jsp")
			$('div.modal').modal("show");
		});
	});
</script>
</head>
<body>
	<%@include file="../shareView/nav.jsp"%>
	<section id=resInfo>
		<div class="resTitle">${requestScope.partialDetail.resName}</div>
		<div id="resContainer">
			<div id="imgContainer">
				<c:choose>
					<c:when test="${requestScope.imgList}!=null">
						<c:forEach items="${requestScope.imgList}" var="image" varStatus="state">
							<img src='${image}' class='resImg'>
						</c:forEach>
						<br>
					</c:when>
					<c:otherwise>
						<img src='${path}/img/food.PNG' class='resImg'>
						<!-- img에 원래 ${fixedimage}라고 적혀 있엇음 못찾아와서 직접 적어놈 -->
						<br>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="like">
				<div>
					<span>이번주 따봉 n</span>
				</div>
				<div>
					<div class="smallLike">
						<img src="${path}/img/like.jpg"
							id="likeImg" style="cursor: pointer" />
					</div>
					<span>${resLikeAcc}</span>
				</div>
				<div>
					<div id="bookmark">
						<img src="${path}/img/star.png"
							id="starImg" style="cursor: pointer" />
					</div>
				</div>
			</div>
			<div class="textInfo">
				<p>음식 종류 :${requestScope.partialDetail.resCategory}</p>
				<p>주소 :${requestScope.partialDetail.resAddr}&nbsp;
					${requestScope.partialDetail.resDong}&nbsp;
					${requestScope.partialDetail.resFloor}층</p>
			</div>
			<div id="loginDiv">
				<input type="button" class="btn btn-default" id="login" value="지도 보기">
			</div>

		</div>
	</section>
	<%@ include file="review.jsp"%>

	<script src="${path}/js/jquery.min.js"></script>
	<script src="${path}/js/bootstrap.min.js"></script>
	<script src="${path}/js/core.js"></script>
</body>
</html>