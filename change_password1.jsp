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
        <title>change password1</title>
    
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
          
            <div id="main" align="center">
                <span class="headings">Admin Change Password</span>
    <br>
    <br>
        <form action="change_password2.jsp" onsubmit="return go();" method="post">
              <table align="center">
              <tr>
        <td>USERNAME</td>
    <td>
<input type="text" required name="un" id="username" readonly value="<%=session.getAttribute("un")%>">
</td>
</tr>
<tr>
    <td>OLD PASSWORD</td>
    <td>
        <input type="password" required id="old_password" name="pw" required>
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
               <% 
            String msg=request.getParameter("msg");
            if(msg!=null)
            {
                %>
                <span style="color:red;"><%=msg%></span>
                <%
            }
              %>
        </form>
</div>
                            <%@include file="footer.jsp"%>
        </div>
     
    </body>
</html>