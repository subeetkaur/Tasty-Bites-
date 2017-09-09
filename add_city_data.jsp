

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title> add city data</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
            
            <div id="main">
        
        <%@page import="java.sql.*" %>
        
        <%
            String city;
            city=request.getParameter("city");
            
            //jdbc code
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from city where city='"+city+"'");
                System.out.println("result set created");
        
                
            if(rs.next())
            {
               response.sendRedirect("add_city.jsp?msg=City Already Added");
            }
            else
            {
                rs.moveToInsertRow();
                rs.updateString("city",city);
                rs.insertRow();
                
                response.sendRedirect("add_city.jsp?msg=City Added Successfully");
           }
            
          
        %>
        
     
    
    </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>