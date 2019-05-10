<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.*, chapter16.*" %>    
<jsp:useBean id ="orderMgr" class="chapter16.OrderMgr"></jsp:useBean>
<jsp:useBean id ="proMgr" class="chapter16.ProductMgr"></jsp:useBean>

<%
OrderBean order = orderMgr.getOrderDetail(request.getParameter("no"));
ProductBean product = proMgr.getProduct(order.getProduct_no());

%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���θ� ������</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="..\\script.js"></script>
</head>


<body topmargin="100">
<jsp:include page="..\\Top.jsp"></jsp:include>
 

<table width="75%" align="center" border="0">
<tr>

<td align="center" >
<form method=post name="order" action="OrderProc.jsp">
<table width="75%" align="center" border="0">

<tr>
<td ><br></td>
</tr>
<tr>
<td colspan="3" align="center"><b>�ֹ� �󼼳���</b></td>
</tr>

<tr>
<td><br></td>
</tr>
<tr>
<td align="center">�����̵�</td>
<td align="center"><%=order.getId() %></td>
</tr>
<tr>
<td align="center">�ֹ���ȣ</td>
<td align="center"><%=order.getNo() %></td>
</tr>
<tr>
<td align="center">��ǰ��ȣ</td>
<td align="center"><%=product.getNo() %></td>
</tr>
<tr>
<td align="center">��ǰ�̸�</td>
<td align="center"><%=product.getName() %></td>
</tr>
<tr>
<td align="center">��ǰ����</td>
<td align="center"><%=product.getPrice()%></td>
</tr>

<tr>
<td align="center">�ֹ�����</td>
<td align="center"><%=order.getQuantity() %></td>
</tr>
<tr>
<td align="center">������</td>
<td align="center"><%=product.getStock() %></td>
</tr>
<tr>
<td align="center">�ֹ���¥</td>
<td align="center"><%=order.getDate() %></td>
</tr>
<tr>
<td align="center">�ݾ�</td>
<td align="center"><%=order.getQuantity()*Integer.parseInt(product.getPrice())%>��</td>
</tr>
<tr>
<td align="center">�ֹ�����</td>
<td align="center">
<select name="state">
<option value="1">������</option>
<option value="2">����</option>
<option value="3">�Ա�Ȯ��</option>
<option value="4">����غ�</option>
<option value="5">�����</option>
<option value="6">�Ϸ�</option>
</select>
<script>document.order.state.value=<%=order.getState()%></script>
</td>
</tr>
<tr>
<td colspan="3" align="center">
<input type="button"value="����" size="3" onclick="javascript:orderUpdate(this.form)">/
<input type="button"value="����" size="3" onclick="javascript:orderDelete(this.form)">
</td>
</tr>
</table>
<input type="hidden" name="no" value="<%=order.getNo() %>">
<input type="hidden" name="flag">
</form>
</td>
</tr>
</table>
  <jsp:include page="..\\Bottom.jsp"></jsp:include>


</body>
</html>