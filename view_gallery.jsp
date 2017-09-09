<%-- 
    Document   : view_gallery
    Created on : May 8, 2014, 3:37:19 PM9
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view gallery</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            var xmlhttp;
            function go1()
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



                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "./user_gallery", true);
                xmlhttp.send();
            }
            function go2()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    document.getElementById("pic").innerHTML = xmlhttp.responseText;
                }
            }
        </script>
        
        
                <script>

            function lightboxpic(ob)
            {
                var width = window.innerWidth;
                var height = window.innerHeight;

                document.getElementById("div1").style.display = "block";
                width = (width - 600) / 2;
                height = (height - 500) / 2;

                document.getElementById("div2").style.display = "block";
                document.getElementById("close").style.display = "block";
                document.getElementById("close").style.top = (height-20)+"px";
                document.getElementById("close").style.left = (width+575)+"px";
                document.getElementById("div2").style.top = height + "px";
                document.getElementById("div2").style.left = width + "px";
                document.getElementById("img1").src = ob;
            }
            function removelightbox()
            {
                document.getElementById("div2").style.display = "none";
                document.getElementById("div1").style.display = "none";
                document.getElementById("close").style.display = "none";

            }
        </script>

    </head>
    <body onload="go1()">
        <div id="all">
            <%@include file="header.jsp"%>
            
            <div id="main">

        <%@page  import="java.sql.*" %>
        <%
            String user = request.getParameter("user");
            session.setAttribute("id1", user);
        %>
        <%
            user = request.getParameter("user");

            //jdbc code
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with database success");
            Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs1 = stmt1.executeQuery("select * from restaurant where username='" + user + "'");
            System.out.println("result set created");

            rs1.next();
        %>



        <table align="center">
            <tr  >
                <td colspan="2"><img src="<%=rs1.getString("logo")%>" height="250" width="250" style="border: solid 2px lightskyblue;" <td>
                <td><table><tr align="center">
                            <td colspan="2"><span style="font-family: cursive; font-size: 22px; font-weight: bold;"><%=rs1.getString("username")%></span></td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Address</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs1.getString("address")%></span></td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Phone Number:</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs1.getString("contact_no")%></span></td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Description</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs1.getString("description")%></span></td>
                        </tr></table></td>

            </tr>   

        </table>

        <div id="pic">


        </div>


<!--        <a href="#" onclick="lightboxpic('./images/a.jpg')" title="profile pic"><img src="./images/a.jpg" width=100 height=100/></a>-->
       
        
        
        
        <div id="div1" style="display: none; z-index: 30; height: 100% ; width: 100%; background-color: gray; opacity: 0.6; position: fixed; top: 0px; left: 0px;">

        </div>
        <div id="div2" style="display: none;  z-index: 80; height: 500px ; width: 600px; background-color: white; border: solid 5px white; border-radius: 10px; position: fixed; top: 300px; left: 400px;">
            <img height="500" width="600" src="" id="img1">
            
        </div>
        <a onclick="removelightbox()" href="#" id="close" style="display: none; z-index: 100;  color: white; border: none; position: fixed; top: 300px; left: 400px;" >Close</a>

            </div>
                         <%@include file="footer.jsp"%>
        </div>

    </body>
</html>
