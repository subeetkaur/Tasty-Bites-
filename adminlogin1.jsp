<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>admin page</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
            
            <div id="main" align="center">
                <span class="headings">LOG IN</span>
                <br>
                <br>
         <form action="adminlogin2.jsp" id="form" method="post">
            <table border="0" align="center">
                <tr>
                    <td>Username</td>
                    <td><input type="text" required placeholder="Username" name="un" id="username" autofocus/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" required name="pw" id="password" placeholder="Password"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="Login" id="login" /></td>
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