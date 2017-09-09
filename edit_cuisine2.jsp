<%-- 
    Document   : edit_cuisine2
    Created on : Apr 9, 2014, 11:36:04 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit cuisine logic</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
            
            <div id="main">
       <%@page import="java.sql.*" %>
        <%
           
            String description= request.getParameter("desc");
            String fc=request.getParameter("fc");
            ///JDBC CODE/////
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from food_category where fc_name='"+ fc +"'");
                System.out.println("result set created");
                
                if(rs.next())
                {
                    
                   rs.updateString("description" , description);
                   rs.updateRow();
                   
                   response.sendRedirect("view_cuisine.jsp");
                    }
                %>
                </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
