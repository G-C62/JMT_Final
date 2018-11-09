<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/lib/jquery-3.3.1.min.js"></script>
<style type="text/css">
	.resImg{width:50px; height:50px}
</style>
   
<script>
$(document).ready(function(){
 	  $("select[name=order]").on("change" , function(){       
  	 	 $.ajax({
	          url : "${pageContext.request.contextPath}/ReviewInDetailAjaxServlet", //서버 요청 주소
	          type : "post", //get or post 요청방식
	          dataType : "json", //서버가 보내오는 데이터 타입(text,html,json,xml)
	          data : "resId=${requestScope.partialDetail.resId}&orderby="+$(this).val(), //서버에게 보내는 parameter 정보
	          success : function(result){
	             //alert(result);
	             var str = "";
	             	             
	             $.each(result, function(index, item){
	                //alert(item.id);
	                console.log(item.reviewTitle);
	                str += "<h3>" + (index+1) + "번째 리뷰</h3> ";
	        		str += "리뷰 제목 : " + item.reviewTitle + " <br>";
	        		str += "리뷰 내용 : " + item.reviewContents + "<br>";
	        		str += "리뷰 쓴 날짜 : " + item.reviewDate + "<br>";
	        		str += "리뷰 쓴 사람 아이디 : " + item.memberId + "<br>";
	        		str += "리뷰 이미지1  : " + item.reviewImg1 + "<br>";
	        		str += "리뷰 이미지2 : " + item.reviewImg2 + "<br>";
	        		str += "리뷰 이미지3 : " + item.reviewImg3 + "<br>";
	             }); 
	             
	             $("#reviewAjax").empty();
	             $("#reviewAjax").append(str);
	             
	          },
	          error : function(err){
	             alert(err + "=> 예외발생!!");
	          }            
	     }); 
    }); 
    
 });
</script>
</head>
<body>
	
	<h1>음식점 상세 부분</h1>
	<h3>(null 이어도 되는 컬럼은 null일 경우 안 나옵니다.)</h3>
	
	음식점 사진 : (일단 전부 가져왔으니 앞단에서 모달로 하시던지 원하시는 방법으로 프론트에 뿌려주세여)<br>
	없으면 기본 사진 뿌려짐 <br>
	<c:choose>
		<c:when test="${requestScope.imgList}!=null">
			<c:forEach items="${requestScope.imgList}" var="image" varStatus = "state">
				<img src= '${image}' class = 'resImg'>
			</c:forEach><br>
		</c:when>
		<c:otherwise> 
			<img src= '${fixedImg}' class = 'resImg'><br>
		</c:otherwise>
	</c:choose>
	
	음식점 이름 : ${requestScope.partialDetail.resName} <br>
	음식점 체인점명 : ${requestScope.partialDetail.resChainName} <br>
	음식점 소분류 : ${requestScope.partialDetail.resName} <br>
	음식점 도로명 주소 : ${requestScope.partialDetail.resAddr} <br>
	음식점 동 : ${requestScope.partialDetail.resDong} <br>
	음식점 층 : ${requestScope.partialDetail.resFloor} <br>
	음식점 호 : ${requestScope.partialDetail.resHo} <br>


	-------------------------------------------------
	
	<h1>누적 추천수</h1>
	${resLikeAcc } <br><br><br>

	-------------------------------------------------
	 

	<h1>Ajax 이용 - 음식점에 해당하는 모든 리뷰(최신순)</h1>
	<select name="order">
	  <option value="최신순" selected="selected">최신순</option>
	  <option value="좋아요순">좋아요순</option>
	</select>
	<div id = reviewAjax></div>
	
	
	-------------------------------------------------
	
		 
	<h1>그냥 - 음식점에 해당하는 모든 리뷰(최신순)</h1>
	
	 <%-- ${reviewList[0].reviewTitle} / ${reviewList[1].reviewTitle} / ${reviewList}<p>
	  --%>

	<c:forEach items="${reviewList}" var="review" varStatus = "state">
		<h3>${state.count }번째 리뷰</h3>  
		리뷰 제목 : ${review.reviewTitle } <br>
		리뷰 내용 : ${review.reviewContents } <br>
		리뷰 쓴 날짜 : ${review.reviewDate } <br>
		리뷰 쓴 사람 아이디 : ${review.memberId } <br>
		리뷰 이미지1 : <img src= '${review.reviewImg1 }' class = 'resImg'> <br>
		리뷰 이미지2 : <img src= '${review.reviewImg2 }' class = 'resImg'> <br>
		리뷰 이미지3 : <img src= '${review.reviewImg3 }' class = 'resImg'> <br>
		리뷰 좋아요 수 : (추가 예정)
	</c:forEach>		

	
</body>
</html>