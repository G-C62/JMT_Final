<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#reviewFooter{background-color:pink;padding-left:240px}
select{margin-left:900px}
.form-control{width:200px;}
#reviewLike{padding-left:800px;width:100%}
#reviewLikeImg{width:30px; height:30px}
.reviewImg{width:100px; height: 100px}
</style>
<footer id="reviewFooter">
<h1>리뷰(최신순)</h1>
	<select name="order" class="form-control">
	  <option value="최신순" selected="selected">최신순</option>
	  <option value="좋아요순">좋아요순</option>
	</select>
	<div id = reviewAjax>
	
	
	<c:forEach items="${reviewList}" var="review" varStatus = "state">
	<div>
		<h4>제목 : ${review.reviewTitle} -- 리뷰 쓴 사람 아이디 : ${review.memberId} <br></h4>
		<div id="reviewLike"><img id="reviewLikeImg" src="${pageContext.request.contextPath}/img/reviewLike.png">좋아요 수 : (추가 예정)</div>
		
		${review.reviewDate}<br>
		&nbsp;&nbsp;&nbsp;&nbsp;${review.reviewContents} <br>
		
		<img src= '${review.reviewImg1}' class = 'reviewImg'>
		<img src= '${review.reviewImg2}' class = 'reviewImg'>
		<img src= '${review.reviewImg3}' class = 'reviewImg'> <br>
	</div>
	</c:forEach>
	
	</div>	
</footer>

