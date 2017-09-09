<%-- 
    Document   : edit_cuisine_pic2
    Created on : Apr 10, 2014, 11:28:25 AM
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
            <%@include file="header_admin.jsp"%>
            
            <div id="main">
        <%@page import="java.sql.*" %>
        
        <%
            String cuisine=request.getParameter("q");
            String path=getServletContext().getRealPath("/cuisine_logo");
            String filename = request.getParameter("fn");
            System.out.println(filename);
            String ext = filename.substring(filename.lastIndexOf("."));
            filename = cuisine + ext;
            inception.FileUploader.savefile(request,path , filename);
            
            
           
            //jdbc code
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from food_category where fc_name=\'"+cuisine+"\'");
                System.out.println("result set created");
                
                if(rs.next())
                {
                    rs.updateString("logo","./cuisine_logo/"+filename);
                    rs.updateRow();
                    
                    response.sendRedirect("view_cuisine.jsp?msg=photo updated successfully");
                }
        %>
        </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
