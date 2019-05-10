<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="script.js"></script>
 
<%
String mem_id=(String)session.getAttribute("idKey");
String log="";
if(mem_id == null) log ="<a href=./Login/Login.jsp>로그인</a>";
else log="<a href=./Login/Logout.jsp>로그아웃</a>";

String mem="";
if(mem_id==null)mem="<a href=Register.jsp>회원가입</a>";
else mem="<a href=MemberUpdate.jsp>회원수정</a>";
%>
<br>


<table width="75%" align="center"  border="0">
<tr>
<td align="center"><b><%=log %></b></td>
<td align="center"><b><%=mem %></b></td>
<td align="center"><b><a href="ProductList.jsp">상품목록</a></b></td>
<td align="center"><b><a href="CartList.jsp"> 장바구니</a></b></td>
<td align="center"><b><a href="OrderList.jsp">구매목록</a></b></td>
</tr>
</table>