<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<link href="${pageContext.request.contextPath}/css/custom.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/responsive-style.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css" />
<link href="${pageContext.request.contextPath}/css/lightbox.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/loaders.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sub.css">

<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style type="text/css">
h2{color:#fff;font-size:40px;font-weight:600}
.modal-body {
	background-color: white
}
</style>

<script type="text/javascript">
	$(function() {
		$("#update").click(function() {
			$('div.modal').load("${pageContext.request.contextPath}/jmt?command=member.updateForm")
			$('div.modal').modal("show");
		});
	});
</script>
</head>
<body>
	<div class="top-head left">
		<div class="row" style="padding-left:50px;">
			<div class="col-md-6 col-lg-4">
				<div onclick="location.href='${pageContext.request.contextPath}/jmt?command=restaurant.selectFive'" style="cursor:pointer">
					<h1>#JMT<br> 판교 맛따라 멋따라</h1><br><br><br>
				</div>
				<div style="float: left;margin-top: -19px;">
				<h2>나의 정보 수정하기</h2>
				</div>
				<div style="float: right;">
				<input type="button" class="btn btn-default" id="update" value="회원정보수정">
				<input type="button" class="btn btn-default" id="delete"
				value="회원탈퇴" onclick="location.href='${pageContext.request.contextPath}/jmt?command=member.delete'">
				</div>
			</div>
		</div>
	</div>

	<div>
		<div class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content"></div>
			</div>
		</div>
	</div>
	<%@include file="../final_view/reviewView/myReview.jsp" %>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/core.js"></script>
</body>
</html>