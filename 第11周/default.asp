<%@ CODEPAGE="65001"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>李昊15301066李毅斌15301076</title>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/basic.css" rel="stylesheet" type="text/css">
</head>

<body>
<div class="container">
  <header>
    <form action="loggin.asp" method="post" class="form-inline" id="form">
      <div class="form-group">
        <label for="username">用户名：</label>
        <input type="text" class="form-control" name="myuser" id="username" >
      </div>
      <div class="form-group">
        <label for="password">密码：</label>
        <input type="password" class="form-control" name="mypwd" id="password" >
      </div>
      <button type="submit" class="btn btn-default">登录</button>
    </form>
  </header>
  <main>
  <%
	set conn=Server.CreateObject("ADODB.Connection")
	conn.Open "myWeb"
	
	set rs=Server.CreateObject("ADODB.recordset")
	rs.Open "Select * from Table1", conn
	
	do until rs.EOF
	  Response.Write("<fieldset>")
	  Response.Write("<legend>" & rs.Fields.Item("ID") & "楼</legend>")
	  Response.Write("<h2>标题：" & rs.Fields.Item("title") & "</h2>")
	  Response.Write("<p class='lead'>作者：" & rs.Fields.Item("author") & "</p>")
	  Response.Write("<p>" & rs.Fields.Item("content") & "</p>")
	  Response.Write("</fieldset>")
	  rs.MoveNext
	loop
	
	rs.close
	conn.close
	%>
  </main>
</div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="js/jquery.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="js/bootstrap.min.js"></script>

<script>
$( "#form" ).submit(function( event) {
	var username = $( "#username" ).val();
	var pwd = $( "#password" ).val();
	if (username=="" || pwd=="") {
		event.preventDefault();
		alert("账号密码不能为空");
	}
});
</script>

</body>
</html>