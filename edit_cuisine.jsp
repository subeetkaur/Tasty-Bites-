<%-- 
    Document   : edit_cuisine
    Created on : Apr 9, 2014, 1:18:11 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit cuisine</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
            
            <div id="main" align="center">
                <span class="headings">Edit Cuisine</span>
                <br>
        <%@page import="java.sql.*" %>
        <%
            String fc_name="";
            String description="";
            String n=request.getParameter("q");
            ///JDBC CODE/////
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from food_category where fc_name='"+ n +"'");
                System.out.println("result set created");
                
                if(rs.next())
                {
                    fc_name=rs.getString("fc_name");
                    description=rs.getString("description");
                    }
                %>
                <form action="edit_cuisine2.jsp" method="post">
                     <table border="1">
                <tr>
                    <td>Category Name</td>
                    <td><input type="text" required value="<%=fc_name%>" name="fc" readonly/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea  name="desc" required><%=description%> </textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="update" /></td>
                </tr>
                    </table>
                </form>
          </div>
                            <%@include file="footer.jsp"%>
        </div>              
                
    </body>
</html>
