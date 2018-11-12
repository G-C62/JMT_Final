<%@ page info="게시판 수정하기" contentType="text/html;charset=UTF-8" %>
<HTML>
<HEAD>
<link rel="stylesheet" href="css/style.css">
<style>
	.resImg{width:50px; height:50px}
</style>

<SCRIPT >
function checkValid() {
	var f = window.document.updateForm;
	
} 
 
</SCRIPT>

</HEAD>

<BODY>
 <form name=updateForm method=post action="${pageContext.request.contextPath}/jmt" onSubmit="return checkValid()">
	<input type="hidden" name="command" value="review.update" >
	<input type='hidden' name='reviewId' value="${requestScope.reviewDTO.reviewId}">
	<table align="center" cellpadding="5" cellspacing="1" width="600" border="1">
    <tr>
        <td width="1220" height="20" colspan="2" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b> 업데이트 두번째 페이지</b></font></p>
        </td>
    </tr>
    
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">음식점 상호명</span></b></p>
        </td>
        <td width="450" height="20" colspan="3" >
        	<span style="font-size:9pt;"><b>${requestScope.reviewDTO.resName}</b></span>
		</td>
    </tr>
    <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">멤버 아이디</span></b></p>
        </td>
        <td width="450" height="20" colspan="3" >
        	<span style="font-size:9pt;"><b>${requestScope.reviewDTO.memberId}</b></span>
		</td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">리 뷰 제 목</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="reviewTitle"  >${requestScope.reviewDTO.reviewTitle}</textarea></span></b></td>
    </tr>
    <tr>
        <td width="150" height="20" >
            <p align="right"><b><span style="font-size:9pt;">리 뷰 내 용</span></b></p>
        </td>
        <td width="450" height="20" ><b><span style="font-size:9pt;">
		<textarea name="reviewContents" cols="50" rows="10">${requestScope.reviewDTO.reviewContents}</textarea></span></b></td>
    </tr>
    
    <%-- <tr>
        <td width="150" height="20">
            <p align="right"><b><span style="font-size:9pt;">이미지 파일 첨부</span></b></p>
        </td>
        <td width="450" height="20">
        	<b>
        	<span style="font-size:9pt;"><b>
        		이미지 파일 1 : <img class = 'resImg' src='${requestScope.reviewDTO.reviewImg1}'> ${requestScope.reviewDTO.reviewImg1}
        		이미지 파일 2 : <img class = 'resImg' src='${requestScope.reviewDTO.reviewImg2}'> ${requestScope.reviewDTO.reviewImg2}
        		이미지 파일 3 : <img class = 'resImg' src='${requestScope.reviewDTO.reviewImg3}'> ${requestScope.reviewDTO.reviewImg3}
        	</span>
        	</b>
        </td>
    </tr> --%>
    
   
     <tr>
        <td width="450" height="20" colspan="2" align="center"><b><span style="font-size:9pt;">
		
		<input type="submit" value="수정완료">
    </tr>
</table>
		<input type=hidden name="reviewId" value="${requestScope.reviewDTO.reviewId}">
		<input type=hidden name="reviewDate" value="${requestScope.reviewDTO.reviewDate}">
		<input type=hidden name="memberId" value="${requestScope.reviewDTO.memberId}">
		<input type=hidden name="resId" value="${requestScope.reviewDTO.resId}">
		<input type=hidden name="resName" value="${requestScope.reviewDTO.resName}">
		<input type=hidden name="reviewIsLike" value="${requestScope.reviewDTO.reviewIsLike}">
		<input type=hidden name="reviewImg1" value="${requestScope.reviewDTO.reviewImg1}">
		<input type=hidden name="reviewImg2" value="${requestScope.reviewDTO.reviewImg2}">
		<input type=hidden name="reviewImg3" value="${requestScope.reviewDTO.reviewImg3}">
</form>
<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/jmt?command=review.selectAll">리스트로 돌아가기</a>&gt;</span></div>
</BODY>
</HTML>












 