<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    request.setCharacterEncoding("euc-kr"); 
    %>
    <jsp:useBean id="memMgr" class="chapter16.MemberMgr"/>
    <jsp:useBean id="regBean" class="chapter16.RegisterBean"/>
    <jsp:setProperty name ="regBean" property="*"/>
    <%
    boolean flag= memMgr.memberInsert(regBean);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>가입확인</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="script.js"></script>
</head>
<body bgcolor="#FFFFCC">
<br><br>
<%
if(flag){
	out.println("<b>회원가입을 축하드립니다</b><p>");
	out.println(regBean.getMem_id());
	out.println("<a href=Login.jsp>로그인</a>");
}
else{
	out.println("<b>다시 입력해 주십시오</b><p>");
	out.println("<a href=Register.jsp>다시가입</a>");
	
}


%>

</body>
</html>