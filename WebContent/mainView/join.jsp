<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-header">
	<h4 class="modal-title">회원가입하기</h4>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>
<!-- 모달에서 ajax사용하는게 달라 코드만 작성
프론트 쪽에서 확인 해주어야함 -->
<script type="text/javascript">
$(function(){
	$("#memberID").keyup(function(){
    	$.ajax({
    		url: "../idCheckServlet" , // 서버요청주소
    		type: "post", //get or post요청방식
    		dataType: "text" , //서버가보내오는 데이터타입(text,html,json,xml)
    		data:"id="+ $(this).val(), //서버에게 보내는 parameter정보
    		success: function(result){//중복, 사용가능
    			
    			$("#idCheck").text(result);
    		} ,
    		error: function(err){
    			alert(err+"=> 예외발생...");
    		}
    	});
    }) 
})
 
/* function checkValid(){
	 if(re=="이미사용중입니다."||re==""){
		 $("#memberID").val("");
		 $("#memberID").focus();
		 return false;
	 }
 } */
</script>
<!-- Modal body -->
<div class="modal-body">
	<form name="writeForm" method="post" action="${pageContext.request.contextPath}/jmt?command=member.signup">

		<table align="center" cellpadding="5" cellspacing="2" width="600"
			border="1">

			<tr>
				<td width="1220" height="20" colspan="2" bgcolor="#00cc00">
					<p align="center">
						<font color="white" size="3"><b> 회원가입 </b></font>
					</p>
				</td>
			</tr>
			<tr>
				<td colspan="2">*는 필수 사항입니다.</td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">*아이디
						</span></b>
						
					</p>
					
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text name="memberID" id="memberID"
							size="20" maxlength="15">
							<span id="idCheck"> 아이디 중복체크 </span></span></b></td>
				
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">*비밀번호</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=password
							name="password" size="20"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">*이름</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text name="name"
							size="20"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">*핸드폰 번호</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type="text" size="10" name="phone1">-
				<input type="text" size="10" name="phone2">-
				<input type="text" size="10" name="phone3"></span></b></td>
			</tr>

			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">*성별</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type="radio" name="gender"
							value="남"> 남 <input type="radio" name="gender"
							value="여" checked> 여
					</span></b></td>
			</tr>

			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">이메일</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type="email"
							name="email" size="30">
					</span></b></td>
			</tr>
			<tr>
				<td width="450" height="20" colspan="2" align="center"><b><span
						style="font-size: 9pt;"> <input type=submit value=가입하기>
							<input type=reset value=다시쓰기></span></b></td>
			</tr>
		</table>
`
	</form>

</div>

<!-- Modal footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>
