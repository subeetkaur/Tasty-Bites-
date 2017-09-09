<%-- 
    Document   : view_approved_restaurant
    Created on : Apr 12, 2014, 4:15:14 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view approved restaurants</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
           <script type="text/javascript">
            function go()
            {
                return confirm(" are you sure you want to disapprove");
            }
        </script>
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
           
            <div id="main" align="center">
                <span class="headings">Approved Restaurants</span>
                <br>
         <%@page import="java.sql.*" %>
         
         <% 
         Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from restaurant where status='approved'");
                System.out.println("result set created");
             %>
            
                 <table border="1" cellspacing-="1" align="center">
                     <tr>
                        
            <th>S.No.</th>
            <th>Username</th>
            <th>Name</th>
            <th>Email</th>
            <th>Contact_no</th>
            <th>Address</th>
            <th>City</th>
            <th>Logo</th>
            
            <th></th>
            <th></th>
                     </tr>
                
        
            <%
                int i=1;
            while(rs.next())
            {
                %>
                
                <tr>
                    <td><%=i++%></td>
                    <td><%=rs.getString("username")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("email")%></td>
                    <td><%=rs.getString("contact_no")%></td>
                    <td><%=rs.getString("address")%></td>
                    <td><%=rs.getString("city")%></td>
                    <td><img src="<%=rs.getString("logo")%>" height="90" width="90"/></td>
                    <td><a href="disapprove_restaurant.jsp?q=<%=rs.getString("username")%>" onclick="return go()">Disapprove</a></td>
                </tr>
                <%}%>
                 </table>
                 </div>
                            <%@include file="footer.jsp"%>
        </div>
            </body>
</html>


       
    
