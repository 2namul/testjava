<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <jsp:useBean id="memMgr" class="chapter16.MemberMgr"></jsp:useBean>
     <%@ page import ="java.util.*,chapter16.*" %> 
    <%
    request.setCharacterEncoding("euc-kr");
    
String mem_id=(String)session.getAttribute("idKey");
Vector memberView = memMgr.View(mem_id);

for(int i=0; i<memberView.size(); i++){
	RegisterBean regBean = (RegisterBean)memberView.elementAt(i);
	String tempId = regBean.getMem_id();
	String tempname=regBean.getMem_name();
	
%>
<table border="1" cellspacing="0" cellpadding="1"
					align="center">
<tr>
<td>아이디</td>

<td><%=tempId %></td>

</tr>

<tr>
<td>이름</td>

<td><%=tempname %></td>

</tr>
</table>
<%
}
%>














