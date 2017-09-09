

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>upload photo</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
            
            <div id="main" align="center">
                <span class="headings"> Photo Added </span>
        <%@page import="java.sql.*" %>
        <%@page import="inception.*" %>
        
        <%
            String cuisine=request.getParameter("q");
            String path=getServletContext().getRealPath("/cuisine_logo");// Folder name
           // String filename = request.getParameter("fn");
           // System.out.println(filename);
           // String ext = filename.substring(filename.lastIndexOf("."));
          //  filename = cuisine + ext;
            // upname = image Name
             String upname = FileUploader.savefile(request,path);// Image Upload
            
            
           
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
                    rs.updateString("logo","./cuisine_logo/"+upname);
                    rs.updateRow();// Commit or Permanent Save in database
                    %>
                    <img src="./cuisine_logo/<%=upname%>" width="200" height="200"/>
                    <br>
                    Cuisine <%=cuisine%> Added Successfully
                    <%
                }
        %>
        </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>