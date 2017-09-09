<%-- 
    Document   : add_city
    Created on : Apr 7, 2014, 5:48:10 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Add City</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
          
            <div id="main" align="center">
                <span class="headings">Add City</span>
                
                <br>
                <br>
        <form action="add_city_data.jsp" method="post">
            <table align="center" style="margin-top: 0px">
                <tr style="font-family: fantasy; font-size: 16px; font-weight: normal;">
                    <td> Add Cities</td>
                
                    <td><input type="text" required id="city" name="city" placeholder="add city here" required/></td>
                
            </tr>
                   <tr>
                       <td><input type="submit" value="ADD"/></td>
                   </tr>
                   <tr>
                       <td>
                           <% 
String msg=request.getParameter("msg");
if(msg!=null)
{
    %>
    <span style="color:brown;"><%=msg%></span>
    <%
}
%> 
                       </td>
                   </tr>
            </table>
        </form>
                
         
</div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
