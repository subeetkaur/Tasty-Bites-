<%-- 
    Document   : delete_cuisine
    Created on : Apr 9, 2014, 12:48:29 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete cuisine</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
            
            <div id="main">
         <%@page import="java.sql.*" %>
         <h1>delete page</h1>
         
         <%
             String n=request.getParameter("q");
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from food_category where fc_name='"+ n +"'");
                System.out.println("result set created");
                
                rs.next();
                
                    rs.deleteRow();
                    out.println("cuisine deleted successfully");
                
        response.sendRedirect("view_cuisine.jsp");
        %>
        </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
