<%-- 
    Document   : change_rest_password2
    Created on : Apr 12, 2014, 11:31:06 AM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change restaurant password logic</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main" align="center">
        <%@page import="java.sql.*"%>
        <%
            String oldpassword,newpassword,confirmpassword;
            oldpassword=request.getParameter("password");
            newpassword=request.getParameter("newpw");
            confirmpassword=request.getParameter("cpw");
            String username= (String)session.getAttribute("rest");
            
            if(newpassword.equals(confirmpassword))
            {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Loading driver");
                
                Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("Connection build");
                
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                
                ResultSet rs=stmt.executeQuery("select * from restaurant where username='"+username+"' and password='"+oldpassword +"'");
                
                if(rs.next())
                    {
                    rs.updateString("password", newpassword);
                    rs.updateRow();
                  %>
                    <h2>Password updated successfully</h2>
                    <%
                    
                }
                else
                {
                    response.sendRedirect("change_rest_password1.jsp?msg=Invalid username password");
                }
            }
            else
                {
                response.sendRedirect("change_rest_password1.jsp?msg=password does not match"); 
         }
            %>
            </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
