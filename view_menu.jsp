

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
            
           // #########################################################################
           
           
           
           function go5(ob)
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
                xmlhttp.open("GET","./menu_delete?id="+ob,true);
                xmlhttp.send();
            }
            function go6()
            {
                
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    go3();
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
                <br>

        <%@page import="java.sql.*" %>



        <form action="" method="post" >
            <table border="1" align="center">
                <thead>
                    <tr>

                        <td> select category </td>
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
                        <td>select sub category</td>
                    <td><select name="subcat" id="subcat" onchange="go3()">
                            <option value="select">select</option>
                        </select>
                            
                        </td>
                    </tr>
            </table>
        </form>
            <div id="show"></div>
            
            
         
            </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
