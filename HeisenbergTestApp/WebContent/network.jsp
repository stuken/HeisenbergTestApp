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
<title>JAF Test App - Network</title>
</head>

<body role="document">
	<div class="container">
		<div class="page-header">
			<img src="img/waratek.png" alt="Waratek">
		</div>

		<ul class="nav nav-tabs" role="tablist">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="file.jsp">File</a></li>
			<li class="active"><a href="network.jsp">Network</a></li>
			<li><a href="sql.jsp">SQL Injection</a></li>
		</ul>
		<div class="panel panel-default">
			<div class="panel-heading">Socket</div>
			<div class="panel-body">
				<form action="SocketServlet" method="post">
					<%
						String socketInfo = (String) session.getAttribute("socketInfo");
						if (socketInfo == null) {
							socketInfo = "";
						}
					%>
					<p>
						<i>Local Binding Address</i>
					</p>
					Hostname <input type="text" name="bindHost"> Port <input
						type="text" name="bindPort">
					<p>
						<i>Remote Address</i>
					</p>
					Hostname <input type="text" name="remoteHost"> Port <input
						type="text" name="remotePort"> <input type="submit"
						value=Submit>
				</form>
			</div>
			<div class="panel-footer">
				Connection Info:
				<%=socketInfo%></div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">Server Socket</div>
			<div class="panel-body">
				<%
					String serverSocketInfo = (String) session
							.getAttribute("serverSocketInfo");
					if (serverSocketInfo == null) {
						serverSocketInfo = "";
					}
				%>
				<h2>Server Socket</h2>
				<form action="ServerSocketServlet" method="post">
					Hostname <input type="text" name="hostname"> Port <input
						type="text" name="port"> <input type="submit" value=Submit>
				</form>
			</div>
			<div class="panel-footer">
				Connection Info:
				<%=serverSocketInfo%></div>
		</div>
		<div class="panel panel-default">
			<div class="panel-heading">URL</div>
			<div class="panel-body">
				<%
					String urlData = (String) session.getAttribute("urlContents");
					if (urlData == null) {
						urlData = "";
					}
				%>
				<form action="UrlServlet" method="post">
					Url: <input type="text" name="urlPath"> <input
						type="submit" value=Submit>
				</form>
			</div>
			<div class="panel-footer">
				<pre><textarea style="width: 100%; height: 20em"><%=urlData%></textarea></pre>
			</div>
		</div>
	</div>
</body>
</html>



