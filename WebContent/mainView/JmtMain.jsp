<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>River Bootstrap 4 Template by Grafreez</title>

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

<style type="text/css">
#search {
	height:100%;
	width: 100%
}
.modal-body{background-color:white}
</style>
<script type="text/javascript">
	$(function() {
		$("#popbutton").click(function() {
			$('div.modal').load("${pageContext.request.contextPath}/mainView/join.jsp")
			$('div.modal').modal("show");
		});
 		$("#login").click(function() {
			$('div.modal').load("${pageContext.request.contextPath}/mainView/login.jsp")
			$('div.modal').modal("show");
		});
 		$("#logout").click(function() {
			top.location.href = "${pageContext.request.contextPath}/mainView/logout.jsp";
		});
	});
</script>
</head>
<body>
<%@ include file="mainTop.jsp" %>
	<section id=search>

	<form id="hansick" class="row" style="padding-left:7%">
	<div><h3>한식 추천 메뉴</h3></div>
		<c:forEach items="${hansickFiveSelect}" var="hansickFive" varStatus="state">
			   <div class="colunm" style="float:left">
			   	<div>
			   		<img src='${hansickFive.reviewImg1}' class="bestFiveImg" 
			   			onclick="location.href='${pageContext.request.contextPath}/jmt?command=detail&resId=${hansickFive.resId}'" 
			   			style="cursor:pointer">
			   	</div>
			   	<div>${hansickFive.resName}</div>
			   </div>
		</c:forEach>
		<div style="padding-top:15%;padding-left:79%"><input type="button" value="더 보기" onclick="location.href='jmt?command=restaurant.selectAllRestaurant&category=한식'"></div>
	</form>

		<form id="jungFive" class="row" style="padding-left:7%">
		<div><h3>중식 추천 메뉴</h3></div>
			<c:forEach items="${jungsickFiveSelect}" var="jungFiveFive" varStatus="state">
				   <div class="colunm" style="float:left">
				   <div><img src='${jungFiveFive.reviewImg1 }' class="bestFiveImg" onclick="location.href='${pageContext.request.contextPath}/jmt?command=detail&resId=${jungFiveFive.resId}'" style="cursor:pointer"></div>
				   <div>${jungFiveFive.resName}</div>
				   </div>
				   
			</c:forEach>
			<div style="padding-top:15%;padding-left:79%"><input type="button" value="더 보기" onclick="location.href='jmt?command=restaurant.selectAllRestaurant&category=중식'"></div>
		</form>
		
		<form id="ilsik" class="row" style="padding-left:7%">
		<div><h3>일식/수산물 추천 메뉴</h3></div>
			<c:forEach items="${ilsickFiveSelect}" var="ilsickFive" varStatus="state">
				   <div class="colunm" style="float:left">
				   <div><img src='${ilsickFive.reviewImg1 }' class="bestFiveImg" onclick="location.href='${pageContext.request.contextPath}/jmt?command=detail&resId=${ilsickFive.resId}'" style="cursor:pointer"></div>
				   <div>${ilsickFive.resName}</div>
				   </div>
				   
			</c:forEach>
			<div style="padding-top:15%;padding-left:79%"><input type="button" value="더 보기" onclick="location.href='jmt?command=restaurant.selectAllRestaurant&category=일식'"></div>
		</form>

		<form id="fastfood" class="row" style="padding-left:7%">
		<div><h3>패스트푸드 추천 메뉴</h3></div>
			<c:forEach items="${fastfoodFiveSelect}" var="fastfoodFive" varStatus="state">
				   <div class="colunm" style="float:left">
				   <div><img src='${fastfoodFive.reviewImg1}' class="bestFiveImg" onclick="location.href='${pageContext.request.contextPath}/jmt?command=detail&resId=${fastfoodFive.resId}'" style="cursor:pointer"></div>
				   <div>${fastfoodFive.resName}</div>
				   </div>
			</c:forEach>
			<div style="padding-top:15%;padding-left:79%"><input type="button" value="더 보기" onclick="location.href='jmt?command=restaurant.selectAllRestaurant&category=패스트푸드'"></div>
		</form>
		
		<%-- <form id="bunsick" class="row" style="padding-left:7%">
		<div><h3>분식 추천 메뉴</h3></div>
			<c:forEach items="${bunsickFiveSelect}" var="bunsickFive" varStatus="state">
				   <div class="colunm" style="float:left">
				   <div><img src='${bunsickFive.reviewImg1 }' class="bestFiveImg" onclick="location.href='${pageContext.request.contextPath}/jmt?command=detail&resId=${bunsickFive.resId}'" style="cursor:pointer"></div>
				   <div>${bunsickFive.resName}</div>
				   </div>
			</c:forEach>
			<div style="padding-top:15%;padding-left:79%"><input type="button" value="더 보기" onclick="location.href='jmt?command=restaurant.selectAllRestaurant&category=분식'"></div>
		</form> --%>
		
		<form id="yangsick" class="row" style="padding-left:7%">
		<div><h3>양식 추천 메뉴</h3></div>
			<c:forEach items="${yangsickFiveSelect}" var="yangsickFive" varStatus="state">
				   <div class="colunm" style="float:left">
				   <div><img src='${yangsickFive.reviewImg1 }' class="bestFiveImg" onclick="location.href='${pageContext.request.contextPath}/jmt?command=detail&resId=${yangsickFive.resId}'" style="cursor:pointer"></div>
				   <div>${yangsickFive.resName}</div>
				   </div>
			</c:forEach>
			<div style="padding-top:15%;padding-left:79%"><input type="button" value="더 보기" onclick="location.href='jmt?command=restaurant.selectAllRestaurant&category=양식'"></div>
		</form>
		
		<%-- <form id="buffet" class="row" style="padding-left:7%">
		<div><h3>뷔페/퓨전요리 추천 메뉴</h3></div>
			<c:forEach items="${buffetFiveSelect}" var="buffetFive" varStatus="state">
				   <div class="colunm" style="float:left">
				   <div><img src='${buffetFive.reviewImg1 }' class="bestFiveImg" onclick="location.href='${pageContext.request.contextPath}/jmt?command=detail&resId=${buffetFive.resId}'" style="cursor:pointer"></div>
				   <div>${buffetFive.resName}</div>
				   </div>
			</c:forEach>
			<div style="padding-top:15%;padding-left:79%"><input type="button" value="더 보기" onclick="location.href='jmt?command=restaurant.selectAllRestaurant&category=뷔페/퓨전요리'"></div>
		</form> --%>
	</section>

<%@ include file="footer.jsp" %>

	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/core.js"></script>
	
</body>
</html>