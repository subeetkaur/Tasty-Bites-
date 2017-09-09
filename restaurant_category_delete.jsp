<%-- 
    Document   : restaurant_category_delete
    Created on : Apr 17, 2014, 3:31:28 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>delete selected category</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main">
        <%@page import="java.sql.*;" %>

        <%
        String del;
        del=request.getParameter("p");
        
        Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from restaurant_menu_category where rmid=\'"+del+"\'");
            System.out.println("result set created");
            rs.next();
            
               rs.deleteRow();
               response.sendRedirect("restaurant_category_view.jsp");
               out.println("row deleted successfully");
               %>
               </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
