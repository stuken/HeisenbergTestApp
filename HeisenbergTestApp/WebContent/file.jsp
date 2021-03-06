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
<title>Spiracle - File</title>
</head>

<body role="document">
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
                <li><a href="index.jsp">Overview</a></li>
                <li class="active"><a href="file.jsp">File</a></li>
                <li><a href="network.jsp">Network</a></li>
                <li><a href="sql.jsp">SQL</a></li>
              </ul>
            </div>
          </div>
        </div>

        <div class="container">
            <h1>File</h1>

        <div class="panel panel-default">
            <div class="panel-heading">File</div>
            <div class="panel-body">
                <form id="fileForm" action="FileServlet" method="post">
                    <%
                        String textData = (String) session.getAttribute("fileContents");
                        if (textData == null) {
                            textData = "";
                        }
                    %>
                    Path: <input type="text" name="filePath"><br> Read <input
                        type="radio" name="fileArg" value="read" checked><br>
                    Write <input type="radio" name="fileArg" value="write"><br>
                    Delete <input type="radio" name="fileArg" value="delete"><br>
                    <input type="submit" value=Submit>
                </form>
            </div>
            <div class="panel-footer">Text Data</div>
            <div class="panel-body">
                <pre><textarea form="fileForm" name="fileText" style="width:100%;height:20em"><%=textData%></textarea></pre>
            </div>
        </div>
    </div>
</body>
</html>