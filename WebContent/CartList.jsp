<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ page import ="java.util.*, chapter16.*" %>    
 <jsp:useBean id="cartMgr" class="chapter16.CartMgr" scope="session"></jsp:useBean>

<jsp:useBean id ="proMgr" class="chapter16.ProductMgr"></jsp:useBean>
   <%
   if(session.getAttribute("idKey")==null){
response.sendRedirect("Login.jsp");
 }else{
   %> 
<html>
<head>
<meta charset="EUC-KR">
<title>쇼핑몰</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="..\\script.js"></script>
</head>
<body topmargin="100">

<jsp:include page="Top.jsp"></jsp:include>


<table width="75%" align="center" border="0">
<tr>

<td align="center" >

<table width="95%" align="center">
<tr>
<td align="center">제품</td>
<td align="center">수량</td>
<td align="center">가격</td>
<td align="center">수정/삭제</td>
<td align="center">조회</td>
</tr>
<%
int totalPrice=0;
Hashtable hCart = cartMgr.getCartList();
if(hCart.size()==0){
	%>
	<tr><td align="center" colspan="5">선택하신 물품이 없습니다.</td></tr>
	
	<% 
}else{
	
	Enumeration hCartKey=hCart.keys();
	while(hCartKey.hasMoreElements()){
		OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
		ProductBean product = proMgr.getProduct(order.getProduct_no());
		int price=Integer.parseInt(product.getPrice());
		int quantity = order.getQuantity();
		int subTotal = price*quantity;
		totalPrice+=price*quantity;
		%>
	<form method="post" action="CartProc.jsp">
	<input type ="hidden" name="product_no" value="<%=product.getNo() %>">
	<input type="hidden" name="flag">
	<tr>
	<td><%=product.getName() %></td>
	<td><input type=text name=quantity value="<%=order.getQuantity() %>" size=5>개</td>
	<td><%=subTotal%></td>
	<td>
	<input type="button" value="수정" size="3" onclick="javascript:cartUpdate(this.form)">/
	<input type="button" value="삭제" size="3" onclick="javascript:cartDelete(this.form)">
	</td>
	<td align="center"><a href="javascript:productDetail('<%=product.getNo() %>')">상세보기</a></td>
	</tr>
	</form>	
	<%	
}
%>
<tr>
<td colspan="4" align="right">총 금액:<%=totalPrice %></td>
<td align="center"><a href="OrderProc.jsp">주문하기</a></td>
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
<%
}
%>    
    
