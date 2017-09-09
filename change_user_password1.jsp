<%-- 
    Document   : change_user_password1
    Created on : May 3, 2014, 12:16:11 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            function go()
            {
                if(document.getElementById("newpw").value !=document.getElementById("confnewpw").value)
                {
                    alert("new password and confirm password do not match");
                    return false;
                   }
                   else
                   {
                       return true;
                   }
            }
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change user password</title>
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
          
            <div id="main" align="center">
                <span class="headings">Change User Password</span>
        <form action="change_user_password2.jsp" onsubmit="return go()" method="post">
              <table>
              <tr>
        <td>USERNAME</td>
    <td>
<input type="text" required name="username" readonly value="<%=session.getAttribute("user")%>">
</td>
</tr>
<tr>
    <td>OLD PASSWORD</td>
    <td>
        <input type="password" required name="password" required>
    </td>
</tr>
<tr>
<tr>
    <td>NEW PASSWORD </td>
    <td>
        <input type="password" required name="newpw" id="newpw" required>
    </td>
</tr>
<tr>
    <td> CONFIRM NEW PASSWORD</td>
    <td>
        <input type="password" required name="cpw" id="confnewpw" required>
        </td>
</tr>
<tr>
    <td>
        
    </td>
    <td>
        <input type="submit" name="save" value="SAVE">
    </td>
</tr>
              </table>
        </form>
</div>
                            <%@include file="footer.jsp"%>
        </div>
      <% 
String msg=request.getParameter("msg");
if(msg!=null)
{
    %>
    <span style="color:red;"><%=msg%></span>
    <%
}
%>
    </body>
</html>

