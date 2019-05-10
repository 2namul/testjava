<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.*, chapter16.*" %>    
<jsp:useBean id ="proMgr" class="chapter16.ProductMgr"></jsp:useBean>
<html>
<head>
<meta charset="EUC-KR">
<title>쇼핑몰</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="../script.js"></script>
</head>
<body topmargin="100">
<jsp:include page="Top.jsp"></jsp:include>
<%Vector vResult=proMgr.getProductList(); %>
<table width="75%" align="center" border="0">
<tr>
<td>
<table width="75%" align="center" border="0">
<tr>
<td><br></td>
</tr>
<tr>
<td>이름</td>
<td>가격</td>
<td>날짜</td>
<td>재고</td>
<td>&nbsp;</td>
</tr>
<%
for(int i = 0; i<vResult.size(); i++){
	ProductBean product = (ProductBean)vResult.get(i);
	%>
<tr>	
<td><%=product.getName() %></td>
<td><%=product.getPrice() %></td>
<td><%=product.getDate() %></td>
<td><%=product.getStock() %></td>
<tr>
<td><br></td>
</tr>
<tr>
<td>
<a href="javascript:productDetail('<%=product.getNo() %>')">상세보기</a>
</td>

</tr>
<%} %>
</table>
</td>
</tr>
</table>
  <jsp:include page="Bottom.jsp"></jsp:include>
  <form name="detail" method="post" action="ProductDetail.jsp">
  <input type="hidden" name="no">
  </form>

</body>
</html>