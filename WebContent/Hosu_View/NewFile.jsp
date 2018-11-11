<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 a{text-decoration: none}
</style>
<script type="text/javascript" src="../lib/jquery-3.3.1.min.js"></script>
<script>
	$(function(){
		$("#keyWord").keyup(function(){
			if($(this).val()==""){
 				$("#suggest").hide();
 				return;
 			}
			$.ajax({
 				url:"../autoCompleteRestaurant",		//서버주소
 				type:"post",	//요청방식
 				dataType:"json",//서버가 보내준 데이터 타입 text,json,xml,html
 				data:"keyWord="+$(this).val(),	//서버에게 보내는 파라미터 정보
 				success:function(result){	//성공했을 시 함수
 					var str="";
 					$.each(result, function(index, item){
 						console.log(item);
 						str+="<a href='#'>"+item+"</a><br>";
 					})
 					$("#suggest").html(str);
 					$("#suggest").show();	
 				},	
 				error:function(err){
 					console.log(err+" --> 발생함 ");
 				} 	//실패했을 시 함수
 			});
			if($(this).val()==""){
 				$("#suggest").hide();
 				return;
 			}
		});
		$(document).on("click", "a", function(){
 			$("#keyWord").val($(this).text());
 			$("#suggest").hide();
 		});
		
	});
	
</script>	
</head>
<body>
<a href="../jmt?command=member.myBookmark">눌러</a>
<form name="search" id="search">
	<input type="text" maxlength="10" name="keyWord" id="keyWord"/>
	<input type="button" value="검색"/>
</form>
<!--제시어 단어 출력부분 -->
<a href="../jmt?command=restaurant.selectFive">5개씩 가져오기</a>
<c:forEach items="${RestaurantFiveSelect}" var="Five" varStatus = "state">
    <br>
    음식점 이름 : ${Five.resName}<br>
    음식점 사진 : <img src='${Five.reviewImg1 }'>
 </c:forEach>
</body>
</html>