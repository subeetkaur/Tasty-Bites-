<%-- 
    Document   : view_cuisine
    Created on : Apr 9, 2014, 11:13:53 AM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view cuisine</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
         <script type="text/javascript">
            function go()
            {
                return confirm(" are you sure you want to delete?");
            }
         </script>
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
            
            <div id="main" align="center">
                <span class="headings">CUISINES</span>
                <br>
                <br>
         <%@page import="java.sql.*" %>
         
         <% 
         Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from food_category");
                System.out.println("result set created");
             %>
             <%
            String msg=request.getParameter("msg");
            if(msg!=null)
            {
        %>
        <span style="color:blue"><%=msg%></span>
        <%
          }
%>  
             
            
<table cellspacing-="1" align="center" style="border: solid 2px black;">
                     <tr>
                        
            <th>S.No.</th>
            <th>Cuisine</th>
            <th>Description</th>
            <th>Photo</th>
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
                    <td><%=rs.getString("fc_name")%></td>
                    <td><%=rs.getString("description")%></td>
                    <td><img src="<%=rs.getString("logo")%>" height="90" width="90"/></td>
                    <td><a href="edit_cuisine.jsp?q=<%=rs.getString("fc_name")%>" >Edit</a></td>
                    <td><a href="delete_cuisine.jsp?q=<%=rs.getString("fc_name")%>" onclick="return go()">Delete</a></td>
                    <td><a href="edit_cuisine_pic.jsp?q=<%=rs.getString("fc_name")%>"> Edit Logo</a></td>
                </tr>
                <%}%>
                 </table>
                 </div>
                            <%@include file="footer.jsp"%>
        </div>
            </body>
</html>
