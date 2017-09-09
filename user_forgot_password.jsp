<%-- 
    Document   : user_forgot_password
    Created on : May 3, 2014, 12:41:38 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user forgot password page</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
            
            <div id="main">
        <form action="user_forgot_password2.jsp" onsubmit="return go()" method="post">
            <table border="0" width="3">
                <tr>
                    <td>Username</td>
                    <td><input type="text" required name="username"/></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><input type="submit" value="submit"/></td>
                </tr>
            </table>
        </form>
                </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
