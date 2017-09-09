<%-- 
    Document   : disapprove_restaurant
    Created on : Apr 12, 2014, 4:17:43 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disapprove restaurant</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
     
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
            
            <div id="main">
        <%@page import="java.sql.*" %>
        <%
            String pending="";
            
            String n=request.getParameter("q");
            ///JDBC CODE/////
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from restaurant where username='"+ n +"'");
                System.out.println("result set created");
                
                if(rs.next())
                {
                    rs.updateString("status","pending");
                    rs.updateRow();
                    }
                response.sendRedirect("view_approved_restaurant.jsp");
                %>
                        
          </div>
                            <%@include file="footer.jsp"%>
        </div>      
    </body>
</html>

