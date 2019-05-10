<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    request.setCharacterEncoding("euc-kr");
    %>
    <jsp:useBean id="regBean" class="chapter16.RegisterBean"/>
    <jsp:setProperty name = "regBean" property="*"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입확인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="..\\script.js"></script>
</head>
<body>
	<table width="80%" align="center" border="0" cellspaction="0"cellpadding="5">
		<tr>
			<td align="center" vailgn="middle">
						<form name="regForm" method="post" action="MemberInsert.jsp">
				<table width="90%" border="0" cellspacing="0" cellpadding="2"
					align="center">
					
		
					
						<tr align="center" >
						
						<td colspan="3">
							<b> <jsp:getProperty property="mem_name" name="regBean" />
								회원님이 작성하신 내용입니다. 확인해 주세요
							</b>
					
							</td>
							
						</tr>
						
						
						
						<tr>
							<td width="24%">아이디</td>
							<td width="41%"><input type ="text" name = "mem_id" readonly value="<jsp:getProperty property="mem_id"
									name="regBean" />"></td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input type = "password" name ="mem_passwd" readonly
							value="<jsp:getProperty property="mem_passwd" name="regBean" />"></td>
						</tr>
						
						<tr>
							<td>이름</td>
							<td><input type ="text" name = "mem_name" readonly value="<jsp:getProperty property="mem_name"
									name="regBean" />"></td>
						</tr>
						
						<tr>
							<td>생년월일</td>
							<td><input type ="text" name = "mem_num1" readonly value="<jsp:getProperty property="mem_num1"
									name="regBean" />"></td>
						</tr>	
						
						
						<tr>
						<td>이메일</td>
						<td><input type ="text" name = "mem_email" size ="30" readonly value="<jsp:getProperty property="mem_email"
									name="regBean" />"></td>
						</tr>
						
						<tr>
						<td>전화번호</td>
							<td><input type ="text" name = "mem_phone" readonly value="<jsp:getProperty property="mem_phone"
									name="regBean" />"></td>
						</tr>
						
						<tr>
						<td>우편번호</td>
							<td><input type ="text" name = "mem_zipcode" readonly value="<jsp:getProperty property="mem_zipcode"
									name="regBean" />"></td>
						</tr>
						
							<tr>
						<td>주소</td>
						<td><input type ="text" name = "mem_address" size ="50" readonly value="<jsp:getProperty property="mem_address"
									name="regBean" />"></td>
						</tr>
						
							<tr>
						<td>직업</td>
						<td><input type ="text" name = "mem_job" readonly value="<jsp:getProperty property="mem_job"
									name="regBean" />"></td>
						</tr>
						
						<tr>
						<td colspan="2" align="center"><input type="submit" value="확인완료">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type ="button" value="다시쓰기" onClick="history.back()">
							</td>
							</tr>
				
				</table>
					</form>
			</td>

		</tr>

	</table>
</body>
</html>