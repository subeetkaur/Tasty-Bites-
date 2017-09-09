<%-- 
    Document   : edit_menu
    Created on : Apr 23, 2014, 11:35:08 AM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit menu</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>

            function go()
            {
                return confirm(" are you sure u want to update ?");
            }
            var xmlhttp;
            function go1()
            {
                 var id = document.getElementById("category").value;

              
                try
                {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
                }
                catch (e)
                {
                    try
                    {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
                    }
                    catch (e2)
                    {
                        xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                    }
                }



                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "./menu?id=" + id, true);
                xmlhttp.send();
            }
            function go2()
            {
               
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    
                    document.getElementById("subcat").innerHTML = xmlhttp.responseText;
                }
            }
            
            
            //##############################################################################
            
            function go3()
            {
                 var id1 = document.getElementById("subcat").value;

                 
                try
                {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP")  // For Old Microsoft Browsers
                }
                catch (e)
                {
                    try
                    {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP")  // For Microsoft IE 6.0+
                    }
                    catch (e2)
                    {
                        xmlhttp = new XMLHttpRequest();        //For Mozilla, Opera Browsers
                    }
                }



                xmlhttp.onreadystatechange = go4;
                xmlhttp.open("GET", "./view_menu?id="+id1, true);
                xmlhttp.send();
            }
            function go4()
            {
               
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    
                    document.getElementById("show").innerHTML = xmlhttp.responseText;
                }
            }
            
            
        </script>
            </head>
             
            <body>
                <div id="all">
            <%@include file="header_rest.jsp"%>
           
            <div id="main">
            <%@page import="java.sql.*" %>
            <%

                String id = request.getParameter("id");
                ///JDBC CODE/////

                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Driver loaded successfully");
                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                System.out.println("connection with database success");
                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                ResultSet rs = stmt.executeQuery("select * from menu where menu_id='" + id + "'");
                System.out.println("result set created");

                if (rs.next()) {

            %>
                
            <form action ="edit_menu2.jsp?id=<%= id%>" method = "post">
                    <table border = "1">
                    <tr>
                    <td> Name </td>
                    <td> <input type = "text" value = "<%=rs.getString("name")%>" name = "item" id = "item"/> </td>
                    </tr>
                    <tr>
                    <td> Description </td>
                    <td> <textarea  name = "desc" required><%=rs.getString("description")%> </textarea></td>
                    </tr>
                    <tr>
                    <td> Price </td>
                    <td> <input type = "text" value = "<%=rs.getString("price")%>" name = "price" id = "price"/> </td>
                    </tr>
                    <tr>

                        <td> select category </td>
                        <td><select name="category" id="category" onchange="go1()">
                                <option>select</option>
                                <%

                                    Class.forName("com.mysql.jdbc.Driver");
                                    System.out.println("Driver loaded successfully");
                                    Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "1234");
                                    System.out.println("connection with daabase success");
                                    Statement stmt2 = conn2.createStatement();
                                    ResultSet rs2 = stmt2.executeQuery("select * from restaurant_menu_category where username=\'" + session.getAttribute("rest") + "\' ");
                                    System.out.println("result set created");
                                    System.out.println(session.getAttribute("rest"));
                                    while (rs2.next()) {
                                %>  
                                <option value="<%=rs2.getInt("rmid")%>"
                                        <%
                                        if(rs.getInt("category") == rs2.getInt("rmid")) {
                                            %>
                                            selected="selected"
                                            
                                            <%
                                        }
                                        %>
                                        
                                       ><%=rs2.getString("name")%></option>
                                <%
                                    }
                                %>      

                            </select></td>

                    </tr>
                    <tr>
                        <td>select sub category</td>
                    <td><select name="subcat" id="subcat" onchange="go3()">
                             <%

                                    Class.forName("com.mysql.jdbc.Driver");
                                    System.out.println("Driver loaded successfully");
                                    Connection conn3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "1234");
                                    System.out.println("connection with database success");
                                    Statement stmt3 = conn3.createStatement();
                                    ResultSet rs3 = stmt3.executeQuery("select * from restaurant_menu_subcategory where rm_id=\'" + rs.getInt("category") + "\' ");
                                    System.out.println("result set created");
                                    System.out.println(session.getAttribute("rest"));
                                    while (rs3.next()) {
                                %>  
                                <option value="<%=rs3.getInt("rms_id")%>"
                                        <%
                                        if(rs.getInt("sub_category") == rs3.getInt("rms_id")) {
                                            %>
                                            selected="selected"
                                            
                                            <%
                                        }
                                        %>
                                        ><%=rs3.getString("sub_name")%></option>
                                <%
                                    }
                                    %>
                            
                        </td>
                    </tr>
                    <tr>
                    <td colspan = "2"> <input type = "submit" value = "update" onclick="return go()"/></td>
                    </tr>
                    </table>
                    </form>

            <%
                }
            %>
            </div>
                            <%@include file="footer.jsp"%>
        </div>
            </body>
                    </html>
