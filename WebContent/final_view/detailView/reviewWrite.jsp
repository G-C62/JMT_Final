<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-header">
	<h4 class="modal-title">리뷰작성</h4>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<div class="modal-body">
<style type="text/css">
	img {width:20px; height:20px}
</style>
<script src="${pageContext.request.contextPath}/lib/jquery-3.3.1.min.js"></script>
<script language=javascript>
	$(function() {
		$("#reviewIsLike").val("true");
		//var viewText = $("[name=viewText]").val(); 
		//$("[name=viewText]").val( viewText.replace(regEx, toStr) );
		
	   $("#reviewBtn").click(function() {
	      var img1 = document.getElementById('thumbUpImg');
	      var str = "";
	      var trueOrFalse = $("#reviewIsLike").val();
	      if (img1.src.indexOf('_fill') == -1) { //_fill이라는 단어가 존재하지 않으면 thumbUp.png을 보여줌
	         img1.src = img1.src.replace('.png', '_fill.png');
	      
	         $("#reviewIsLike").val(trueOrFalse.replace('false','true'));
	      	  //alert($(this).val());
	          str = "추천!";
	         
	      } else
	      { 
	         img1.src = img1.src.replace('_fill.png', '.png');

	         $("#reviewIsLike").val(trueOrFalse.replace('true','false'));
	         //alert($(this).val());
	         str = "비추ㅠ";
	      }
	      
	      $("#like").empty();
          $("#like").append(str);

	   });
	   
	});
	
	function checkValid() {
	    var f = window.document.writeForm;
			
		if ( f.reviewTitle.value == "" ) {
			alert( "제목을 입력해 주세요." );
			f.reviewTitle.focus();
			return false;
		}
		if ( f.reviewContents.value == "" ) {
			alert( "내용을 입력해 주세요." );
			f.reviewContents.focus();
			return false;
		}
		
	    return true;
	}
	
	

</script>
	
</head>

<form name="writeForm" method="post" action="${path}/jmt?command=review.insert" 
  onSubmit='return checkValid()' enctype="multipart/form-data">

<table align="center" cellpadding="5" cellspacing="2" width="600" border="1" >


	
    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="pink">
            <p align="center"><font color="black" size="3"><b> 리뷰쓰기 </b></font></p>
        </td>
    </tr>

    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">상호명</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type="text" value="${param.resName}" name="resName"  size="20" maxlength="15" > 
		
		<div id = "like">추천!</div>
		
        <div id="reviewBtn" >
           <img src="${pageContext.request.contextPath}/img/thumbUp_fill.png"
              id="thumbUpImg" style="cursor: pointer" />
        </div>
		</span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">아이디</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<input type="text" name="memberId" size="20" value="${param.memberId}"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">리뷰 제목</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<input type=text name="reviewTitle" size="40" maxlength="50"></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">리뷰 내용<br>(200자 이내)</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
		<textarea name="reviewContents" rows=10 cols=40 ></textarea></span></b></td>
    </tr>
    
     <!-- <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">날짜</span></b></p>
        </td>
        <td width="450" height="20"><b><span style="font-size:9pt;">
        	<input type="text" name="sysdate"></span></b></td>
    </tr> -->
    
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">이미지 파일 첨부</span></b></p>
        </td>
        <td width="450" height="20">
        	<b><span style="font-size:9pt;">
        	파일첨부:<input type="file" name="reviewImg1"/><br><br>
        	파일첨부:<input type="file" name="reviewImg2"/><br><br>
        	파일첨부:<input type="file" name="reviewImg3"/><br><br>
        	   </span></b>
        </td>
    </tr>
    <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
        <input type="submit" value="등록하기"> 
        <input type= "reset" value="다시쓰기"></span></b></td>
    </tr>
</table>

	<input type=hidden name="resId" value="${param.resId}">
	<input type=hidden id ="reviewIsLike" name="reviewIsLike" value="true">
	
</form>

<hr>
</div>
<!-- Modal footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>