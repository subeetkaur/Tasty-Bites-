<%-- 
    Document   : restaurant_category_edit2
    Created on : Apr 22, 2014, 3:44:57 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>inserting edit data</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main">
         <%@page import="java.sql.*" %>
        <%
           String id=request.getParameter("p");
            String description= request.getParameter("desc");
            String name=request.getParameter("name");
            System.out.println(id);
            System.out.println(description);
            System.out.println(name);
            ///JDBC CODE/////
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from restaurant_menu_category where rmid='"+ id +"'");
                System.out.println("result set created");
                
                if(rs.next())
                {
                   rs.updateString("name" , name); 
                   rs.updateString("description" , description);
                   rs.updateRow();
                }
                response.sendRedirect("restaurant_category_view.jsp?p=+id");
                %>
                </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>

