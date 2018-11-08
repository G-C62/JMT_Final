<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
</head>
<body>
	
	<h1>음식점 상세 부분</h1>
	<h3>(null 이어도 되는 컬럼은 null일 경우 안 나옵니다.)</h3>
	
	음식점 이름 : ${requestScope.detail.resName} <br>
	음식점 체인점명 : ${requestScope.detail.resChainName} <br>
	음식점 소분류 : ${requestScope.detail.resName} <br>
	음식점 도로명 주소 : ${requestScope.detail.resAddr} <br>
	음식점 동 : ${requestScope.detail.resDong} <br>
	음식점 층 : ${requestScope.detail.resFloor} <br>
	음식점 호 : ${requestScope.detail.resHo} <br>
	
	음식점 사진 :
</body>
</html>