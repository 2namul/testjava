<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*, chapter16.*" %>
    <jsp:useBean id="orderMgr" class="chapter16.OrderMgr"></jsp:useBean>
    <jsp:useBean id="proMgr" class="chapter16.ProductMgr"></jsp:useBean>
<!DOCTYPE html>
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
<tr>
<td>


<table width="75%">

<tr>
<td align="center"><b>주문번호</b></td>
<td align="center"><b>주문자</b></td>
<td align="center"><b>제품</b></td>
<td align="center"><b>주문수량</b></td>
<td align="center"><b>주문날짜</b></td>
<td align="center"><b>주문상태</b></td>
<td align="center">&nbsp;</td>
</tr>
<tr>
<td><br>
</td>
</tr>

<%
Vector vResult=orderMgr.getOrderList();
if(vResult.size()==0){
	%>
<tr>
<td align="center" colspan="7">주문내역이 없습니다</td>
</tr>
<%}else{
	for(int i = 0 ; i<vResult.size(); i++){
		OrderBean order = (OrderBean)vResult.get(i);
		ProductBean product = proMgr.getProduct(order.getProduct_no());

	%>
<tr>
<td align="center"><%=order.getNo() %></td>
<td align="center"><%=order.getId() %></td>
<td align="center"><%=product.getName() %></td>
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
case 4 : out.print("배송중");
break;
case 5 : out.print("완료");
break;
}
%>
</td>
<td align="center"><a href="javascript:orderDetail('<%=order.getNo() %>')">상세보기</a>
</td>
</tr>
<%
}
}
%>
</table>
</td>
</tr>
</table>
  <jsp:include page="..\\Bottom.jsp"></jsp:include>
  <form action="orderDetail.jsp" name="detail" method="post">
  <input type="hidden" name="no"></form>
</body>

</html>