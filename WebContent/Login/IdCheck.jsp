<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="memMgr" class="chapter16.MemberMgr"></jsp:useBean>
<%String mem_id = request.getParameter("mem_id");
boolean check = memMgr.checkId(mem_id);%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ID�ߺ�üũ</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="script.js"></script>
</head>
<body bgcolor="#FFFFCC">
<br>

<b><%=mem_id %></b>
<%
if(check){
	out.print("�� �̹� �����մϴ�.<p>");
}else{
	out.print("�� ��밡���մϴ�.<p>");
}
%>

<a href="#" onClick="self.close()">�ݱ�</a>

</body>
</html>