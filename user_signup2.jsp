<%-- 
    Document   : user_signup2
    Created on : May 3, 2014, 11:35:42 AM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript">
</script> 
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
            
            <div id="main">
                <%@page import="java.sql.*" %>
       <%
            String username,password,conf_password,name,email,contactno,city,address;
            username=request.getParameter("username");
            password=request.getParameter("password");
            name=request.getParameter("name");
            email=request.getParameter("email");
            contactno=request.getParameter("contactno");
            city=request.getParameter("city");
            address=request.getParameter("address");
            //jdbc code
            
           System.out.println(username);
             Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
             Connection conn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
                ResultSet rs=stmt.executeQuery("select * from user where username=\'"+username+"\' ");
                System.out.println("result set created");
        
                if(rs.next())
            {
                response.sendRedirect("user_signup.jsp?msg=invalid username/password");
            }
            else
            {
               
                  rs.moveToInsertRow();
                  rs.updateString("username",username);
                  rs.updateString("password",password);
                  rs.updateString("name",name);
                  rs.updateString("email",email);
                  rs.updateString("mobile_no",contactno);
                  rs.updateString("address",address);
                  rs.updateString("city",city);
                  rs.insertRow();
                  out.println("User added successfully");
                
                //response.sendRedirect("user_home.jsp");
            }
             
               
                %>
                <form action="user_login.jsp" method="post">
        <input type="submit" value="login" >
    </form>
                    
             </div>
                            <%@include file="footer.jsp"%>
        </div>
                    
    </body>
</html>
