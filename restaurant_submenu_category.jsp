<%-- 
    Document   : restaurant_submenu_category
    Created on : Apr 22, 2014, 3:46:14 PM
    Author     : LENOVO B560
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>adding sub menu</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
         <script>
           function go(obj)
           {
               var image=document.getElementById("ff").value;
               var name=document.getElementById("name").value;
               var category=document.getElementById("category").value;
               var ext=image.substring(image.lastIndexOf("."));
               if(ext==".jpg"||ext==".jpeg"||ext==".png"||ext==".PNG"||ext==".JPG"||ext==".JPEG")
               {
                   obj.action = obj.action +"?image=" + ext + "&name=" + name + "&cat=" + category;
                   return true;
               }
               else
               {
                   alert("upload image files only");
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
         <h1 align="center">Add submenu</h1>
         <form action="restaurant_submenu_category2.jsp" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
            <table align="center">
                <tr>
                    <td>sub_menu  name</td>
                    <td><input type="text" required required name="name" id="name"></td>
                </tr>
                <tr>
                    <td>category (to which food belongs)</td>
                    <td><select name="category" id="category">
                            <%
                            
                            Class.forName("com.mysql.jdbc.Driver");
                            System.out.println("Driver loaded successfully");
                            Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                            System.out.println("connection with daabase success");
                            Statement stmt=conn.createStatement();
                            ResultSet rs=stmt.executeQuery("select * from restaurant_menu_category where username=\'"+session.getAttribute("rest")+"\' ");
                            System.out.println("result set created");
                            System.out.println(session.getAttribute("rest"));
                            while(rs.next())
                            {
                          %>  
                          <option value="<%=rs.getInt("rmid")%>"><%=rs.getString("name")%></option>
                          <%
                            }
                          %>      
                            
                        </select></td>
                </tr>
                <tr>
                    <td>select image</td>
                    <td><input type="file" name="file" id="ff" ></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="add" name="submit"></td>
                </tr>
            </table>
        </form>
            
            </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
