<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="script.js"></script>
</head>

<body onLoad="regForm.mem_id.focus()">
	<br>
	<br>
	
	
	
	<table align="center" border="0" cellspaction="0" cellpadding="5">
		<tr>
		
			<td align="center" vailgn="middle">
				<form name="regForm" method="post" action="RegisterProc.jsp">
				<table border="0" cellspacing="0" cellpadding="2" align="center">
			
					<!-- �ϼ��� ���� RegisterProc.jsp�� ���� -->
					
						<tr align="center">
						
									<td colspan="3"><b>ȸ������</b> </td>
									
						</tr>

						<tr>
							<td width="37%">���̵�</td>
							<td width="18%"><input type="text" name="mem_id" size="15"><input type="button" value="�ߺ�Ȯ��" onClick="idCheck(this.form.mem_id.value)"><!-- �ߺ�Ȯ�� ��ư�� ������ script idCheck(�� form �ȿ��ִ� mem_id�� ��) --></td>
							<td width="45%">���̵� �����ּ���.</td>
						</tr>

						<tr>
							<td>�н�����</td>
							<td><input type="password" name="mem_passwd" size="15"></td>
							<td>�н����带 �����ּ���</td>
						</tr>
		

		<tr>
			<td>�н�����Ȯ��</td>
			<td><input type="password" name="mem_repasswd" size="15"></td>
			<td>�н����带 �����ּ���</td>
		</tr>

		<tr>
			<td>�̸�</td>
			<td><input type="text" name="mem_name" size="15"></td>
			<td>�� �Ǹ��� �����ּ���</td>
		</tr>

		<tr>
			<td>�������</td>
			<td><input type="text" name="mem_num1" size="6" maxlength="6" onKeyUp="if(this.value.length==6)regForm.mem_num2.focus()"></td>
			<td>��������� �����ּ���</td>
		</tr>

		<tr>
			<td>�̸���</td>
			<td><input type="text" name="mem_email" size="27"></td>
			<td>�̸����� �����ּ���</td>
		</tr>

		<tr>
			<td>��ȭ��ȣ</td>
			<td><input type="text" name="mem_phone" size="20"></td>
			<td>����ó�� �����ּ���</td>
		</tr>
		
		<tr>
			<td>�����ȣ</td>
			<td><input type="text" name="mem_zipcode" size="7"> <input type="button" value="�����ȣã��" onClick="zipCheck()"></td>
				<!-- js�� �ִ� zipCheck -->
			<td>�����ȣ�� �˻��ϼ���</td>
		</tr>

		<tr>
			<td>�ּ�</td>
			<td><input type="text" name="mem_address" size="70"></td>
			<td>�ּҸ� �����ּ���</td>
		</tr>

		<tr>
			<td>����</td>
			<td><select name=mem_job>
					<option value="0">�����ϼ���.
					<option value="ȸ���">ȸ���
					<option value="����������">����������
					<option value="�����л�">�����л�
					<option value="�Ϲ��ڿ���">�Ϲ��ڿ���
					<option value="������">������
					<option value="�Ƿ���">�Ƿ���
					<option value="������">������
					<option value="����">����
					<option value="�������">�������
					<option value="�ֺ�">�ֺ�
					<option value="����">����
					<option value="��Ÿ">��Ÿ
			</select></td>
			<td>������ �����ϼ���</td>
		</tr>


		<tr>
			<td colspan="3" align="center"><input type="button" value="ȸ������" onclick="inputCheck()">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="reset" value="�ٽþ���"></td>
		</tr>


		
		
	</table>
	</form>
	</td>

	</tr>

	</table>
</body>
</html>