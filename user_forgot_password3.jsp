<%-- 
    Document   : user_forgot_password3
    Created on : May 3, 2014, 2:11:06 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
           
            <div id="main">
       <%@page import="java.sql.*" %>
        
        <%
            String username,contactno,email;
            username=request.getParameter("username");
           contactno=request.getParameter("contactno");
           email=request.getParameter("email");
           
            
            //jdbc code
            
             Class.forName("com.mysql.jdbc.Driver");
             System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery("select * from user where username='"+username+"' and mobile_no='"+contactno+"' and email='"+email+"'");
                System.out.println("result set created");
        
                if(rs.next())
                {
                 String password=rs.getString("password");
                 inception.SimpleMailDemo objj = new inception.SimpleMailDemo(rs.getString("email"), "Password Recovery", "Your password is: "+password); 
                 %> Your Password has been sent to your registered Email Address
                 <%//response.sendRedirect("user_login.jsp?msg=your password is "+password);
                }
                else
                {
                    response.sendRedirect("user_login.jsp?msg=invalid username or email or phone no");
                }
                %>
                </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
