<%-- 
    Document   : user_signup
    Created on : May 3, 2014, 11:34:49 AM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user sign up</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            function go()
            {
                var email = document.getElementById("email").value;
                var contact_no = document.getElementById("mobile_no").value;
                
                if (document.getElementById("password").value != document.getElementById("conf_password").value)
                {
                    alert("new password and confirm password do not match");
                    return false;
                }
                else if (email.indexOf("@") == -1 || email.lastIndexOf(".") == -1 || email.indexOf("@") >= email.lastIndexOf("."))
                {
                    alert("Email incorrect");
                    return false;
                }
                
                
                if(isNaN(contact_no) && contact_no.length!=10) 
                {

                    alert("invalid phone number");
                    return false;
                }
                else
                {
                    return true;
                }
            }

        </script>
    </head>

    <body>
        <div id="all">
            <%@include file="header.jsp"%>
            
            <div id="main" align="center">
                <span class="headings">User Signup</span>
                <br>
                <br>
        <%@page import="java.sql.*" %>
        <form action="user_signup2.jsp" method="post" onsubmit="return go()">
            <table align="center">
                <tr>
                    <td>Username</td>
                    <td><input type="text" required name="username" id="username" required/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" required name="password" id="password" required/></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" required name="conf_password" id="conf_password" required/></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" required name="name" id="name" required/></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" required name="email" id="email" required/></td>
                </tr>
                <tr>
                    <td>Contactno</td>
                    <td><input type="text" required name="contactno" id="contactno" required/></td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td><textarea name="address" id="address" required/></textarea></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><select name="city" id="city">
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                System.out.println("Driver loaded successfully");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                                System.out.println("connection with database success");
                                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs = stmt.executeQuery("select * from city");
                                System.out.println("result set created");

                                while (rs.next()) {
                            %>  
                            <option value="<%=rs.getString("city")%>"><%=rs.getString("city")%></option>
                            <%
                                }
                            %>      

                        </select></td>
                </tr>
                
                <tr>
                    <td align="center" colspan="2"><input type="submit" value="sign up" /></td>
                </tr>
            </table>
        </form>
                             <% 
String msg=request.getParameter("msg");
if(msg!=null)
{
    %>
    <span style="color:red;"><%=msg%></span>
    <%
}
%>
</div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
