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
<title>Spiracle</title>
</head>

<body>
        <div class="navbar navbar-default navbar-fixed-top" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="index.jsp">Spiracle</a>
            </div>
            <div class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">Overview</a></li>
                <li><a href="file.jsp">File</a></li>
                <li><a href="network.jsp">Network</a></li>
                <li><a href="sql.jsp">SQL</a></li>
              </ul>
            </div>
          </div>
        </div>

        <div class="container">
            <h1>Overview</h1>
                By default datasources are configures by reading a properties file contained within the war file: conf/JafTestApp.properties<br>
                Datasource initialization is controlled by the button on each datasource type on the SQL injection page.<br>
                JDBC connection string, username and password are also overridable using the input fields on the SQL Injection page.<br>
                By default the application will use the defined C3P0 connection pool.<br>
                This behavior can be overridden using the "connectionType" parameter as part of the injectable URLs.<br>
                This can be "java" or "spring" corresponding to a raw JDBC connection and a Spring datasource provided connection.<br>
                These are provided as a demonstration of interception from differing data source types and are not pooled. It is not recommended <br>
                that these be used with a high load penetration tool such as SQLMap as these connections are likely to fail under high request volumes.<br>
                All URLs are exploitable as GET or POST requests.
    </div>
</body>
</html>