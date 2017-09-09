<%-- 
    Document   : main_home
    Created on : May 12, 2014, 6:10:02 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home</title>
        <link href="css1.css" type="text/css" rel="stylesheet">


        <script>


            function lightboxpic(ob)
            {
                var width = window.innerWidth;
                var height = window.innerHeight;

                document.getElementById("div1").style.display = "block";
                width = (width - 400) / 2;
                height = (height - 100) / 2;

                document.getElementById("div2").style.display = "block";
                document.getElementById("close").style.display = "block";
                document.getElementById("close").style.top = (height - 20) + "px";
                document.getElementById("close").style.left = (width + 375) + "px";
                document.getElementById("div2").style.top = height + "px";
                document.getElementById("div2").style.left = width + "px";
                document.getElementById("img1").src = ob;
            }


            var xmlhttp;

            function removelightbox()
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


                var city = document.getElementById("city").value;

                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "./setCity?city=" + city, true);
                xmlhttp.send();



            }
            function go2()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("div2").style.display = "none";
                    document.getElementById("div1").style.display = "none";
                    document.getElementById("close").style.display = "none";
                    
                    window.location = "main_home2.jsp?cus=" + document.getElementById("cus").value;
                }
            }
        </script>
    </head>
    <%@page import="java.sql.*" %>
    <body onload="lightboxpic()">
        <div id="all"> 
            <%@include file="header.jsp"%>

            <div id="main" align="center">

                <%
                String cuisine = request.getParameter("q");
                
                %>
                <input type="hidden" value="<%=cuisine%>" id="cus">


    </div>


    <%@include file="footer.jsp"%>
</div>
<div id="div1" style="display: none; z-index: 3000; height: 100% ; width: 100%; background-color: gray; opacity: 0.6; position: fixed; top: 0px; left: 0px;">

</div>
<div id="div2" style="display: none; text-align: center;  z-index: 8000; height: 100px ; width: 400px; background-color: #fe8908; border: solid 5px white; border-radius: 10px; position: fixed; top: 300px; left: 400px;">
    <table width="100%" >
        <tr>
            <td>Enter City</td>
        <br>
        <td><select name="city" id="city">
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driver loaded successfully");
                    Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                    System.out.println("connection with database success");
                    Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs2 = stmt2.executeQuery("select * from city");
                    System.out.println("result set created");

                    while (rs2.next()) {
                %>
                <option value="<%=rs2.getString("city")%>"><%=rs2.getString("city")%></option>
                <%
                    }
                %>      

            </select></td>

        <td colspan="2"><input type="button" id="submit" onclick="removelightbox()" value="Find Restaurants" /></td>
        </tr>

    </table> 
</div>
<a onclick="removelightbox()" href="#" id="close" style="display: none; z-index: 8000;  color: white; border: none; position: fixed; top: 300px; left: 400px;" ></a>

</body>
</html>
