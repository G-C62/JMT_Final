<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>음식점 상세페이지</title>
<%@ include file="../shareView/resources.jsp"%>

<!-- custom style -->
<link href="${path}/css/sub.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/css/main.css">
<link href="${path}/css/detail.css" rel="stylesheet">
<style>
body>div.top-head.left {
	height: 250px;
}
.modal-body {
	background-color: white
}
</style>


<script>
	$(function() {
		/* 제목변경 */
		$("h1").text("음식점 상세정보");
		
		/* 즐겨찾기 토글 */		
		$("#bookmark")
				.on(
						"click",
						function() {
							var starImg = document.getElementById('starImg');
							var flag = 'insert';
							if (starImg.src.indexOf('_fill') == -1) { //_fill이라는 단어가 존재하지 않으면 star.png을 보여줌
								starImg.src = starImg.src.replace('.png',
										'_fill.png');
							} else {
								starImg.src = starImg.src.replace('_fill.png',
										'.png');
								flag = 'delete';
							}
							console.log("${requestScope.partialDetail.resId}");
							console.log("${sessionScope.memberID}");
							console.log(flag);
							$
									.ajax({
										url : "${pageContext.request.contextPath}/BookMarkToggleAjaxServlet", //서버 요청 주소
										type : "post", //get or post 요청방식
										dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
										data : "resId=${requestScope.partialDetail.resId}&memberId=${sessionScope.memberID}&flag="
												+ flag,
										//아이디를 고정해 주었지만 합치면 application에서 꺼내 와야 함
										success : function(result) { //0, 1
											//alert(result);

										},
										error : function(err) {
											alert(err + "=> 예외발생!!");
										}
									});
						});

		/* 셀렉트박스 정렬 이벤트 */
		$("select[name=order]")
				.on(
						"change",
						function() {
							$
									.ajax({
										url : "${pageContext.request.contextPath}/ReviewInDetailAjaxServlet", //서버 요청 주소
										type : "post", //get or post 요청방식
										dataType : "json", //서버가 보내오는 데이터 타입(text,html,json,xml)
										data : "resId=${requestScope.partialDetail.resId}&orderby="
												+ $(this).val(), //서버에게 보내는 parameter 정보
										success : function(result) {
											//alert(result);
											/* var str = "";*/
											$.each(	result,function(index,item) {
												
												var tbody = $("tbody").eq(index)
												//제목수정
												tbody.find("h4").text(item.reviewTitle);
												//좋아요버튼
												var id = String(item.reviewId);
												var result = "${reviewLikeYesOrNoMap}";
												result = result.substring(1,result.length-1);
												//var jsonMap = jQuery.parseJSON(result);
												console.log(id);
												var heartMap = new Map();
												var splitByComma = result.split(',');
												for ( var i in splitByComma ) {
													var splitByEqual = splitByComma[i].split('=');
														for(var j in splitByEqual){
															if(j==0){
																	
															}else{
																heartMap.set(splitByEqual[j-1].trim(),splitByEqual[j]);
															}
														}
												    } 
												if(heartMap.get(id)=="false"){
													tbody.find("#reviewDiv").children().attr({src:'${pageContext.request.contextPath}/img/heart.png',id:id});
													//$("#reviewDiv").html("<img class='reviewLike' src='${pageContext.request.contextPath}/img/heart.png' id='${review.reviewId }' style='cursor: pointer' />");
												}else{
													tbody.find("#reviewDiv").children().attr({src:'${pageContext.request.contextPath}/img/heart_fill.png',id:id});
													//$("#reviewDiv").html("<img class='reviewLike' src='${pageContext.request.contextPath}/img/heart_fill.png' id='${review.reviewId }' style='cursor: pointer' />");
												}
												//좋아요 갯수
												var likeMap = new Map();
												result = "${reviewLikeAmountMap}";
												result = result.substring(1,result.length-1);
												console.log(result);
												var splitByComma = result.split(',');
												for ( var i in splitByComma ) {
													var splitByEqual = splitByComma[i].split('=');
														for(var j in splitByEqual){
															if(j==0){
																	
															}else{
																likeMap.set(splitByEqual[j-1].trim(),splitByEqual[j]);
															}
														}
												    }
												tbody.find(".likeCount").text(likeMap.get(id));
												
												//작성일
												tbody.find("tr:nth-child(2) > th").text(item.reviewDate);
												
												//작성자
												tbody.find("tr:nth-child(3) > th").text(item.memberId);
												
												//리뷰내용
												tbody.find("tr:nth-child(4) > th").text(item.reviewContents);
												console.log(id);
												//사진
												/* 사진 없는경우 처리 */
												if(item.reviewImg1==""&&item.reviewImg1==""&&item.reviewImg1==""){
												}
												
												tbody.find("tr:nth-child(5) > th:nth-child(1)  > img").attr({src:item.reviewImg1,style:"visibility:visible"});
												tbody.find("tr:nth-child(5) > th:nth-child(2)  > img").attr({src:item.reviewImg2,style:"visibility:visible"});
												tbody.find("tr:nth-child(5) > th:nth-child(3)  > img").attr({src:item.reviewImg3,style:"visibility:visible"});
												if(item.reviewImg1==""){
													tbody.find("tr:nth-child(5) > th:nth-child(1)  > img").attr({src:item.reviewImg1,style:"visibility:hidden"});
												}
												if(item.reviewImg2==""){
													tbody.find("tr:nth-child(5) > th:nth-child(2)  > img").attr({src:item.reviewImg2,style:"visibility:hidden"});
												}
												if(item.reviewImg3==""){
													tbody.find("tr:nth-child(5) > th:nth-child(3)  > img").attr({src:item.reviewImg3,style:"visibility:hidden"});
												}
											});
										},
										error : function(err) {
											alert(err + "=> 예외발생!!");
										}
									});
						});

		/* 댓글 좋아요 토글 */
		$("#reviewDiv img")
				.on(
						"click",
						function() {
							var id = $(this).attr("id");
							var heartImg = document.getElementById(id);

							var flag = 'insert';

							if (heartImg.src.indexOf('_fill') == -1) { //_fill이라는 단어가 존재하지 않으면 heart.png을 보여줌
								heartImg.src = heartImg.src.replace('.png',
										'_fill.png');
								/* 사용자에게 보일 좋아요 갯수 증가 */
								var count = parseInt($(this).parent().next()
										.children().text()) + 1;
								$(this).parent().next().children().text(count);

							} else {
								heartImg.src = heartImg.src.replace(
										'_fill.png', '.png');
								flag = 'delete';
								/* 사용자에게 보일 좋아요 갯수 감소 */
								var count = parseInt($(this).parent().next()
										.children().text()) - 1;
								$(this).parent().next().children().text(count);
							}

							$
									.ajax({
										url : "${pageContext.request.contextPath}/ReviewLikeToggleAjaxServlet", //서버 요청 주소
										type : "post", //get or post 요청방식
										dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
										data : "reviewId="
												+ id
												+ "&memberId=${requestScope.memberId}&flag="
												+ flag,
										//아이디를 고정해 주었지만 합치면 application에서 꺼내 와야 함
										success : function(result) { //0, 1

										},
										error : function(err) {
											alert(err + "=> 예외발생!!");
										}
									});
						});

		/* 리뷰작성 모달 이벤트 */
		$("#createReview").click(function() {
				$('div.modal').load("final_view/detailView/reviewWrite.jsp?resName=${requestScope.partialDetail.resName}&memberId=${requestScope.memberId}&resId=${requestScope.partialDetail.resId}");
				$('div.modal').modal("show");
			});
	});
