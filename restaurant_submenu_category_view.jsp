<%-- 
    Document   : restaurant_submenu_view
    Created on : Apr 22, 2014, 3:48:24 PM
    Author     : LENOVO B560
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>

            function go()
            {
                return confirm(" are you sure u wanna update ?");
            }
            var xmlhttp;
            function go1()
            {
                var id = document.getElementById("category").value;

               // alert(id);
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
                xmlhttp.open("GET", "./rest_sub_menu?id=" + id, true);
                xmlhttp.send();
            }
            function go2()
            {
                //alert(xmlhttp.responseText);
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("show").innerHTML = xmlhttp.responseText;
                }
            }
            
            function go5(ob)
            {
    
                //alert(ob);
                var c=confirm("Do you want to Delete ?");
                if(c===true)
                {
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
                xmlhttp.onreadystatechange=go6;
                xmlhttp.open("GET","./rest_sub_menu_delete?id="+ob,true);
                xmlhttp.send();
               }
               else
               {
                   return false;
               }
            }
            function go6()
            {
                //alert(xmlhttp.responseText);
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    go1();
                    //document.getElementById("pic").innerHTML=xmlhttp.responseText;
                }
            }
        </script>
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main" align="center">
                <span class="headings">Restaurant SubMenu View</span>
        <%@page import="java.sql.*" %>



        <form action="" method="post" >
            
            <table border="1" align="center">
                <thead>
                    <tr>

                        <td>menu category name </td>
                        <td><select name="category" id="category" onchange="go1()">
                                <option>select</option>
                                <%

                                    Class.forName("com.mysql.jdbc.Driver");
                                    System.out.println("Driver loaded successfully");
                                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                                    System.out.println("connection with daabase success");
                                    Statement stmt = conn.createStatement();
                                    ResultSet rs = stmt.executeQuery("select * from restaurant_menu_category where username=\'" + session.getAttribute("rest") + "\' ");
                                    System.out.println("result set created");
                                    System.out.println(session.getAttribute("rest"));
                                    while (rs.next()) {
                                %>  
                                <option value="<%=rs.getInt("rmid")%>"><%=rs.getString("name")%></option>
                                <%
                                    }
                                %>      

                            </select></td>

                    </tr>
                     <tr>
                        
                    </tr>

            </table>
            <%
                String message = request.getParameter("msg");
                if(message!=null)
                {
            %>
            <span style="font-size: 18px;color: red;"><%=message%></span>
            <%
                }
            %>
                                <br>
                                
            <div id="show"></div>
           
            </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
