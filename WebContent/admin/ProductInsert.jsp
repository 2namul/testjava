<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>


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
<form method="post" action="ProductProc.jsp?flag=insert" enctype="multipart/form-data">
<table width="75%" align="center" border="0">

<tr>
<td colspan ="2" align="center" ><font size="5"><b>��ǰ ���</b></font></td>
</tr>
<tr>
<td><br></td>
</tr>

<tr>
<td align="center">��ǰ�̸�</td>
<td align="left" ><input type="text" name="name" size="20"></td>
</tr>
<tr>
<td align="center">��ǰ����</td>
<td align="left"><input type="text" name="price" size="20">��</td>
</tr>
<tr>
<td align="center">��ǰ����</td>
<td><textarea rows="10" cols="45" name="detail"></textarea></td>
</tr>
<tr>
<td align="center">��ǰ����</td>
<td><input type="text" name="stock" size="10">��</td>
</tr>

<tr>
<td align="center">��ǰ�̹���</td>
<td><input type="file" name="image"></td>
</tr>
<tr>
<td><br></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="��ǰ���">&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset" value="�ٽþ���"></td>
</tr>

</table>

</form>
</td>
</tr>
</table>
  <jsp:include page="..\\Bottom.jsp"></jsp:include>

</body>
</html>