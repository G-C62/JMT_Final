<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<style type="text/css">
.modal-body {
	background-color: white
}
</style>
<script type="text/javascript">
	$(function() {
		$("#popbutton").click(function() {
			$('div.modal').load("join.html")
			$('div.modal').modal("show");
		});
		$("#login").click(function() {
			$('div.modal').load("login.html")
			$('div.modal').modal("show");
		});
	})
</script>
</head>
<body>

<c:choose> 
   <c:when test="${empty sessionScope.memberID}"> <!-- sessionScope에 memberID가 없으면 -->

      <input type="button" class="btn btn-default" id="login" value="로그인">

      <input type="button" class="btn btn-default" id="popbutton" value="회원가입">
      <br />
   </c:when>
       <c:otherwise>
       <input type="button" class="btn btn-default" id="logout" value="로그아웃">
        </c:otherwise>
   </c:choose>
	
	<%-- <c:when test="${sessionScope.memberID != null}">
		<input type="button" class="btn btn-default" id="login" value="로그아웃">
		<br />
	</c:when> --%>
	
	${sessionScope.memberID}님 환영합니다.
	<div class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>
</body>
</html>