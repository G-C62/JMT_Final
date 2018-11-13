<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/responsive-style.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<link href="${pageContext.request.contextPath}/css/lightbox.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loaders.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">

<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
$(function(){
    
    $("select[name=order]").on("change" , function(){
        $.ajax({
           url : "${pageContext.request.contextPath}/orderRestaurantAjaxServle", //서버 요청 주소
           type : "post", //get or post 요청방식
           dataType : "json", //서버가 보내오는 데이터 타입(text,html,json,xml)
           data : "category=${param.category}&orderby="+$(this).val(), //서버에게 보내는 parameter 정보
           success : function(result){
             
              var str = "";
         
        		 $.each(result, function(index, item){
        			str += "<div id='allRestaurant'>";
        			str += "<div style='float:left;text-align: center;margin:15px;padding-left:20px'>";
	                str += "음식점 : "+ item.resName +"<br>";
	                str += "<img src='"+ item.reviewImg1 +"' class='bestFiveImg'>";
	                str += "</div>"
	                str += "</div>"
	             }); 
              
              $("#allRestaurant").empty();
              $("#allResView").html(str);
              
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
<%@ include file="nav.jsp" %>
<%@ include file="header.jsp" %>

	<form id="allRestaurants">
	<div style="padding-left: 90%; padding-top: 28%;padding-bottom:5%">
		<select name="order">
			<option value="최신순" selected="selected">추천순</option>
			<option value="좋아요순">가나다순</option>
		</select>
	</div>
		<div id="allResView">
		<div id="allRestaurant">
			<c:forEach items="${selectAllRestaurant}" var="allRestaurant" varStatus="state">
    			<div style="float:left;text-align: center;margin:15px;padding-left:20px">음식점 : ${allRestaurant.resName}<br>
    			<div>
    					<img src='${allRestaurant.reviewImg1}' class="bestFiveImg"
    				 onclick="location.href='${pageContext.request.contextPath}/jmt?command=detail&resId=${allRestaurant.resId}'"
    				 style="cursor:pointer">
    				</div>
    			</div>
			</c:forEach>
			
		</div>
		</div>
	</form>







</body>
</html>