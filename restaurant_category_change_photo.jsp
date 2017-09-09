 <%-- 
    Document   : restaurant_category_change_photo
    Created on : Apr 17, 2014, 5:40:42 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit restaurant logo</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript">
            function go()
            {
                return confirm(" are you sure you want to upload");
            }
             function go(obj)
            {
                var name = document.getElementById("ff").value;
                var ext = name.substring(name.lastIndexOf("."));
                if(ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext ==".JPG")
                {
                    obj.action = obj.action + "&fn=" + name;
                    return true;
                }
                else
                {
                    alert("Upload Image Files only");
                    return false;
                }
            }
         </script>
              
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main">
       <%@page import="java.sql.*" %>
        <%
            
            String path="";
            String n=request.getParameter("p");
            ///JDBC CODE/////
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from restaurant_menu_category where rmid='"+ n +"'");
                System.out.println("result set created");
                
                if(rs.next())
                {
                    path=rs.getString("photo");
                }
                    %>
                    <img src="<%=path%>" height="300" width="300" align="center">
                    <form action="restaurant_category_change_photo2.jsp?p=<%=n%>" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
                    <table>
                        <tr>
                            <td>
                             <input type="file" name="file" id="ff">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" value="upload photo">
                            </td>
                        </tr>
                    </table>
                    </form>
                    </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>