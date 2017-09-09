<%-- 
    Document   : manage_food_category2
    Created on : Apr 12, 2014, 5:50:04 PM
    Author     : LENOVO B560
--%>

<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.*"%>
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
            <%@include file="header_rest.jsp"%>
           
            <div id="main" align="center">
                <span class="headings">Cuisine Added to Restaurant</span>
        <%

            Enumeration<String> al = request.getParameterNames();

            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with database success");
            Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs2 = stmt2.executeQuery("select * from restaurant_category where username = '"+ session.getAttribute("rest")+"'");
            System.out.println("result set created");
            while (rs2.next()) {
               rs2.deleteRow();
            }

            while (al.hasMoreElements()) {
                String fc = al.nextElement().toString();
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from restaurant_category");
                System.out.println("result set created");
                rs.moveToInsertRow();
                rs.updateString("username", session.getAttribute("rest") + "");
                rs.updateString("fc_name", fc);
                rs.insertRow();
            }

        %>
        </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
