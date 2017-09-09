<%-- 
    Document   : restaurantlogin1
    Created on : Apr 11, 2014, 6:23:44 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>restaurant login page</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
            
            <div id="main" align="center">
                <span class="headings"> Restaurant Login </span>
                <br>
         <form action="restaurantlogin2.jsp" id="form" method="post">
            <table>
                <tr>
                    <td>Username</td>
                    <td><input type="text" required name="username" id="username" required/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" required name="password" id="password" required/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" id="login" value="login" /></td>
                </tr>
                
            </table>  
        </form>
                
        <% 
String msg=request.getParameter("msg");
if(msg!=null)
{
    %>
    <span style="color:brown;"><%=msg%></span>
    <%
}
%>
</div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>