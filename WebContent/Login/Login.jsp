<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String mem_id=(String)session.getAttribute("idKey");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="../script.js"></script>
</head>
<body>
<%
if(mem_id != null){
	response.sendRedirect("../ProductList.jsp");
%>

<%} else{%>


<form name="login" method="post" action="LoginProc.jsp">
<table>


<tr>
<td>아이디</td>
<td><input type="text" name="mem_id"></td>
</tr>

<tr>
<td>비번</td>
<td><input type="password" name="mem_passwd"></td>
</tr>

<tr>
<td colspan="2"><div align="right">
<input type="button" value="로그인" onclick="loginCheck()">
&nbsp;<input type="button" value="회원가입" onclick="memberReg()"/></div></td>
</tr>


</table>
</form>
<%} %>
</body>
</html>