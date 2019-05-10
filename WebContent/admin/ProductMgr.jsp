<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.util.*, chapter16.*,java.net.*" %>
    <jsp:useBean id="proMgr" class="chapter16.ProductMgr"></jsp:useBean>

<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="..\\script.js"></script>
<meta charset="EUC-KR">
<title>쇼핑몰 관리자</title>
</head>
  <jsp:include page="../Top.jsp"></jsp:include>
<table width="75%" align="center" border="0">
<tr><td><br></td></tr>
<tr>
<td align="center"><b>이름</b></td>
<td align="center"><b>가격</b></td>
<td align="center"><b>제품이미지</b></td>
<td align="center"><b>날짜</b></td>
<td align="center"><b>재고</b></td>
<td align="center">&nbsp;</td>
</tr>
<tr>
<td><br>
</td>
</tr>

<%
Vector vResult=proMgr.getProductList();
if(vResult.size()==0){
	%>
<tr>
<td align="center" colspan="6">등록된 상품이 없습니다</td>
</tr>
<%}else{
	for(int i = 0 ; i<vResult.size(); i++){
		ProductBean product = (ProductBean)vResult.get(i);

	%>
<tr>
<td align="center"><%=product.getName() %></td>
<td align="center"><%=product.getPrice() %></td>
<td align="center"><img src="..\\data\\<%=URLEncoder.encode(product.getImage(),"euc-kr")%>" width="125"></td>


<td align="center"><%=product.getDate() %></td>
<td align="center"><%=product.getStock() %></td>
<td align="center"><a href="javascript:productDetail('<%=product.getNo()%>')">상세보기</a></td>
</tr>
<%
}
}
%>
<tr>
<td colspan="6" align="center"><a href="ProductInsert.jsp">상품등록</a></td>
</tr>
</table>
  <jsp:include page="..\\Bottom.jsp"></jsp:include>
  <form action="ProductDetail.jsp" name="detail" method="post">
  <input type="hidden" name="no"></form>
</body>

</html>