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
<input type="button" class="btn btn-default" id="reviewWrite" value="리뷰쓰기">

<div class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- remote ajax call이 되는영역 -->
			</div>
		</div>
	</div>

<h1>리뷰(최신순)</h1>
	<select name="order" class="form-control">
	  <option value="최신순" selected="selected">최신순</option>
	  <option value="좋아요순">좋아요순</option>
	</select>
	<br>
	
	<div id = reviewAjax>
	<c:forEach items="${reviewList}" var="review" varStatus = "state">
	<table>
		<tr>
			<th colspan="3"><h4>제목 : ${review.reviewTitle} -- 리뷰 쓴 사람 아이디 : ${review.memberId}</h4></th>
			<th style="padding-left:300px"><img id="reviewLikeImg" src="${pageContext.request.contextPath}/img/reviewLike.png">좋아요 수 : (추가 예정)</th>
		</tr>
		<tr>
			<th colspan="4">${review.reviewDate}</th>			
		</tr>
		<tr>
			<th colspan="4">${review.reviewContents}</th>
		</tr>
		<tr>
			<th><img src= '${review.reviewImg1}' class = 'reviewImg'></th>
			<th><img src= '${review.reviewImg2}' class = 'reviewImg'></th>
			<th><img src= '${review.reviewImg3}' class = 'reviewImg'></th>
		</tr>
	 <tr id='addbtn'><td colspan="5"><div class="btns"><a href="javascript:moreList();" class="btn btn-primary">더보기</a></div></td></tr>
</table>
	<br><br>

	</c:forEach>

	</div>	
</footer>

