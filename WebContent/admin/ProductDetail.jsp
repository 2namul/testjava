<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import ="java.util.*, chapter16.*, java.net.*" %>
 <jsp:useBean id="proMgr" class="chapter16.ProductMgr"></jsp:useBean>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>쇼핑몰 관리자</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="..\\script.js"></script>
</head>




<body topmargin="100">
<jsp:include page="..\\Top.jsp"></jsp:include>
  <%ProductBean product=proMgr.getProduct(request.getParameter("no"));%>


<table width="75%" align="center" border="0">
<tr>

<td align="center" >

<table width="75%" align="center" border="0">

<tr>
<td ><br></td>
</tr>
<tr>
<td colspan="3" align="center"><b><%=product.getName() %></b></td>
</tr>

<tr>
<td ><br></td>
</tr>

<tr>
<td width="20%"><img src="..\\data\\<%=URLEncoder.encode(product.getImage(),"euc-kr")%>" width="125">
</td>
<td width="50%" valign="top">

<table width="100%" height="100%">
<tr>
<td><b>상품이름:</b><%=product.getName() %></td>
</tr>
<tr>
<td><b>가    격:</b><%=product.getPrice() %></td>
</tr>
<tr>
<td><b>입고날짜:</b><%=product.getDate() %></td>
</tr>
<tr>
<td><b>재     고:</b><%=product.getStock() %></td>
</tr>
</table>

</td>

<td width="50%" valign="top"><b>상세설명</b><br><pre><%=product.getDetail() %></pre></td>
</tr>

<tr>
<td colspan="3" align="center">
<a href = "javascript:productUpdate('<%=product.getNo() %>')">수정하기</a>&nbsp;&nbsp;&nbsp;
<a href = "javascript:productDelete('<%=product.getNo() %>')">삭제하기</a>
</td>
</tr>
</table>

</td>
</tr>
</table>
  <jsp:include page="..\\Bottom.jsp"></jsp:include>
  
<form name="update" method="post" action="ProductUpdate.jsp">
<input type=hidden name=no></form>  
<form name="del" method="post" action="ProductProc.jsp?flag=delete">
<input type=hidden name=no></form>  

</body>
</html>