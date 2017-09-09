<%-- 
    Document   : add_restaurant_logo
    Created on : Apr 10, 2014, 7:36:45 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Restaurant Logo</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
         
            <div id="main">
         <%@page import="java.sql.*" %>
        <%@page import="inception.*" %>
        <%
            String username=request.getParameter("msg");
            String path=getServletContext().getRealPath("/restaurant_logo");
            String filename=request.getParameter("fn");
            System.out.println(filename);
            String ext=filename.substring(filename.lastIndexOf("."));
            filename=username + ext;
            // Uploading Code
            inception.FileUploader.savefile(request,path,filename);
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE , ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from restaurant where username=\'"+username+"\' ");
                System.out.println("result set created");
                
                
                if(rs.next())
                {
                    rs.updateString("logo","./restaurant_logo/"+filename);
                    rs.updateRow();
                    out.println("photo added successfully");
                    
                          
                }
                
                
        %>
       
        <h1>Your request has been submiited successfully, Please wait while the admin reviews it</h1>
            </div>
                            <%@include file="footer.jsp"%>
        </div>
    
    </body>
</html>
