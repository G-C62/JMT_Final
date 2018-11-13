<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="path" value="${pageContext.request.contextPath}"
	scope="application" />


<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 리뷰</title>
<%@ include file="../shareView/resources.jsp"%>
<link rel="stylesheet" href="${path}/css/myReview.css">
<style type="text/css">
	.modal-body {
	background-color: white
}

</style>
</head>
<body>
	<div class="pageTitle">
		<h3 style="padding-top: 450px; font-weight: bold;">내가 쓴 리뷰</h3>
	</div>

	<section>
	<form>
		<c:choose>
			<c:when test="${empty requestScope.list}">
				
				<b><span style="font-size: 9pt;">등록된 리뷰가 없습니다.</span></b>
						
			</c:when>
			<c:otherwise>
			<c:forEach items="${requestScope.list}" var="review">
				
					<div class="reviewList">
						<div>
							<a href="#"><p>${review.resName}</p></a>
							<div class="reviewImg">
								<!-- if문으로 이미지 존재여부에 따라 이미지 변경 -->
								<%-- <img src="${path}/food/bunsick1.png" /> --%>
								<c:choose>
									<c:when test="${empty review.reviewImg1}">
										<div class="noneImg">
											<h5>이미지가 없습니다</h5>
										</div>
									</c:when>
									<c:otherwise>
										<img src="${review.reviewImg1}" />
									</c:otherwise>
								</c:choose>
								
							</div>
						</div>
						<div class="listInfo">
							<div class="likeInfo">
								<p>${review.reviewTitle}</p>
								<div class="recommend">
									<!-- if문으로 좋아요여부에 따라 이미지 변경 -->
									<c:choose>
									<c:when test="${review.reviewIsLike}">
										<img src="${path}/img/thumbUp_fill.png" />
									</c:when>
									<c:otherwise>
										<img src="${path}/img/thumbUp.png" />
									</c:otherwise>
								</c:choose>
									
								</div>
								<div>
									<div class="like">
										<img src="${path}/img/heart_fill.png" />
									</div>
									<!-- 좋아요 기능 완료시 추가 -->
									<span>좋아요 ${reviewLikeAmountMap[review.reviewId]}</span>
								</div>
								<button type="button" class="btn btn-primary" onclick='location.href="${path}/jmt?command=review.read&reviewId=${review.reviewId}"'>수정하기</button>
							</div>
							<div class="listText">
								<p>${review.reviewContents}</p> <span>${review.reviewDate}</span>
							</div>
						</div>
					</div>
					<hr>
					</c:forEach>
			</c:otherwise>
		</c:choose>
		<!-- ajax로 안할꺼면 submit -->
		</form>
		
	</section>

</body>
</html>