<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
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
			
					<!-- 완성된 폼을 RegisterProc.jsp로 보냄 -->
					
						<tr align="center">
						
									<td colspan="3"><b>회원가입</b> </td>
									
						</tr>

						<tr>
							<td width="37%">아이디</td>
							<td width="18%"><input type="text" name="mem_id" size="15"><input type="button" value="중복확인" onClick="idCheck(this.form.mem_id.value)"><!-- 중복확인 버튼을 누르면 script idCheck(이 form 안에있는 mem_id의 값) --></td>
							<td width="45%">아이디를 적어주세요.</td>
						</tr>

						<tr>
							<td>패스워드</td>
							<td><input type="password" name="mem_passwd" size="15"></td>
							<td>패스워드를 적어주세요</td>
						</tr>
		

		<tr>
			<td>패스워드확인</td>
			<td><input type="password" name="mem_repasswd" size="15"></td>
			<td>패스워드를 적어주세요</td>
		</tr>

		<tr>
			<td>이름</td>
			<td><input type="text" name="mem_name" size="15"></td>
			<td>고객 실명을 적어주세요</td>
		</tr>

		<tr>
			<td>생년월일</td>
			<td><input type="text" name="mem_num1" size="6" maxlength="6" onKeyUp="if(this.value.length==6)regForm.mem_num2.focus()"></td>
			<td>생년월일을 적어주세요</td>
		</tr>

		<tr>
			<td>이메일</td>
			<td><input type="text" name="mem_email" size="27"></td>
			<td>이메일을 적어주세요</td>
		</tr>

		<tr>
			<td>전화번호</td>
			<td><input type="text" name="mem_phone" size="20"></td>
			<td>연락처를 적어주세요</td>
		</tr>
		
		<tr>
			<td>우편번호</td>
			<td><input type="text" name="mem_zipcode" size="7"> <input type="button" value="우편번호찾기" onClick="zipCheck()"></td>
				<!-- js에 있는 zipCheck -->
			<td>우편번호를 검색하세요</td>
		</tr>

		<tr>
			<td>주소</td>
			<td><input type="text" name="mem_address" size="70"></td>
			<td>주소를 적어주세요</td>
		</tr>

		<tr>
			<td>직업</td>
			<td><select name=mem_job>
					<option value="0">선택하세요.
					<option value="회사원">회사원
					<option value="연구전문직">연구전문직
					<option value="교수학생">교수학생
					<option value="일반자영업">일반자영업
					<option value="공무원">공무원
					<option value="의료인">의료인
					<option value="법조인">법조인
					<option value="종언예">종언예
					<option value="농축수광">농축수광
					<option value="주부">주부
					<option value="갓수">갓수
					<option value="기타">기타
			</select></td>
			<td>직업을 선택하세요</td>
		</tr>


		<tr>
			<td colspan="3" align="center"><input type="button" value="회원가입" onclick="inputCheck()">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="reset" value="다시쓰기"></td>
		</tr>


		
		
	</table>
	</form>
	</td>

	</tr>

	</table>
</body>
</html>