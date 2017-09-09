<%-- 
    Document   : add_fc2
    Created on : Apr 8, 2014, 5:29:37 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>food category</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            function go(obj)
            {
                var name = document.getElementById("ff").value;
                var ext = name.substring(name.lastIndexOf("."));
                if(ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext ==".JPG")
                {
               //     var fc_name = document.getElementById("fc").value;
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
    <body
        <div id="all">
            <%@include file="header_admin.jsp"%>
            
            <div id="main" align="center">
                <span class="headings"> CHOOSE CUISINE PHOTO </span>
                <br>
                <br>
        <%@page import="java.sql.*" %>
        
        <%
            String fc_name,description;
            fc_name=request.getParameter("cuisine");
            description=request.getParameter("description");
            //jdbc code
            
             Class.forName("com.mysql.jdbc.Driver");
             System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
             System.out.println("connection with database success");
             Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
             ResultSet rs=stmt.executeQuery("select * from food_category where fc_name=\'"+fc_name+"\'");
             System.out.println("result set created");
        
                if(rs.next())
                {
                   // out.println("food category with same name present");
                    response.sendRedirect("add_fc1.jsp?msg=food category with same name present");
                }
                else
                {
                   // Insert data to database 
                    rs.moveToInsertRow();
                    rs.updateString("fc_name",fc_name);
                    rs.updateString("description",description);
                    rs.updateString("logo",null);
                    rs.insertRow();
                    ////////////////////////
                   
                }
                %>
                <form action="add_fc3.jsp?q=<%=fc_name%>" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
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
