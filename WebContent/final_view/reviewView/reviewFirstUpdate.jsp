<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<HEAD>
<link rel="stylesheet" href="css/style.css">
<style>
	.resImg{width:50px; height:50px}
</style>

<SCRIPT language=javascript>
function sendUpdate(){//수정폼
	document.requestForm.command.value ="review.update";
	document.requestForm.submit();
}

function sendDelete(){//삭제
	document.requestForm.command.value ="review.delete";
	document.requestForm.submit();
}

</script>

</HEAD>


<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
    <tr>
        <td width="1220" height="20" colspan="4" bgcolor="#00cc00">
            <p align="center"><font color="white" size="3"><b>
            리뷰수정 확인</b></font></p>
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
        <td width="450" height="20" ><b><span style="font-size:9pt;">${requestScope.reviewDTO.reviewTitle}</span></b></td>
    </tr>
    <tr>
        <td width="150" height="100" >
            <p align="right"><b><span style="font-size:9pt;">리 뷰 내 용</span></b></p>
        </td>
        <td width="450" height="100" ><b><span style="font-size:9pt;">${requestScope.reviewDTO.reviewContents}</span></b></td>
    </tr>
   
       <tr>
        <td width="100" height="20">
            <p align="right"><b><span style="font-size:9pt;">이미지 파일 첨부</span></b></p>
        </td>
        <td width="450" height="20" colspan="3">
        	<span style="font-size:9pt;"><b>
        		이미지 파일 1 : <img class = 'resImg' src='${requestScope.reviewDTO.reviewImg1}'> ${requestScope.reviewDTO.reviewImg1} <br>
        		이미지 파일 2 : <img class = 'resImg' src='${requestScope.reviewDTO.reviewImg2}'> ${requestScope.reviewDTO.reviewImg2}<br>
        		이미지 파일 3 : <img class = 'resImg' src='${requestScope.reviewDTO.reviewImg3}'> ${requestScope.reviewDTO.reviewImg3}<br>
        	</span>
        </td> 
    </tr>
    
    <form name="requestForm" method=post action="${pageContext.request.contextPath}/jmt">
	     <tr>
	        <td height="20" colspan="4" align="center" valign="middle">
				<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
					<input type=hidden name="reviewId" value="${requestScope.reviewDTO.reviewId}">
					<input type=hidden name="command" value="">
					<input type=button value="수정하기" onClick="sendUpdate()">
					<input type=button value="삭제하기" onClick="sendDelete()">
	
			</td>
	    </tr>   
    </form>
</table>

<hr>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/jmt?command=review.selectAll">리스트로 돌아가기</a>&gt;</span></div>










