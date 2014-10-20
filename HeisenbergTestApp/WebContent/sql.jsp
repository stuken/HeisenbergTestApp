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
<title>Spiracle - SQL</title>
</head>

<body role="document">
    <div class="container">
        <div class="page-header">
            <img src="img/waratek.png" alt="Waratek">
        </div>

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
                    <li rel='tooltip' data-toggle="tooltip"
                        title="?"
                        class="list-group-item"><a href="Get_int_inline?id=SELECT%20*%20FROM%20users">Get_int_inline?id=SELECT * FROM users</a></li>
                    <li rel='tooltip' data-toggle="tooltip"
                        title="SELECT * FROM users WHERE name = ' ? '"
                        class="list-group-item"><a href="Get_string?name=wu">Get_string?name=wu</a></li>
                    <li rel='tooltip' data-toggle="tooltip"
                        title="SELECT * FROM users WHERE name = ?"
                        class="list-group-item"><a href="Get_string_no_quote?name='wu'">Get_string_no_quote?name='wu'</a></li>
                    <li rel='tooltip' data-toggle="tooltip"
                        title="UPDATE users SET name = '?', surname = '?' WHERE id = ?"
                        class="list-group-item"><a href="Update_User?id=1&amp;name=Joe&amp;surname=Soap">Update_User?id=1&amp;name=Joe&amp;surname=Soap</a></li>
                    <li rel='tooltip' data-toggle="tooltip"
                        title="DELETE FROM users WHERE id = ? OR name = '?'"
                        class="list-group-item"><a href="Delete_User?id=1&amp;name=Joe">Delete_User?id=1&amp;name=Joe</a></li>
                    <li rel='tooltip' data-toggle="tooltip"
                        title="INSERT INTO users VALUES (?, '?', '?', '?', '?', '?')"
                        class="list-group-item"><a href="Insert_User?id=101&amp;name=Joe&amp;surname=Soap&amp;dob=01-Jan-1970&amp;credit_card=1111-1111-1111-1111&amp;cvv=999">Insert_User?id=101&amp;name=Joe&amp;surname=Soap&amp;dob=01-Jan-1970&amp;credit_card=1111-1111-1111-1111&amp;cvv=999</a></li>
                    <li rel='tooltip' data-toggle="tooltip"
                        title="SELECT * FROM users, address WHERE users.id = ? AND users.id = address.id"
                        class="list-group-item"><a href="Get_Implicit_Join?id=1">Get_Implicit_Join?id=1</a></li>
                    <li rel='tooltip' data-toggle="tooltip"
                        title="SELECT * FROM users FULL OUTER JOIN address ON users.id = address.id AND users.id = ?"
                        class="list-group-item"><a href="Get_Full_Outer_Join?id=1">Get_Full_Outer_Join?id=1</a></li>
                    <li rel='tooltip' data-toggle="tooltip"
                        title="SELECT name, surname, TO_CHAR(dob) FROM users WHERE id = ? UNION SELECT address_1, address_2, address_3 FROM address WHERE id = ?"
                        class="list-group-item"><a href="Get_Union?id=1">Get_Union?id=1</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>