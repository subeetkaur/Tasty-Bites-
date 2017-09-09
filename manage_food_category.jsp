
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>manage food category</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main" align="center">
        <%@page import="java.sql.*;" %>

        <%
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from food_category");
            System.out.println("result set created");
            

        %>
        <form action="manage_food_category2.jsp" method="post">
            <h1 align="center"> Choose cuisine </h1>

            <table border="1" cellspacing-="1" align="center" style="border: solid 2px black;">
                <tr>



                    <%                        while (rs.next()) {
                            

                    %>
                    <td><input type="checkbox" name="<%=rs.getString("fc_name")%>"

                               <%
                                   Class.forName("com.mysql.jdbc.Driver");
                                   System.out.println("Driver loaded successfully");
                                   Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                                   System.out.println("connection with database success");
                                   Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                   ResultSet rs2 = stmt2.executeQuery("select * from restaurant_category where username='" + session.getAttribute("rest") + "'");
                                   System.out.println("result set created");
                                   while (rs2.next()) {
                                       
                                       if (rs.getString("fc_name").equals(rs2.getString("fc_name"))) {
                               %>
                               checked="checked"
                               <%            
                                       }
                                   }
                               %>

                               > <%=rs.getString("fc_name")%> </td>
                    <td><%=rs.getString("description")%></td>
                    <td><img src="<%=rs.getString("logo")%>" height="70" width="70"/></td>

                </tr>
                <%
                        
                    }
                %>
                <tr>
                    <td align="center" colspan="4">
                        <input type="submit" value="Manage">
                        
                    </td>

                </tr>
            </table>
        </form>
                </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
