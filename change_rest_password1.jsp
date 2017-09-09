<%-- 
    Document   : change_rest_password1
    Created on : Apr 12, 2014, 11:27:25 AM
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
        <title>change restaurant password</title>
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
    
            <div id="main" align="center">
                <span class="headings">Change Restaurant Password</span>
                <br>
                
        <form action="change_rest_password2.jsp" onsubmit="return go()" method="post">
              <table align="center">
              <tr>
        <td>USERNAME</td>
    <td>
<input type="text" required name="username" readonly value="<%=session.getAttribute("rest")%>">
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
    <td align="center" colspan="2">
        <input type="submit" name="save" value="Change Password"/>
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
