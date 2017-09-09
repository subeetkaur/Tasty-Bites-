
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change photo</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
           function go(obj)
           {
               var name=document.getElementById("ff").value;
               var ext=name.substring(name.lastIndexOf("."));
               if(ext==".jpg"||ext==".jpeg"||ext==".png"||ext==".PNG"||ext==".JPG"||ext==".JPEG")
               {
                   obj.action = obj.action +"&fn=" + name;
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
            
            <div id="main" align="center">
                <span class="headings">Choose Food Item Photo</span>
                <%@page import="java.sql.*" %>
        
        <%
            String id;
            id=request.getParameter("id");
            String path="";
            
           
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE , ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from menu where menu_id=\'"+id+"\' ");
                System.out.println("result set created");
                
                if(rs.next())
                {
                     path=rs.getString("photo");
                }
        %>
        <img src="<%=path%>" height="300" width="300"  align="center">
        <form action="edit_menu_changephoto2.jsp?q=<%=id%>" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
                
              <table align="center" top="200px">
                  <tr>
                      <td> <input type="file" name="file" id="ff" ></td>
                      <td> <input type="submit" value="upload button"></td>
                  </tr>
              </table>
              
          </form>
        </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
