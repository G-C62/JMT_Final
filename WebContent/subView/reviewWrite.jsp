<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/sub.css">
<style>
.modal-body{background-color:white}
</style>
<script language=javascript>
function checkValid() {
    var f = window.document.writeForm;
		
	if ( f.reviewSubject.value == "" ) {
		alert( "제목을 입력해 주세요." );
		f.reviewSubject.focus();
		return false;
	}
	if ( f.reviewContent.value == "" ) {
		alert( "내용을 입력해 주세요." );
		f.reviewContent.focus();
		return false;
	}
    return true;
}
</script>

</head>
<body>
<div class="modal-body">

<form name="writeForm" method="post" action="../elec?command=insert" 
  onSubmit='return checkValid()' enctype="multipart/form-data">

<table align="center" cellpadding="5" cellspacing="2" width="600" border="1">

    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="pink">
            <p align="center"><font color="black" size="3"><b> 내가 쓴 리뷰 </b></font></p>
        </td>
    </tr>

    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">상호명</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type=text name="resName" size="20" maxlength="15"> (음식점 추천시 좋아요 누르기)<img src="${pageContext.request.contextPath}/img/like.jpg" id="likeImg" style="cursor:pointer"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">아이디</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type="text" name="memberID" size="20"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">리뷰 제목</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<input type=text name="reviewSubject" size="40" maxlength="50"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">리뷰 내용<br>(200자 이내)</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="reviewContent" rows=10 cols=40 ></textarea></span></b></td>
    </tr>
    
     <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">날짜</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
        	<input type="text" name="sysdate"></span></b></td>
    </tr>
    
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">이미지 파일 첨부</span></b></p>
        </td>
        <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        	파일첨부:<input type="file" name="file"/><br><br>
        	파일첨부:<input type="file" name="file"/><br><br>
        	파일첨부:<input type="file" name="file"/><br><br>
        	   </span></b>
        </td>
    </tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
        <input type=submit value=등록하기> 
        <input type=reset value=다시쓰기></span></b></td>
    </tr>
</table>
</form>
</div>

<hr>
</body>
</html>

