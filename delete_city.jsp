

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>manage city data</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
            
            <div id="main">
        <%@page import="java.sql.*" %>
        <%
            String del_city;
            del_city=request.getParameter("city");
            try
            {
            Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Loading driver");
                
                Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("Connection build");
                
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                
                ResultSet rs=stmt.executeQuery("select * from city where city=\'"+del_city+"\'");
                if(rs.next())
               
                    rs.deleteRow();
               
                    out.println("city deleted successfully");
                    response.sendRedirect("view_city.jsp");
                }
            catch(Exception e)
            {
                response.sendRedirect("view_city.jsp?msg=City cannot be deleted. It has restaurants added under it.");
            }
                
                %>
                </div>
                <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
