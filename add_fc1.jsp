<%-- 
    Document   : add_fc1
    Created on : Apr 8, 2014, 5:12:08 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add category</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header_admin.jsp"%>
           
            <div id="main" align="center">
                <span class="headings">ADD CUISINE</span>
                <br>
                <br>
        <form action="add_fc2.jsp" method="post">
            <table>
                <tr>
                    <td>Category Name</td>
                    <td><input type="text" required name="cuisine" id="cuisine" required=""/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea name="description" id="description"></textarea></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="add" /></td>
                </tr>
                
            </table>  
        </form>
                <% 
String msg=request.getParameter("msg");
if(msg!=null)
{
    %>
    <span style="color:red;"><%=msg%></span>
    <%
}
%> 
                </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
