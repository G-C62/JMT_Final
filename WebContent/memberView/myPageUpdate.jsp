<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-header">
	<h4 class="modal-title">회원 수정 하기</h4>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<!-- Modal body -->
<div class="modal-body">
	<form name="writeForm" method="post" action="../elec?command=insert"
		onSubmit='return checkValid()' enctype="multipart/form-data">

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
							size="20" maxlength="15"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">비밀번호</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span style="font-size: 9pt;">
					 <input type=password name="password" size="20" maxlength="15">
					 <input type="button" value="비밀번호 확인하기">	
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
							size="20"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">핸드폰 번호</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type="text" size="10">-<input
							type="text" size="10">-<input type="text" size="10"></span></b></td>
			</tr>

			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">성별</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type="radio" name="gender"
							value="man"> 남 <input type="radio" name="gender"
							value="woman" checked> 여
					</span></b></td>
			</tr>

			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">이메일</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=password
							name="password" size="30">
					</span></b></td>
			</tr>
			<tr>
				<td width="450" height="20" colspan="2" align="center"><b><span
						style="font-size: 9pt;"> <input type=submit value=수정하기>
							<input type=reset value=다시쓰기></span></b></td>
			</tr>
		</table>
	</form>

</div>

<!-- Modal footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>