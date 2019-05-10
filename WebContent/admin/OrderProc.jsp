<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="java.util.*, chapter16.*" %>    
<jsp:useBean id ="orderMgr" class="chapter16.OrderMgr"></jsp:useBean>
    <%
    
    String flag = request.getParameter("flag");
    String no = request.getParameter("no");
    String state = request.getParameter("state");
    boolean result = false;
    
    if(flag.equals("update")){
    	result=orderMgr.updateOrder(no,state);
    	
    }else if(flag.equals("delete")){
    	result=orderMgr.deleteOrder(no);
    }else{
    	response.sendRedirect("OrderMgr.jsp");
    }
    if(result){
    	%>
    	<script>
    	alert("정상적으로 처리하였습니다.");
    	location.href="OrderMgr.jsp";
    	</script>
    	<%
    }else{
    	%>
    	<script>
    	alert("오류가 발생하였습니다.");
    	location.href="OrderMgr.jsp";
    	</script>
    	<%
    }
    
    
    %>