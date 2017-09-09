<%-- 
    Document   : user_home
    Created on : May 3, 2014, 11:53:49 AM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user home</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        
         </head>
    <body>
       <div id="all">
            <%@include file="header.jsp"%>
            
            <div id="main" align="center">
        <h1><b> Welcome <%=session.getAttribute("user") %></b></h1>
      
                </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
