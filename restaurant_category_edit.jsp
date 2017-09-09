

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit cuisine</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript">
             function go()
               {
                   return confirm(" are you sure u wanna update ?");
               } 
        </script>
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
           
            <div id="main" align="center">
                <span class="headings">Update Restaurant Menu Category</span>
                <br>
        <%@page import="java.sql.*" %>
        <%
            String id=request.getParameter("p");
            
           
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from restaurant_menu_category where rmid='"+ id +"'");
                System.out.println("result set created");
                
                String name="";
                String description="";
                if(rs.next())
                {
                    name=rs.getString("name");
                    description=rs.getString("description");
                    }
                %>
                <form action="restaurant_category_edit2.jsp?p=<%=id%>" method="post">
                     <table border="1">
                <tr>
                    <td>Category Name</td>
                    <td><input type="text" required value="<%=name%>" name="name" /></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea  name="desc" required><%=description%> </textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="update" onClick="return go()" /></td>
                </tr>
                    </table>
                </form>
                    </div>
                            <%@include file="footer.jsp"%>
        </div>    
                
    </body>
</html>

