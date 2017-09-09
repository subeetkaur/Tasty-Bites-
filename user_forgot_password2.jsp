<%-- 
    Document   : user_forgot_password2
    Created on : May 3, 2014, 12:50:42 PM
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
        <%@page import="java.sql.*" %>
        
        <%
            String username;
            String contactno="";
            username=request.getParameter("username");
           
            
            //jdbc code
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery("select * from user where username='"+username+"'");
                System.out.println("result set created");
        
                if(rs.next())
                {
                  contactno=rs.getString("mobile_no");
                }
                %>
                <form action="user_forgot_password3.jsp" method="post">
                    <table cellpadding="20px">
                        <tr>
                    <td>username</td>
                    <td><input type="text" required value="<%=username%>" name="username" readonly/></td>
                </tr>
                     <tr>
                    <td>email</td>
                    <td><input type="email" placeholder="enter your email id" name="email"/></td>
                </tr>
                <tr>
                    <td>contact no</td>
                    <td><input type="text" required placeholder="enter your phone no" name="contactno"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="next"></td>
                </tr>
                    </table>
             
                </form>
                </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
