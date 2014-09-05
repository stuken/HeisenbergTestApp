<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>JAF Test App - SQL</title>
</head>

<body role="document">
	<div class="container">
		<div class="page-header">
			<img src="img/waratek.png">
		</div>

		<ul class="nav nav-tabs" role="tablist">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="file.jsp">File</a></li>
			<li><a href="network.jsp">Network</a></li>
			<li class="active"><a href="sql.jsp">SQL Injection</a></li>
		</ul>

		<div class="panel panel-default">
			<div class="panel-heading">
				<a class="btn btn-primary" role="button" href="CreateC3p0Connection">Initalize
					C3P0 Connection Pool</a>
			</div>
			<div class="panel-body">
				<form action=CreateC3p0Connection method="post">
					Connection String: <input type="text" name="connectionUrl"><br>
					Username: <input type="text" name="username"><br>
					Password: <input type="password" name="password"><br>
					<input type="submit" value=Submit>
				</form>
			</div>
			<%
				String connectionData = (String) application
						.getAttribute("connectionData");
				String errorMessage = (String) session.getAttribute("error");
				if (connectionData == null) {
					connectionData = "";
				}
				if (errorMessage == null) {
					errorMessage = "";
				}
			%>
			<div class="panel-footer">
				Connection Information
				<pre><%=connectionData%></pre>
			</div>
			<div class="panel-footer">
				Error
				<pre><%=errorMessage%></pre>
			</div>
		</div>
		<!--
		<div class="panel panel-default">
			<div class="panel-heading">
				<a class="btn btn-primary" role="button" href="CreateJavaConnection">Initalize
					Java Connection</a>
			</div>
			<div class="panel-body">
				<form action=CreateJavaConnection method="post">
					Connection String: <input type="text" name="connectionUrl"><br>
					Username: <input type="text" name="username"><br>
					Password: <input type="password" name="password"><br>
					<input type="submit" value=Submit>
				</form>
			</div>
			<%
				String connectionDataJava = (String) session
						.getAttribute("connectionDataJava");
				String errorMessageJava = (String) session
						.getAttribute("errorJava");
				if (connectionDataJava == null) {
					connectionDataJava = "";
				}
				if (errorMessageJava == null) {
					errorMessageJava = "";
				}
			%>
			<div class="panel-footer">
				Connection Information:
				<pre><%=connectionDataJava%></pre>
			</div>
			<div class="panel-footer">
				Error
				<pre><%=errorMessageJava%></pre>
			</div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">
				<a class="btn btn-primary" role="button" href="CreateSpringContext">Initalize
					Spring Datasource</a>
			</div>
			<div class="panel-body">
				<form action="CreateSpringContext" method="POST">
					<input type="text" name="filePath"> <input type="submit"
						value="Submit">
				</form>
			</div>
			<%
				String contextData = (String) session
						.getAttribute("springContextData");
				if (contextData == null) {
					contextData = "";
				}
			%>
			<div class="panel-footer">
				Context
				<pre><%=contextData%></pre>
			</div>
		</div>
		-->
		<div class="panel panel-default">
			<div class="panel-heading">Injectable URLS</div>
			<div class="panel-body">
				<ul class="list-group">
					<script type="text/javascript">
						$(function() {
							$("[rel='tooltip']").tooltip();
						});
					</script>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT * FROM users WHERE id = ' ? '"
						class="list-group-item"><a href="Get_int?id=1">Get_int?id=1</a></li>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT * FROM users WHERE id = ?" class="list-group-item"><a
						href="Get_int_no_quote?id=1">Get_int_no_quote?id=1</a></li>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT * FROM users ORDER BY ' ? '" class="list-group-item"><a
						href="Get_int_orderby?id=name">Get_int_orderby?id=name</a></li>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT count(name), name FROM users GROUP BY ?" class="list-group-item"><a
						href="Get_int_groupby?id=name">Get_int_groupby?id=name</a></li>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT * FROM users WHERE id = ' ? '"
						class="list-group-item"><a href="Get_int_partialunion?id=1">Get_int_partialunion?id=1</a></li>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT * FROM users WHERE id = ' ? '"
						class="list-group-item"><a href="Get_int_nooutput?id=1">Get_int_nooutput?id=1</a></li>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT MIN(name) from users GROUP BY id HAVING id = ?"
						class="list-group-item"><a href="Get_int_having?id=1">Get_int_having?id=1</a></li>
					<li rel='tooltip' data-toggle="tooltip" title="?"
						class="list-group-item"><a href="Get_int_inline?id=SELECT * FROM users">Get_int_inline?id=SELECT * FROM users</a></li>
					<li rel='tooltip' data-toggle="tooltip" title="SELECT * FROM users WHERE name = ' ? '"
						class="list-group-item"><a href="Get_string?name=wu">Get_string?name=wu</a></li>
					<li rel='tooltip' data-toggle="tooltip" title="SELECT * FROM users WHERE name = ?"
						class="list-group-item"><a href="Get_string_no_quote?name='wu'">Get_string_no_quote?name='wu'</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>