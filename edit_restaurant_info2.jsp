<%-- 
    Document   : edit_restaurant_info2
    Created on : Apr 13, 2014, 11:23:48 AM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit restaurant information logic</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main" align="center">
                <span class="headings">Restaurant Data Updated Successfully</span>
        <%@page import="java.sql.*" %>
        <%
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String email = request.getParameter("email");
            String contact_no = request.getParameter("contact_no");
            String address = request.getParameter("address");
            String security_question = request.getParameter("security_question");
            String security_ans = request.getParameter("security_ans");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");
            String city = request.getParameter("city");
            String fc = request.getParameter("fc");
            String un = request.getParameter("username");
            String delivery_in=request.getParameter("delivery_in");
            String min_order=request.getParameter("min_order");
            String delivery_charges=request.getParameter("delivery_charges");
            String free_delivery_above=request.getParameter("free_delivery_above");
            ///JDBC CODE/////

            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from restaurant where username='" + un + "'");
            System.out.println("result set created");

                rs.next();

                rs.updateString("name", name);
                rs.updateString("description", description);
                rs.updateString("email", email);
                rs.updateString("contact_no", contact_no);
                rs.updateString("address", address);
                rs.updateString("security_question", security_question);
                rs.updateString("security_ans", security_ans);
                rs.updateString("latitude", latitude);
                rs.updateString("longitude", longitude);
                rs.updateString("city", city);
                rs.updateString("delivery_in",delivery_in);
                rs.updateString("min_order",min_order);
                rs.updateString("delivery_charges",delivery_charges);
                rs.updateString("free_delivery_above",free_delivery_above);
                rs.updateRow();
                //out.println("data updated successfully");
            
        %>
        </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
