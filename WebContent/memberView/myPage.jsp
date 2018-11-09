<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link href="../css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<link href="../css/custom.css" rel="stylesheet">
<link href="../css/responsive-style.css" rel="stylesheet">
<link rel="stylesheet" href="../css/font-awesome.min.css" />
<link href="../css/lightbox.min.css" rel="stylesheet">
<link rel="stylesheet" href="../css/loaders.css" />
<link rel="stylesheet" href="../css/sub.css">

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
		$("#memberUpdate").click(function() {
			$('div.modal').load("myPageUpdate.jsp")
			$('div.modal').modal("show");
		});
	});
</script>
</head>
<body>
	<div class="top-head left">
		<div class="row">
			<div class="col-md-6 col-lg-4">
				<div onclick="location.href='../mainView/JmtMain.jsp'" style="cursor:pointer">
					<h1>#JMT<br> 판교 맛따라 멋따라</h1><br><br><br>
				</div>
				<div style="float: left;margin-top: -19px;">
				<h2>나의 정보 수정하기</h2>
				</div>
				<div style="float: right;">
				<input type="button" class="btn btn-default" id="memberUpdate" value="수정하기" float="left">
				</div>
			</div>
		</div>
	</div>

	<div>

		<div class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- remote ajax call이 되는영역 -->
				</div>
			</div>
		</div>
	</div>
	
	<script src="../js/jquery.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/core.js"></script>
</body>
</html>