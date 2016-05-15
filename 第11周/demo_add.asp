<%@ CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>

<%
set conn=Server.CreateObject("ADODB.Connection")
conn.Open "myWeb"

sql="INSERT INTO Table1 (title,author,content)"
sql=sql & " VALUES "
sql=sql & "('" & Request.Form("title") & "',"
sql=sql & "'" & Request.Form("author") & "',"
sql=sql & "'" & Request.Form("content") & "')"

on error resume next
conn.Execute sql,recaffected
if err<>0 then
  Response.Write("No update permissions!")
else
  Response.Redirect("default.asp")
end if
conn.close
%>

</body>
</html>
