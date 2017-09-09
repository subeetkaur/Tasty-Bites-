<%-- 
    Document   : edit_menu2
    Created on : Apr 23, 2014, 11:54:29 AM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit menu logic</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main">
       <%@page import="java.sql.*" %>
       <%@page import="inception.*" %>
        <%
           
            String description= request.getParameter("desc");
            String name= request.getParameter("item");
            String price= request.getParameter("price");
            String category= request.getParameter("category");
            String subcat= request.getParameter("subcat");
            String id=request.getParameter("id");
            ///JDBC CODE/////
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from menu where menu_id='"+ id +"'");
                System.out.println("result set created");
                
                if(rs.next())
                {
                    
                   rs.updateString("description" , description);
                   rs.updateString("name" , name);
                   rs.updateString("price" , price);
                   rs.updateString("category" , category);
                   rs.updateString("sub_category" , subcat);
                   rs.updateRow();
                   
                   response.sendRedirect("view_menu.jsp");
                    }
                %>
                </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>

