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
	#starImg{width:10px; height:10px}
	.reviewLike{width:10px; height:10px}
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
	        		str += "리뷰 이미지1  : <img src= '" + item.reviewImg1 + "' class = 'resImg'> <br>";
	        		str += "리뷰 이미지2  : <img src= '" + item.reviewImg2 + "' class = 'resImg'> <br>";
	        		str += "리뷰 이미지3  : <img src= '" + item.reviewImg3 + "' class = 'resImg'> <br>";
	        		str += "///////////프론트 하시는 분이 밑에 두 개의 값 가져와 주세요/////////////<br>"
	        		str += "내가 이 댓글을 좋아요 했는지 여부 : <br>"
	        		str += "리뷰 좋아요 수 : ${reviewLikeAmountMap[3]} <br>";
	                
	             }); 
	             
	             $("#reviewAjax").empty();
	             $("#reviewAjax").append(str);
	             
	          },
	          error : function(err){
	             alert(err + "=> 예외발생!!");
	          }            
	     }); 
  	 });
 	 
 	 $("#bookmark").on("click" , function(){       
 		var starImg = document.getElementById('starImg');
 		var flag = 'insert';
        if (starImg.src.indexOf('_fill') == -1) 
        { //_fill이라는 단어가 존재하지 않으면 star.png을 보여줌
        	starImg.src = starImg.src.replace('.png', '_fill.png');
        } else 
        {
        	starImg.src = starImg.src.replace('_fill.png', '.png');
            flag = 'delete';
        }
 		 $.ajax({
  	 		url : "${pageContext.request.contextPath}/BookMarkToggleAjaxServlet", //서버 요청 주소
	          type : "post", //get or post 요청방식
	          dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
	          data : "resId=${requestScope.partialDetail.resId}&memberId=${requestScope.memberId}&flag="+flag, 
	          //아이디를 고정해 주었지만 합치면 application에서 꺼내 와야 함
	          success : function(result){ //0, 1
	             //alert(result);
     
	          },
	          error : function(err){
	             alert(err + "=> 예외발생!!");
	          }       
	     });
      });
 	 
 	 
 	$("#reviewDiv img").on("click" , function(){
 		var id = $(this).attr("id");
 		var heartImg = document.getElementById(id);
	
 		var flag = 'insert';
 		
        if (heartImg.src.indexOf('_fill') == -1) 
        { //_fill이라는 단어가 존재하지 않으면 heart.png을 보여줌
        	heartImg.src = heartImg.src.replace('.png', '_fill.png');
        } else 
        {
        	heartImg.src = heartImg.src.replace('_fill.png', '.png');
          	flag = 'delete';
        } 
        
        $.ajax({
            url : "${pageContext.request.contextPath}/ReviewLikeToggleAjaxServlet", //서버 요청 주소
            type : "post", //get or post 요청방식
            dataType : "text", //서버가 보내오는 데이터 타입(text,html,json,xml)
            data : "reviewId="+id+"&memberId=${requestScope.memberId}&flag="+flag, 
            //아이디를 고정해 주었지만 합치면 application에서 꺼내 와야 함
            success : function(result){ //0, 1
               alert(result);
    
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
		<c:when test="${requestScope.imgList != null}">
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
	<h1>북마크</h1>
	
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
  
	
	${requestScope.bookMarkYesOrNo}<br>
	-------------------------------------------------
	
	
	
	
	<h1>Ajax 이용 - 음식점에 해당하는 모든 리뷰(최신순)</h1>
	<select name="order">
	  <option value="최신순" selected="selected">최신순</option>
	  <option value="좋아요순">좋아요순</option>
	</select>
	
	 <%-- ${reviewList[0].reviewTitle} / ${reviewList[1].reviewTitle} / ${reviewList}<p>
	  --%>

	<div id = reviewAjax>
		<c:forEach items="${reviewList}" var="review" varStatus = "state">
			<h3>${state.count }번째 리뷰</h3>  
			리뷰 제목 : ${review.reviewTitle } <br>
			리뷰 내용 : ${review.reviewContents } <br>
			리뷰 쓴 날짜 : ${review.reviewDate } <br>
			리뷰 쓴 사람 아이디 : ${review.memberId } <br>
			리뷰 이미지1 : <img src= '${review.reviewImg1 }' class = 'resImg'> <br>
			리뷰 이미지2 : <img src= '${review.reviewImg2 }' class = 'resImg'> <br>
			리뷰 이미지3 : <img src= '${review.reviewImg3 }' class = 'resImg'> <br>
			
			내가 이 댓글을 좋아요 했는지 여부 : 
			<div id="reviewDiv">
	      	 <c:choose>
		       	<c:when test="${reviewLikeYesOrNoMap[review.reviewId]==false}">
			        <img class="reviewLike" src="${pageContext.request.contextPath}/img/heart.png"
			             id="${review.reviewId }" style="cursor: pointer" />
			    </c:when>
			    <c:otherwise> 
					<img class="reviewLike" src="${pageContext.request.contextPath}/img/heart_fill.png"
			             id="${review.reviewId }" style="cursor: pointer" />
				</c:otherwise>
			 </c:choose>
	        </div><br>
	              
		   	리뷰 좋아요 수 : ${reviewLikeAmountMap[review.reviewId] }<br>
		</c:forEach>	
	</div>	

	
</body>
</html>