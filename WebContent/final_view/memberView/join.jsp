<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-header">
	<h4 class="modal-title">�쉶�썝媛��엯�븯湲�</h4>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<!-- Modal body -->
<div class="modal-body">
	<form name="writeForm" method="post" action="../elec?command=insert"
		onSubmit='return checkValid()' enctype="multipart/form-data">

		<table align="center" cellpadding="5" cellspacing="2" width="600"
			border="2px">

			<tr>
				<td width="1220" height="20" colspan="2" bgcolor="pink">
					<p align="center">

					</p>
				</td>
			</tr>
			<tr>
				<td colspan="2">*�뒗 �븘�닔 �궗�빆�엯�땲�떎.</td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">*�븘�씠�뵒</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text name="memberID"
							size="20" maxlength="15"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">*鍮꾨�踰덊샇</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=password
							name="password" size="20">(15자 이내로 입력해주세요)</span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">*�씠由�</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=text name="name"
							size="20"></span></b></td>
			</tr>
			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">*�빖�뱶�룿 踰덊샇</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type="text" size="10">-<input
							type="text" size="10">-<input type="text" size="10"></span></b></td>
			</tr>

			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">*�꽦蹂�</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type="radio" name="gender"/>

					</span></b></td>
			</tr>

			<tr>
				<td width="150" height="20">
					<p align="right">
						<b><span style="font-size: 9pt;">�씠硫붿씪</span></b>
					</p>
				</td>
				<td width="450" height="20"><b><span
						style="font-size: 9pt;"> <input type=password
							name="password" size="30">
					</span></b></td>
			</tr>
			<tr>
				<td width="450" height="20" colspan="2" align="center"><b><span
						style="font-size: 9pt;"> <input type=submit value=媛��엯�븯湲�>
							<input type=reset value=�떎�떆�벐湲�></span></b></td>
			</tr>
		</table>

	</form>

</div>

<!-- Modal footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>