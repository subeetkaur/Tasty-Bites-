
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
                <span class="headings"> Menu added successfully </span>
                <br>
        <%@page import="java.sql.*"%>
        <%@page import="inception.*"%>
        <%
            String username = (String) session.getAttribute("rest");

            String name = request.getParameter("name");
            String description = request.getParameter("desc");
            String file = request.getParameter("image");

            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from restaurant_menu_category");
            System.out.println("result set created");

            rs.moveToInsertRow();

            rs.updateString("name", name);
            rs.updateString("description", description);
            rs.updateString("username", username);
            rs.insertRow();

            String path = getServletContext().getRealPath("/restaurant_category");

            String ext = file.substring(file.lastIndexOf("."));
            

            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with database success");
            Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs2 = stmt2.executeQuery("select max(rmid) 'id' from restaurant_menu_category");

            System.out.println("result set created");

            int id = -1;
            if (rs2.next()) {
                id = rs2.getInt("id");
            }

            file = id + ext;
            inception.FileUploader.savefile(request, path, file);
            rs = stmt.executeQuery("select * from restaurant_menu_category where rmid='" + id + "'");
            if (rs.next()) {
                rs.updateString("photo", "./restaurant_category/" + file);
                rs.updateRow();
            }

        %>
</div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>