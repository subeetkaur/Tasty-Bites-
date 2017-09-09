<%-- 
    Document   : view_cart
    Created on : May 3, 2014, 5:28:33 PM
    Author     : saini
--%>


<%@page import="inception.delivery"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view cart</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
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

            var xmlhttp;
            function add(id)
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
                    alert("Item updated in cart");
                    window.location = "view_cart.jsp"
                    //document.getElementById("pic").innerHTML = xmlhttp.responseText;
                }
            }

            function rem(id)
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


                var flag = confirm("Are you sure , you want to remove item from cart ?");
                if (flag)
                {
                    xmlhttp.onreadystatechange = go22;
                    xmlhttp.open("GET", "./remove_cart?id=" + id, true);
                    xmlhttp.send();
                }
            }
            function go22()
            {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    window.location = "view_cart.jsp";
                }
            }
            function check()
            {
                window.location = "checkout.jsp"
            }
        </script>
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
           
            <div id="main" align="center">
                <span class="headings">Your Cart</span>
                
                <br>
                <br>
                <%@page import="inception.cart" %>
                <%@page import="java.util.ArrayList"%>
                <%@page import="java.sql.*" %>



                <%
                    ArrayList<inception.cart> al = (ArrayList<inception.cart>) (session.getAttribute("cart"));
                    
                    ArrayList<inception.delivery> al2 = new ArrayList<inception.delivery>();

                    int total2 = 0;

                    if (session.getAttribute("cart") == null || al.size() == 0) {

                %>
                <h1 align="center"> your cart is empty  </h1>

                <%                } else {
                %>


                <table border="1" align="center" style="border: solid;">
                    <thead>


                    </thead>
                    <tbody>

                        <%
                            Class.forName("com.mysql.jdbc.Driver");
                            System.out.println("Driver loaded successfully");
                            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                            System.out.println("connection with database success");
                            Statement stmt = conn.createStatement();
                            ResultSet rs;

                            for (int i = 0; i < al.size(); i++) {

                                String rest = al.get(i).restaurant;
                                boolean traverse = true;
                                for (int j = i - 1; j >= 0; j--) {
                                    if (al.get(j).restaurant.equals(rest)) {
                                        traverse = false;
                                        break;
                                    }
                                }
                                if (traverse) {

                                    int rest_total = 0;
                        %>
                        <tr>  <td colspan="8"><b>Restaurant - <%=rest%></b></td></tr>
                        <tr>
                            <th>S.NO</th>
                            <th>Name</th>
                            <th>Photo</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total Price</th>
                        </tr>
                        <%
                            for (int j = 0; j < al.size(); j++) {
                                if (al.get(j).restaurant.equals(rest)) {

                                    rs = stmt.executeQuery("select * from menu  where menu_id='" + al.get(j).menuid + "'");
                                    rs.next();
                        %>

                        <tr>

                            <td> <%=(j + 1)%> </td>
                            <td><%=rs.getString("name")%></td>
                            <td><img src="<%=rs.getString("photo")%>" height="80" width="80" ></td>
                            <td><input onclick="down('<%=al.get(j).menuid%>')" type="button" value="-" style="width: 20px;">
                                <input type="text" required style="width:20px;" id="a_<%=al.get(j).menuid%>" value="<%=al.get(j).qty%>" readonly>
                                <input type="button" onclick="up('<%=al.get(j).menuid%>')" value="+" style="width: 20px;">
                            </td>
                            <td>
                                <%=rs.getString("price")%>
                            </td>
                            <td>
                                <%
                                    int price = Integer.parseInt(rs.getString("price"));
                                    int total = price * al.get(j).qty;
                                    total2 += total;
                                    rest_total += total;
                                %>
                                <%=total%>
                            </td>

                            <td>
                                <a href="#" onclick="add('<%=al.get(j).menuid%>')">Update Cart</a>
                            </td>
                            <td>
                                <a href="#" onclick="rem('<%=j%>')" >Remove Cart</a>
                            </td>

                        </tr>

                        <%

                                }
                            }

                        %>

                        <tr>
                            <td colspan="8">Sub-Total : <%=rest_total%> </td>
                        </tr>
                        <tr>
                            <td colspan="8">Tax : <%= (int) (rest_total * 0.14)%> </td>
                        </tr>
                        <tr>
                            <td colspan="8">Total : <%=(int) (rest_total + (rest_total * 0.14))%> </td>
                        </tr>

                        <%
                            int rt = (int) (rest_total + (rest_total * 0.14));

                            rs = stmt.executeQuery("select * from restaurant where username='" + rest + "'");
                            rs.next();
                            int min = Integer.parseInt(rs.getString("min_order"));
                            int dc = Integer.parseInt(rs.getString("delivery_charges"));
                            int fd = Integer.parseInt(rs.getString("free_delivery_above"));

                            boolean flag = true;
                            int dvc = 0;
                            if (rt < min) {
                                flag = false;
                        %>
                        <tr>
                            <td colspan="8">Minimum order for delivery is - <%=min%></td>
                        </tr>
                        <tr>
                            <td colspan="8"><b>Order for <%=rest%> cannot be processed</b></td>
                        </tr>

                        <%
                            } else {
                                flag = true;
                            

                            
                            if (rt < fd) {
                                dvc = dc;
                        %>

                        <tr>
                            <td colspan="8">Minimum order for free home delivery is - <%=fd%> and delivery charges are - <%=dc%></td>
                        </tr>
                        <%
                            }
                            }
                           //  <%
                            al2.add(new delivery(rest, flag, dvc));
                        %>
                        <%
                            }
                        %>

                        <tr><td colspan="8">&nbsp; <a href=" "> Place Order : </a> </td> </tr>
                         
                        <%
                            }
                        %>

                </table>
               

                <%
                    session.setAttribute("deliver", al2);
                    
    }
                
                %>
            </div>
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
