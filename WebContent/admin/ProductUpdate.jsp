<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.*, chapter16.*, java.net.*" %>
<jsp:useBean id ="proMgr" class="chapter16.ProductMgr"/>

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
<form method="post"  action="ProductProc.jsp?flag=update" enctype="multipart/form-data">
<table width="75%" align="center" border="0">
<tr>
<td><br></td>
</tr>

<tr>
<td colspan ="2" align="center" ><font size="5"><b>상품 등록</b></font></td>
</tr>
<tr>
<td><br></td>
</tr>

<tr>
<td align="center">상품이름</td>
<td align="left" ><input type="text" name="name" value="<%=product.getName() %>"></td>
</tr>
<tr>
<td align="center">상품가격</td>
<td align="left"><input type="text" name="price" size="20" value="<%=product.getPrice() %>">원</td>
</tr>
<tr>
<td align="center">상품설명</td>
<td><textarea rows="10" cols="45" name="detail"><%=product.getDetail() %></textarea></td>
</tr>
<tr>
<td align="center">상품입고수량</td>
<td><input type="text" name="stock" size="10" value="<%=product.getStock() %>">개</td>
</tr>

<tr>
<td align="center">상품이미지</td>
<td><img src="..\\data\\<%=URLEncoder.encode(product.getImage(),"euc-kr")%>" width="125">
<input type="file" name="image" >
</td>
</tr>
<tr>
<td><br></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="상품등록">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="다시쓰기"></td>
</tr>

</table>
<input type = hidden name="no" value="<%=product.getNo() %>">
</form>
</td>
</tr>
</table>



  <jsp:include page="..\\Bottom.jsp"></jsp:include>

</body>
</html>