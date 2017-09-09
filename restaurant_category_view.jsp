

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            
           function go()
               {
                   return confirm(" are you sure you want to delete?");
               } 
        </script>
    </head>
    <body>
            <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main">
        <%@page import="java.sql.*" %>

        <%
            String username = (String) session.getAttribute("rest");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with daabase success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from restaurant_menu_category where username=\'" + username + "\'; ");
            System.out.println("result set created");
        %>

        <form action="" method="post" >
            <h1 align="center"> restaurant menu category </h1>
            <table border="1" align="center">
                <thead>
                    <tr>

                        <th>S.NO</th>
                        <th> category name</th>
                        <th>description</th>
                        <th>Photo</th>



                    </tr>
                </thead>
                <tbody>
                    <%
            int i =1;
                        while(rs.next()) {

                    %> 
                    <tr>
                        <td><%=i++%> </td>
                        <td><%=rs.getString("name")%></td>
                        <td><%=rs.getString("description")%></td>
                        
              

                        <td><img src="<%=rs.getString("photo")%>" width="100" height="100"/></td>
                        <td><a href="restaurant_category_delete.jsp?p=<%=rs.getString("rmid")%>" onclick="return go()"> delete</a></td>
                        <td><a href="restaurant_category_change_photo.jsp?p=<%=rs.getString("rmid")%>">change photo</a></td>
                        <td><a href="restaurant_category_edit.jsp?p=<%=rs.getString("rmid")%>">edit</a></td>


                    </tr>
                    <%

                        }
                    %>

                    
                </tbody>
            </table>
                    </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