</script>
</head>
<body>
	<%@include file="../shareView/nav.jsp"%>
	<%@include file="../shareView/header.jsp"%>
	<section id=resInfo>
		<div class="resTitle">${requestScope.partialDetail.resName}</div>
		<div id="resContainer">
			<div id="imgContainer">
				<c:choose>
					<c:when test="${requestScope.imgList.size()!=0}">
						<!-- List로 되어있어 댓글에 있는 이미지 임의로 가져옴 -->
						<img src='${requestScope.imgList[0]}' class='resImg'>
						<%-- <c:forEach items="${requestScope.imgList}" var="image"
							varStatus="state">
							<img src='${image}' class='resImg'>
						</c:forEach> --%>
						<br>
					</c:when>
					<c:otherwise>
						<img src='${fixedImg}' class='resImg'>
						<br>
					</c:otherwise>
				</c:choose>
				
			</div>
			<div class="like">
				<div>
					<div class="smallLike">
						<img src="${path}/img/like.jpg" id="likeImg" />
					</div>
					<span>${resLikeAcc}</span>
				</div>
				<div>
					<div id="bookmark">
						<c:choose>
							<c:when test="${requestScope.bookMarkYesOrNo==false}">
								<img src="${pageContext.request.contextPath}/img/star.png"
									id="starImg" style="cursor: pointer" />
							</c:when>
							<c:otherwise>
								<img src="${pageContext.request.contextPath}/img/star_fill.png"
									id="starImg" style="cursor: pointer" />
							</c:otherwise>
						</c:choose>
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
				<input type="button" class="btn btn-default" id="login"
					value="지도 보기">
			</div>

		</div>
	</section>
	<%@ include file="review.jsp"%>
	<%@ include file="../shareView/footer.jsp"%>
	
</body>
</html>