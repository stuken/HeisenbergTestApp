<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="css/bootstrap-theme.min.css">
<script src="js/jquery-2.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>JAF Test App - SQL</title>
</head>
</head>
<body role="document">
	<div class="content">
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
				<form action=CreateConnection method="post">
					Connection String: <input type="text" name="connectionUrl"><br>
					Username: <input type="text" name="username"><br>
					Password: <input type="password" name="password"><br>
					<input type="submit" value=Submit>
				</form>
			</div>
			<%
				String connectionData = (String) session
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
		<div class="panel panel-default">
			<div class="panel-heading">
				<a class="btn btn-primary" role="button" href="CreateJavaConnection">Initalize
					Java Connection</a>
			</div>
			<div class="panel-body">
				<form action=CreateUnpooledConnection method="post">
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
						class="list-group-item"><a href="Get_int?id=">Get_int?id=</a></li>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT * FROM users WHERE id = ?" class="list-group-item"><a
						href="Get_int_no_quote?id=">Get_int_no_quote?id=</a></li>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT * FROM users ORDER BY ' ? '" class="list-group-item"><a
						href="Get_int_orderby?id=">Get_int_orderby?id=</a></li>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT id FROM users GROUP BY ?" class="list-group-item"><a
						href="Get_int_groupby?id=">Get_int_groupby?id=</a></li>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT * FROM users WHERE id = ' ? '"
						class="list-group-item"><a href="Get_int_partialunion?id=">Get_int_partialunion?id=</a></li>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT * FROM users WHERE id = ' ? '"
						class="list-group-item"><a href="Get_int_nooutput?id=">Get_int_nooutput?id=</a></li>
					<li rel='tooltip' data-toggle="tooltip"
						title="SELECT MIN(name) from users GROUP BY id HAVING id = ?"
						class="list-group-item"><a href="Get_int_having?id=">Get_int_having?id=</a></li>
					<li rel='tooltip' data-toggle="tooltip" title="?"
						class="list-group-item"><a href="Get_int_inline?id=">Get_int_inline?id=</a></li>
					<li rel='tooltip' data-toggle="tooltip" title="SELECT * FROM users WHERE name = ' ? '"
						class="list-group-item"><a href="Get_string?name=">Get_string?name=</a></li>
					<li rel='tooltip' data-toggle="tooltip" title="SELECT * FROM users WHERE name = ?"
						class="list-group-item"><a href="Get_string_no_quote?name=">Get_string_no_quote?name=</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>