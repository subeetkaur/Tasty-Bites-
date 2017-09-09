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
                <span class="headings">Photo Uploaded Successfully</span>
        <%@page import="java.sql.*" %>
        <%@page import="inception.*" %>
        
        <%
            String cuisine=request.getParameter("q");
            String path=getServletContext().getRealPath("/restaurant_logo");
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
                ResultSet rs=stmt.executeQuery("select * from restaurant where username=\'"+cuisine+"\'");
                System.out.println("result set created");
                
                if(rs.next())
                {
                    rs.updateString("logo","./restaurant_logo/"+filename);
                    rs.updateRow();
                }
        %>
        </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
