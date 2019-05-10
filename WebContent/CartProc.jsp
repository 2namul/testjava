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
		//여기가안됨
		%>
		<script>
		alert("장바구니에 담았습니다.");
		location.href="CartList.jsp";
		</script>
		
		<%
	}else if (flag.equals("update")){
		order.setId(id);
		cartMgr.updateCart(order);
		%>
		
		<script>
		alert("수정하였습니다.");
		location.href="CartList.jsp";
		</script>
		
		<%
	}else{
		cartMgr.deleteCart(order);
		%>
		<script>
		alert("삭제하였습니다.");
		location.href="CartList.jsp";
		</script>
		<%
	}
}
%>