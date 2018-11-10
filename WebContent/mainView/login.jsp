<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal-header">
	<h4 class="modal-title">로그인하기</h4>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
</div>

<!-- Modal body -->
<div class="modal-body">
	<form name="writeForm" method="post">

		<table align="center" cellpadding="5" cellspacing="2" width="600"
			border="2">

			<tr>
				<td width="1220" height="20" colspan="2" bgcolor="pink">
					<p align="center">
						<font color="black" size="3"><b> 로그인 </b></font>
					</p>
				</td>
			</tr>
			<tr>
			<th>ID</th>
			<th><input type="text" ></th>
		</tr>
		<tr>
			<th>Password</th>
			<th><input type="password"></th>
		</tr>
			<tr>
				<td width="450" height="20" colspan="2" align="center"><b><span style="font-size: 9pt;"> 
				<input type=submit value=로그인하기></span></b></td>
			</tr>
		
		</table>
	</form>

</div>

<!-- Modal footer -->
<div class="modal-footer">
	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
</div>