

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view city</title>
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
                <span class="headings">Delete City</span>
                <br>
                <br>
       <%@page import="java.sql.*" %>
        
        <%
            String city;
            //jdbc code
            
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("select * from city");
            System.out.println("result set created");
        
                
        %>
        
        <table align="center" style="border: solid 2px black;">
            <tr>
            <th>S.No.</th>
            <th>City</th>
            </tr>
            <%
                int i=1;
            while(rs.next())
            {
                %>
                
                <tr>
                    <td><%=i++%></td>
                    <td><%=rs.getString("city")%></td>
                    <td><a href="delete_city.jsp?city=<%=rs.getString("city")%>" onclick="return go();">Delete</a></td>
                </tr>
               
                
                <%
                
                
                
            }
            %>
            
            
        </table>
            </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
