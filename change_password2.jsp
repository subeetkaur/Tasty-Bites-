
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>change password2</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
        
            <div id="main" align="center">
        <%@page import="java.sql.*"%>
        <%
            String oldpassword,newpassword,confirmpassword;
            oldpassword=request.getParameter("pw");
            newpassword=request.getParameter("newpw");
            confirmpassword=request.getParameter("cpw");
            String username= (String)session.getAttribute("un");
            
            if(newpassword.equals(confirmpassword))
            {
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Loading driver");
                
                Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("Connection build");
                
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                
                ResultSet rs=stmt.executeQuery("select * from admin where username='"+username+"' and password='"+oldpassword +"'");
                
                if(rs.next())
                {
                    rs.updateString("password", newpassword);
                    rs.updateRow();
                    response.sendRedirect("change_password1.jsp?msg=Password Updated successfully.");
                    
                }
                else
                {
                    response.sendRedirect("change_password1.jsp?msg=Old password incorrect");
                }
            }
            else
                {
                response.sendRedirect("change_password1.jsp?msg=password does not match"); 
         }
            %>
            </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
