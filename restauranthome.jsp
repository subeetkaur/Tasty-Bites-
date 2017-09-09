
<%@page import="java.lang.String"%>
<%-- 
    Document   : restauranthome
    Created on : Apr 11, 2014, 6:37:40 PM
    Author     : LENOVO B560
--%>

<%@page import="java.sql.*;"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>restaurant home</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        
         </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main" align="center">
        <%
            String name=(String)session.getAttribute("rest");
              Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from restaurant where username='"+name+"'");
                System.out.println("result set created");
           
        %>
        <h1> Welcome <%=session.getAttribute("rest") %></h1>
        <%
        if(rs.next())
        {
        %>
        <img src="<%=rs.getString("logo")%>" width="200" height="200"/>
        <%
        }
        %>
        
                </div>
                            <%@include file="footer.jsp"%>
        </div>
                 
    </body>
</html>