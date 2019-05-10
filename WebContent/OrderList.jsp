<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.*,chapter16.*"%>
<jsp:useBean id = "proMgr" class="chapter16.ProductMgr"/>
<jsp:useBean id = "orderMgr" class="chapter16.OrderMgr"/>
<%
if(session.getAttribute("idKey")==null){
	response.sendRedirect("Login.jsp");
}else{
	String mem_id = (String)session.getAttribute("idKey");
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
<table width="75%" align="center" >
<tr>
<td align="center">
<table width="95%" align="center">
<tr>
<td align="center">주문번호</td>
<td align="center">제품</td>
<td align="center">주문수량</td>
<td align="center">주문상태</td>
</tr>

<%

Vector vResult = orderMgr.getOrder(mem_id);
if(vResult.size()==0){
	
	%>
	
	
	<tr>
	<td align="center" colspan="5">주문하신 물품이 없습니다.</td></tr>

<% 
}else{
for(int i=0; i<vResult.size(); i++){
	OrderBean order=(OrderBean)vResult.get(i);
	ProductBean product = proMgr.getProduct(order.getProduct_no());

%>
<tr>
<td align="center"><%=order.getNo() %></td>
<td align="center"><a href="javascript:productDetail('<%=order.getProduct_no()%>')"><%=product.getName() %></a></td>
<td align="center"><%=order.getQuantity() %></td>
<td align="center"><%=order.getDate() %></td>
<td align="center">
<%

switch(Integer.parseInt(order.getState())){
case 1 : out.print("접수중");
break;
case 2 : out.print("접수");
break;
case 3 : out.print("입금확인");
break;
case 4 : out.print("배송준비");
break;
case 5 : out.print("배송중");
break;
default : out.print("완료");
}
%>
</td>
</tr>
<%}
} %>
</table>
</td>
</tr>

</table>
<form name="detail" method="post" action="ProductDetail.jsp">
<input type="hidden" name="no">
</form>

</body>


</html>
<%}%>