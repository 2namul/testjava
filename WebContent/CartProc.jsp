<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="cartMgr" class="chapter16.CartMgr" scope="session"/>
<jsp:useBean id="order" class="chapter16.OrderBean"/>
<jsp:setProperty name="order" property="*"></jsp:setProperty>
<%

String flag = request.getParameter("flag");
out.print(flag);
String id = (String)session.getAttribute("idKey");


if(id==null){
	response.sendRedirect("./Login/Login.jsp");
}else{
	if(flag==null){
		order.setId(id);
		cartMgr.addCart(order);
		//���Ⱑ�ȵ�
		%>
		<script>
		alert("��ٱ��Ͽ� ��ҽ��ϴ�.");
		location.href="CartList.jsp";
		</script>
		
		<%
	}else if (flag.equals("update")){
		order.setId(id);
		cartMgr.updateCart(order);
		%>
		
		<script>
		alert("�����Ͽ����ϴ�.");
		location.href="CartList.jsp";
		</script>
		
		<%
	}else{
		cartMgr.deleteCart(order);
		%>
		<script>
		alert("�����Ͽ����ϴ�.");
		location.href="CartList.jsp";
		</script>
		<%
	}
}
%>