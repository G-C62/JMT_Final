<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function loadImage(){
	location.href="${pageContext.request.contextPath}/jmt?command=restaurant.selectFive";
}
</script>
</head>

<body onload="loadImage()">
</body>
</html>