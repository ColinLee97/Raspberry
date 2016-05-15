<%@ CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<%
uname=Request.Form("myuser")
pwd=Request.Form("mypwd")
exist=false


sql="SELECT * FROM Table1 WHERE myUsername="
sql=sql & "'" & uname & "'"

set conn=Server.CreateObject("ADODB.Connection")
conn.Open "Username"
set rs=Server.CreateObject("ADODB.recordset")
rs.Open sql,conn

Do Until rs.EOF 
    If rs.Fields.Item("myPwd")=pwd Then
	exist=true
	End If
	rs.MoveNext
Loop

If exist Then
Response.Redirect("newpost.html")
Else
Response.Write("账户名不存在或密码错误")
End If

rs.Close
conn.Close
%>
  请点击按钮返回
  <button type="button"><a href="default.asp">返回</a></button>
</body>
</html>
