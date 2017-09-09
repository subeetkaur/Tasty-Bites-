<%-- 
    Document   : change_user_password2
    Created on : May 3, 2014, 12:17:53 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change user password logic</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
          
            <div id="main">
        <%@page import="java.sql.*"%>
        <%
            String oldpassword,newpassword,confirmpassword;
            oldpassword=request.getParameter("password");
            newpassword=request.getParameter("newpw");
            confirmpassword=request.getParameter("cpw");
            String username= (String)session.getAttribute("user");
            
            if(newpassword.equals(confirmpassword))
            {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Loading driver");
                
                Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("Connection build");
                
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                
                ResultSet rs=stmt.executeQuery("select * from user where username='"+username+"' and password='"+oldpassword +"'");
                
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
                    response.sendRedirect("change_user_password1.jsp?msg=Invalid username password");
                }
            }
            else
                {
                response.sendRedirect("change_user_password1.jsp?msg=password does not match"); 
         }
            %>
            </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
