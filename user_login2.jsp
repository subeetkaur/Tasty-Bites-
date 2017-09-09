<%-- 
    Document   : user_login2
    Created on : May 3, 2014, 12:10:20 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ON SUCCESS</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
           
            <div id="main">
        <%@page import="java.sql.*" %>
        
        <%
            String username,password;
            username=request.getParameter("username");
            password=request.getParameter("password");
            
            //jdbc code
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement();
                ResultSet rs=stmt.executeQuery("select * from user where username='"+username+"' and password='"+password+"' ");
                System.out.println("result set created");
        
                
            if(rs.next())
            {
                session.setAttribute("user",username);
                
                response.sendRedirect("user_home.jsp");
            }
            else
            {
                response.sendRedirect("user_login.jsp?msg=invalid username/password");
            }
            
          
        %>
        <h1> User added succesfully</h1>
    </div>
                            <%@include file="footer.jsp"%>
        </div>
    
    
    </body>
</html>