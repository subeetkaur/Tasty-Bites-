<%-- 
    Document   : home3
    Created on : Apr 30, 2014, 11:46:53 PM
    Author     : LENOVO B560
--%>

<%@page import="inception.cart"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>menu</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script src="SpryAssets/SpryTabbedPanels.js" type="text/javascript"></script>
        <link href="SpryAssets/SpryTabbedPanels.css" rel="stylesheet" type="text/css">



        <script type="text/javascript">
            var xmlhttp;

            function go(id)
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

                var qty = document.getElementById("a_" + id).value;



                xmlhttp.onreadystatechange = go2;
                xmlhttp.open("GET", "./AddToCart?id=" + id + "&qty=" + qty, true);
                xmlhttp.send();
            }
            function go2()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    //document.getElementById("pic").innerHTML = xmlhttp.responseText;
                }
            }

            function up(id)
            {
                var qty = parseInt(document.getElementById("a_" + id).value);
                qty++;
                document.getElementById("a_" + id).value = qty;
            }
            function down(id)
            {
                var qty = parseInt(document.getElementById("a_" + id).value);
                qty--;
                if (qty <= 0)
                {
                    qty = 0;
                }
                document.getElementById("a_" + id).value = qty;
            }
        </script>
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
            
            <div id="main">
        <%@page import="java.sql.*" %>

        <%
            String user;
            user = request.getParameter("user");

            //jdbc code
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select * from restaurant where username='" + user + "'");
            System.out.println("result set created");

            rs.next();
        %>
        <table>
            <tr align="center" >
                <td colspan="2"><img src="<%=rs.getString("logo")%>" height="250" width="250" style="border: solid 2px lightskyblue;" <td>
                <td><table><tr align="center">
                            <td colspan="2"><span style="font-family: cursive; font-size: 22px; font-weight: bold;"><%=rs.getString("username")%></span></td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Address</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs.getString("address")%></span></td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Phone Number:</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs.getString("contact_no")%></span></td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Delivery In</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs.getString("delivery_in")%></span> minutes</td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Delivery charges</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs.getString("delivery_charges")%></span> rs</td>
                        </tr>
                        <tr align="center">
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Free Delivery Above</span></td>
                            <td><span style="font-family: cursive; font-size: 14px;"><%=rs.getString("free_delivery_above")%></span> rs</td>
                        </tr>
                        <tr style="height: 50px; font-size: 22px;">
                            <td><a href="view_gallery.jsp?user=<%=user%>"> View Gallery</a></td>
                            <td><a href="comment.jsp?user=<%=user%>"> Post a Comment</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="index.jsp?lat=<%=rs.getString("latitude")%>&long=<%=rs.getString("longitude")%>&user=<%=user%>">View Location</a></td>
                            
                            
                        </tr>
                    </table></td>

            </tr>   
            
        </table>
        <br>
        <br>
        <br>
                        
        <%
            String user2;
            user2 = request.getParameter("user");
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with database success");
            Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            ResultSet rs2 = stmt2.executeQuery("select food_category.* from food_category inner join restaurant_category on  restaurant_category.fc_name=food_category.fc_name where username=\'" + user2 + "\'");
            System.out.println("result set created");
        %>

        <div style="width: 500px;">


            <table>
                <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Cuisines Served</span></td>
                <tr>
                    <%
                        while (rs2.next())
                        {
                    %>
                    <td style="text-align: center; width: 250px;"><img src="<%=rs2.getString("logo")%>" height="60" width="60"/>
                    <br>
                    <%=rs2.getString("fc_name")%>
                    </td>
                    <%
                        }
                    %>
                </tr>
            </table>
        </div>

        <div style="width: 700px;">
            <div id="TabbedPanels1" class="TabbedPanels">
                <ul class="TabbedPanelsTabGroup">
                    <%
                        ArrayList<Integer> al = new ArrayList<Integer>();
                        String user3;
                        user3 = request.getParameter("user");
                        Class.forName("com.mysql.jdbc.Driver");
                        System.out.println("Driver loaded successfully");
                        Connection conn3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                        System.out.println("connection with database success");
                        Statement stmt3 = conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                        ResultSet rs3 = stmt3.executeQuery("select  *  from restaurant_menu_category where username=\'" + user3 + "\'");
                        System.out.println("result set created");
                        while (rs3.next()) {
                    %>
                    <li class="TabbedPanelsTab" tabindex="0"><%=rs3.getString("name")%></li>
                        <%
                                al.add(rs3.getInt("rmid"));
                            }
                        %>
                </ul>
                <div class="TabbedPanelsContentGroup">
                    <%
                        for (int i = 0; i < al.size(); i++) {

                            Class.forName("com.mysql.jdbc.Driver");
                            System.out.println("Driver loaded successfully");
                            Connection conn4 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                            System.out.println("connection with database success");
                            Statement stmt4 = conn4.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                            ResultSet rs4 = stmt4.executeQuery("select  *  from restaurant_menu_subcategory where rm_id=\'" + al.get(i) + "\'");
                            System.out.println("result set created");
                    %>
                    <div class="TabbedPanelsContent">
                        <%
                            while (rs4.next()) {
                        %>

                        <div style="width: 700px;">
                            <h2><%=rs4.getString("sub_name")%> - </h2>
                            <img src="<%=rs4.getString("photo")%>" style="width: 700px; height: 200px;">
                            <br>
                            <br>
                            <h3>Menu Items - </h3>
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                System.out.println("Driver loaded successfully");
                                Connection conn5 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                                System.out.println("connection with database success");
                                Statement stmt5 = conn5.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs5 = stmt5.executeQuery("select  *  from menu where sub_category='" + rs4.getString("rms_id") + "'");
                                System.out.println("result set created");

                            %>
                            <table width="100%" >
                                <th>

                                </th>
                                <th style="text-align: left;">  
                                    Item
                                </th>
                                <th style="text-align: left;">
                                    Description
                                </th>
                                <th style="text-align: left;">
                                    Price(in Rs.)
                                </th>

                                <th style="text-align: left;">
                                    Quantity
                                </th>

                                <th>

                                </th>
                                <% while (rs5.next()) {
                                        System.out.println(rs5.getString("name"));
                                %>
                                <tr>
                                    <td>
                                        <img src="<%=rs5.getString("photo")%>" height="60" width="60">
                                    </td>
                                    <td style="text-align: left;">
                                        <%=rs5.getString("name")%>
                                    </td>
                                    <td style="text-align: left;">
                                        <%=rs5.getString("description")%>
                                    </td>
                                    <td style="text-align: left;">
                                        <%=rs5.getString("price")%>
                                    </td>
                                    <td>

                                         <%
                                            int qty = 0;
                                            ArrayList<inception.cart> al2 = (ArrayList<cart>) session.getAttribute("cart");
                                            if (al2 != null) {
                                                for (int k = 0; k < al2.size(); k++) {
                                                    if (al2.get(k).menuid.equals(rs5.getInt("menu_id") + "")) {
                                                        qty = al2.get(k).qty;
                                                    }
                                                }
                                            }
                                        %>
                                        <input onclick="down('<%=rs5.getInt("menu_id")%>')" type="button" value="-" style="width: 20px;">   <input type="text" required style="width:20px;" id="a_<%=rs5.getInt("menu_id")%>" value="<%=qty%>" readonly> <input type="button" onclick="up('<%=rs5.getInt("menu_id")%>')" value="+" style="width: 20px;">
                                    </td>
                                    <td style="text-align: left;">
                                        <a href="#" onclick="go('<%=rs5.getInt("menu_id")%>')">Add to Cart</a>
                                    </td>
                                </tr>

                                <%
                                    }
                                %>
                            </table>
                            <br>
                            <br>
                        </div>
                        <br>
                        <br>
                        <%
                            }
                        %>
                    </div>
                    <%
                        }
                    %>

                </div>
            </div>
            <script type="text/javascript">
                var TabbedPanels1 = new Spry.Widget.TabbedPanels("TabbedPanels1");
            </script>
        </div>

            </div>
                    <%@include file="footer.jsp" %>
        </div>




    </body>
</html>


