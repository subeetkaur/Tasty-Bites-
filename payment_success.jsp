<%-- 
    Document   : payment_success
    Created on : May 7, 2014, 6:48:37 PM
    Author     : LENOVO B560
--%>

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
            <%@include file="header.jsp"%>
            
            <div id="main">
        <%@page import="java.sql.*" %>
        <%@page import="java.util.*" %>
        <%@page import="inception.*;" %>
        <%

            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs = stmt.executeQuery("select * from orders");
            rs.moveToInsertRow();
            rs.updateDate("date", new java.sql.Date(new java.util.Date().getTime()));
            rs.updateString("username", session.getAttribute("user").toString());
            rs.updateString("total", session.getAttribute("total").toString());
            rs.insertRow();
            rs = stmt.executeQuery("select max(oid) 'oid' from orders");
            rs.next();
            int oid = rs.getInt("oid");
            ArrayList<cart> al = (ArrayList<cart>) session.getAttribute("cart");
            rs = stmt.executeQuery("select * from order_detail");
            for (int i = 0; i < al.size(); i++) {
                rs.moveToInsertRow();
                rs.updateInt("oid", oid);
                rs.updateString("menu_id", al.get(i).menuid);
                rs.updateString("qty", al.get(i).qty + "");
                rs.updateString("price", al.get(i).price + "");
                rs.insertRow();
            }
        %>
        
        <h3>Your transaction has been processed successfully. You will receive your order shortly.</h3>
        </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
