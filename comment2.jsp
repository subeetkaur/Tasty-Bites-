<%-- 
    Document   : comment2
    Created on : May 8, 2014, 12:14:32 PM
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
                 String rest = request.getParameter("rest");
                 try
                 {
                    String comment, rating;
                    comment = request.getParameter("comment");
                    rating = request.getParameter("rate");
                    
                    System.out.println(rest);
                    String user = (String) session.getAttribute("user");

                    //jdbc code
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driver loaded successfully");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                    System.out.println("connection with database success");
                    Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs = stmt.executeQuery("select * from comments");
                    System.out.println("result set created");

                    rs.moveToInsertRow();

                    rs.updateString("comment", comment);
                    rs.updateString("rating", rating);
                    rs.updateString("user", user);
                    rs.updateString("restaurant", rest);
                    rs.updateDate("date", new java.sql.Date(new java.util.Date().getTime()));

                    rs.insertRow();

                    response.sendRedirect("comment.jsp?user=" + rest);
                 }
                 catch(Exception e)
                 {
                     response.sendRedirect("comment.jsp?user="+ rest);
                 }

                %>
                <h1> Comment added successfully</h1>
            </div>
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
