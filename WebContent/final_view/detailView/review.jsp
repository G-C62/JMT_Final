<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#reviewFooter {
	background-color: #f6f6f6;
	padding-left: 240px;
	float: left;
}
.form-control {
	width: 200px;
}

#reviewLike {
	padding-left: 800px;
	width: 100%
}

#reviewLikeImg {
	width: 30px;
	height: 30px
}

.reviewImg {
	width: 100px;
	height: 100px
}
select{
	margin-top:25px;
}
table h4{
	font-weight: bold;
}

</style>

<div id="reviewFooter">
	<button id="createReview" type="button" class="btn btn-success" >리뷰쓰기</button>

	

	
	<select name="order">
		<option value="최신순" selected="selected">최신순</option>
		<option value="좋아요순">좋아요순</option>
	</select> <br>
	
	


	<div id=reviewAjax>
	<!-- 리뷰없을시 처리해야할 부분 -->
		<c:choose>
			<c:when test="${reviewList.size()==0}">	
			</c:when>
			<c:otherwise>
			</c:otherwise>
		</c:choose>
		<c:forEach items="${reviewList}" var="review" varStatus="state">
			<table>
				<tr>
					<th colspan="3"><h4>${review.reviewTitle} </h4></th>
					<th style="padding-left: 300px">
						<div id="reviewDiv">
							<c:choose>
								<c:when test="${reviewLikeYesOrNoMap[review.reviewId]==false}">
									<img class="reviewLike"
										src="${pageContext.request.contextPath}/img/heart.png"
										id="${review.reviewId }" style="cursor: pointer" />
								</c:when>
								<c:otherwise>
									<img class="reviewLike"
										src="${pageContext.request.contextPath}/img/heart_fill.png"
										id="${review.reviewId }" style="cursor: pointer" />
								</c:otherwise>
							</c:choose>
						</div> 			
						<span> <span class="likeCount">${reviewLikeAmountMap[review.reviewId] }</span>명이 리뷰를 좋아합니다</span>
					</th>
				</tr>
				<tr>
					<th colspan="4">${review.reviewDate}</th>
				</tr>
				<tr>
					<th colspan="4">작성자 : ${review.memberId}</th>
				</tr>
				<tr>
					<th colspan="4">${review.reviewContents}</th>
				</tr>
				<tr>
				<c:choose>
					<c:when test="${empty review.reviewImg1}">
						<th><img src='${review.reviewImg1}' class='reviewImg' style='visibility:hidden'></th>
					</c:when>
					<c:otherwise>
						<th><img src='${review.reviewImg1}' class='reviewImg'></th>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty review.reviewImg2}">
					<th><img src='${review.reviewImg2}' class='reviewImg' style='visibility:hidden'></th>
					</c:when>
					<c:otherwise>
					<th><img src='${review.reviewImg2}' class='reviewImg'></th>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${empty review.reviewImg3}">
					<th><img src='${review.reviewImg3}' class='reviewImg' style='visibility:hidden'></th>
					</c:when>
					<c:otherwise>
						<th><img src='${review.reviewImg3}' class='reviewImg'></th>
					</c:otherwise>
				</c:choose>
					
				</tr>
				
			</table>
			<br>
			<br>

		</c:forEach>
		
	</div>
</div>
<div class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- remote ajax call이 되는영역 -->
			</div>
		</div>
</div>