<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="proMgr" class="chapter16.ProductMgr"></jsp:useBean>

<%
String flag = request.getParameter("flag");

boolean result=false;

if(flag.equals("insert")){
	result=proMgr.insertProduct(request);
	
}else if(flag.equals("update")){
	result=proMgr.updateProduct(request);
}else if(flag.equals("delete")){
	result=proMgr.deleteProduct(request.getParameter("no"));
}else{
	response.sendRedirect("ProductMgr.jsp");
}
if(result){

%>
<script>
alert("처리완료");
location.href="ProductMgr.jsp";
</script>
<%}else{%>
<script>
alert("오류발생");
location.href="ProductMgr.jsp";
</script>
<%}%>