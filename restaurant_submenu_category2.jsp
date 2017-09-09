

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main" align="center">
                <span class="headings"> Submenu added successfully </span>
         <%@page import="java.sql.*" %>
       
        <%@page import="inception.*" %>
        <%
            String username = (String)session.getAttribute("rest");
            String name=request.getParameter("name");
            String cat=request.getParameter("cat");
         /*   String path = getServletContext().getRealPath("./restaurant_category");
            String filename = request.getParameter("image");
            System.out.println(filename);
            String ext = filename.substring(filename.lastIndexOf("."));
            filename = username + ext;
            inception.FileUploader.savefile(request, path, filename); */

            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with daabase success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from restaurant_menu_subcategory ");
            System.out.println("result set 1created");

            
            rs.moveToInsertRow();
                   
            rs.updateString("rm_id", cat);
            rs.updateString("sub_name", name);
            
            rs.updateString("photo",null);
           
            rs.insertRow();
             
            
            String path=getServletContext().getRealPath("/restaurant_submenu");
            
            
            String filename=request.getParameter("image");
            System.out.println(filename);
            String ext=filename.substring(filename.lastIndexOf("."));
            
           
            
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn2=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt2=conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE , ResultSet.CONCUR_UPDATABLE);
                ResultSet rs2=stmt2.executeQuery("select max(rms_id) 'id' from restaurant_menu_subcategory");
                
                System.out.println("result set2 created");
                
                int id=-1;
                if(rs2.next())
                {
                    id=rs2.getInt("id");
                }
                
                filename = id + ext;
                inception.FileUploader.savefile(request,path,filename);
                rs = stmt.executeQuery("select * from restaurant_menu_subcategory where rms_id='"+ id +"' ");
                if(rs.next())
                {
                  rs.updateString("photo","./restaurant_submenu/"+filename);
                  rs.updateRow();
                }
                
               // response.sendRedirect("restaurant_home.jsp");
        %>
        <h1>file uploaded successfully</h1>
        </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
