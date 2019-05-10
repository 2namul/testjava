<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.*,chapter16.*"%>
<jsp:useBean id="cartMgr" class="chapter16.CartMgr" scope="session"></jsp:useBean>
<jsp:useBean id="orderMgr" class="chapter16.OrderMgr"></jsp:useBean>
<jsp:useBean id="proMgr" class="chapter16.ProductMgr"></jsp:useBean>

<%
Hashtable hCart=cartMgr.getCartList();
Enumeration hCartKey=hCart.keys();

if(hCart.size()!=0){
	while(hCartKey.hasMoreElements()){
		OrderBean order = (OrderBean)hCart.get(hCartKey.nextElement());
		
		orderMgr.insertOrder(order);
		proMgr.reduceProduct(order);
		cartMgr.deleteCart(order);
		
	}
	%>
	<script>
	alert("�ֹ�ó�� �Ͽ����ϴ�.");
	location.href="OrderList.jsp";
	</script>
	
	<%
}else{%>
	<script>
	alert("��ٱ��ϰ� ����ֽ��ϴ�.");
	location.href="OrderList.jsp";
	</script>

<% }%>