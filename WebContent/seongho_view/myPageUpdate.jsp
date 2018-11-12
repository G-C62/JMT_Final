<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="./lib/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	re ="";
 $("#password").keyup(function(){
        	 $.ajax({
         		url: "passCheckServlet" , // 서버요청주소
         		type: "post", //get or post요청방식
         		dataType: "text" , //서버가보내오는 데이터타입(text,html,json,xml)
         		data: "password="+ $(this).val() ,
         		success: function(result){// 0 , 1
       				
         			$("#passCheck").val("");
         			re=result;
         			$("#passCheck").val(result);
         		
         			
         			
         			/* if(result > 0){
         			//text박스를 모두 지우기
         			 $("input[type=text]").val("");
         			
         			 //화면갱신
         			 selectAll();
         			
         			}else{
         				alert("성공하였습니다.");
         			} */
         			
         		} ,
         		error: function(err){
         			alert(err+"=> 예외발생...");
         		}
         	});
         });
})
function checkValid(){
	if(re=="비밀번호가 일치하지 않습니다"||re==""){
		return false;
	}
}
 </script>
</head>
<body>
	<div class="modal-header">
		<h4 class="modal-title">회원 수정 하기</h4>
		<button type="button" class="close" data-dismiss="modal">&times;</button>
	</div>

	<!-- Modal body -->
	<div class="modal-body">
		<form name="writeForm" method="post" action="./jmt?command=member.update"
		onSubmit='return checkValid()'>

			<table align="center" cellpadding="5" cellspacing="2" width="600"
				border="1">

				<tr>
					<td width="1220" height="20" colspan="2" bgcolor="#00cc00">
						<p align="center">
							<font color="white" size="3"><b> 회원 수정 </b></font>
						</p>
					</td>
				</tr>
				<tr>
					<td width="150" height="20">
						<p align="right">
							<b><span style="font-size: 9pt;">아이디</span></b>
						</p>
					</td>
					<td width="450" height="20"><b><span
							style="font-size: 9pt;"> <input type=text name="memberID"
								size="20" maxlength="15" value="${memberDTO.getMemberId()}" ></span></b></td>
				</tr>
				<tr>
					<td width="150" height="20">
						<p align="right">
							<b><span style="font-size: 9pt;">비밀번호</span></b>
						</p>
					</td>
					<td width="450" height="20"><b><span
							style="font-size: 9pt;"> <input type="password"
								name="password" id="password" size="20" maxlength="15"
								value=""> 
								<input type="text" id="passCheck" value="비밀번호 확인하기" >	
						</span></b></td>
				</tr>
				<tr>
					<td width="150" height="20">
						<p align="right">
							<b><span style="font-size: 9pt;">이름</span></b>
						</p>
					</td>
					<td width="450" height="20"><b><span
							style="font-size: 9pt;"> <input type=text name="name"
								value="${memberDTO.getMemberName()}" size="20"></span></b></td>
				</tr>
				<tr>
					<td width="150" height="20">
						<p align="right">
							<b><span style="font-size: 9pt;">핸드폰 번호</span></b>
						</p>
					</td>
					<td width="450" height="20"><b><span
							style="font-size: 9pt;"> <input type="text" size="10"
								name="phone1" value="${phone1}">-<input type="text"
								size="10" name="phone2" value="${phone2}">-<input
								type="text" size="10" name="phone3" value="${phone3}"></span></b></td>
				</tr>

				<tr>
					<td width="150" height="20">
						<p align="right">
							<b><span style="font-size: 9pt;">*성별</span></b>


						</p>
					</td>

					<td width="450" height="20" ><b> <span
							style="font-size: 9pt;">
							<c:choose>
								<c:when test="${memberDTO.getMemberGender() == '남'}">
							 <input type="radio" name="gender" value="남" checked="checked">남
							 <input type="radio" name="gender" value="여" disabled="disabled">여
							 </c:when>
							<c:when test="${memberDTO.getMemberGender() == '여'}">
							 <input type="radio" name="gender" value="남" disabled="disabled">남
							 <input type="radio" name="gender" value="여"  checked="checked">여
							</c:when>
							 </c:choose>
						</span></b></td>

				</tr>

				<tr>
					<td width="150" height="20">
						<p align="right">
							<b><span style="font-size: 9pt;">이메일</span></b>
						</p>
					</td>
					<td width="450" height="20"><b><span
							style="font-size: 9pt;"> <input type="email" name="email"
								value="${memberDTO.getMemberEmail()}" size="30">
						</span></b></td>
				</tr>
				<tr>
					<td width="450" height="20" colspan="2" align="center"><b><span
							style="font-size: 9pt;"> <input type=submit value=수정하기 id="updateClick">
								<input type=reset value=다시쓰기></span></b></td>
				</tr>
			</table>
		</form>

	</div>

	<!-- Modal footer -->
	<div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	</div>


</body>
</html>



