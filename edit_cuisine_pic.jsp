<%-- 
    Document   : edit_cuisine_pic
    Created on : Apr 10, 2014, 11:26:58 AM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit cuisine logo</title>
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
            <%@include file="header_admin.jsp"%>
            
            <div id="main" align="center">
                <span class="headings">Change Cuisine Photo</span>
                <br>
       <%@page import="java.sql.*" %>
        <%
            
            String path="";
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
                    path=rs.getString("logo");
                }
                    %>
                    <img src="<%=path%>" height="300" width="300" align="center">
                    <form action="edit_cuisine_pic2.jsp?q=<%=n%>" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
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
