<%-- 
    Document   : paypal
    Created on : May 6, 2014, 2:23:23 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
            
            <div id="main">

                
                
                
                <%@page import="inception.cart" %>
                <%@page import="java.util.ArrayList"%>
                <%@page import="java.sql.*" %>
                <form action="https://www.paypal.com/cgi-bin/webscr" method="post" style="width: 980px;">

                
                      <%
                    String dinein = session.getAttribute("dinein").toString();
                %>
                    
                    <h1 align="center"> Checking out through PayPal  </h1>
                    <table border="1" align="center" style=" ">
                        <thead>
                            <tr>
                                <th>S.NO</th>
                                <th>Name</th>
                                <th>Photo</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>total price</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                ArrayList<inception.cart> al;
                                int total2 = 0;
                                ArrayList<inception.delivery> al2 = null;

                                if (session.getAttribute("cart") == null) {
                                    al = new ArrayList<cart>();
                                } else {
                                    al = (ArrayList<inception.cart>) (session.getAttribute("cart"));

                                    al2 = (ArrayList<inception.delivery>) (session.getAttribute("deliver"));

                                    for (int i = 0; i < al.size(); i++) {

                                        boolean flag = true;
                                        for (int k = 0; k < al2.size(); k++) {
                                            if (al2.get(k).restaurant.equals(al.get(i).restaurant)) {
                                                if (al2.get(k).isDelivery == false) {
                                                    flag = false;
                                                    break;
                                                }
                                            }
                                        }

                                        if (flag) {

                                            Class.forName("com.mysql.jdbc.Driver");
                                            System.out.println("Driver loaded successfully");
                                            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                                            System.out.println("connection with database success");
                                            Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                            ResultSet rs = stmt.executeQuery("select * from menu where menu_id='" + al.get(i).menuid + "'  ");

                                            System.out.println("result set created");
                                            rs.next();

                            %>       
                            <tr>
                                <td> <%=(i + 1)%> </td>
                                <td><%=rs.getString("name")%></td>
                                <td><img src="<%=rs.getString("photo")%>" height="80" width="80" ></td>
                                <td><%=al.get(i).qty%>
                                </td>
                                <td>
                                    <%=rs.getString("price")%>
                                </td>
                                <td>
                                    <%
                                        int price = Integer.parseInt(rs.getString("price"));
                                        al.get(i).price = price;
                                        int total = price * al.get(i).qty;
                                        total2 += total;
                                        int d = price / 60;
                                        String val2 = d + "";
                                        //val2 = val2.substring(0 , val2.indexOf(".") + 2);
                                    %>
                                    <%=total%>
                                </td>




                            </tr>

                        <input type="hidden" name="item_name_<%=(i + 1)%>" value="<%=rs.getString("name")%>" />
                        <input type="hidden" name="amount_<%=(i + 1)%>" value="<%=val2%>" />
                        <input type="hidden" name="quantity_<%=(i + 1)%>" value="<%=al.get(i).qty%>">




                        <%
                                    }
                                }
                            }
                        %>
                        <tr>
                            <td colspan="10" align="center">Total price= <%=total2%></td>
                        </tr>
                        <tr>
                            <td colspan="10" align="center">Tax (14%)=
                                <%
                                    int cal = (int) (total2 * (0.14));

                                    String val3 = cal + "";
                           //val3 = val3.substring(0, val3.indexOf(".") + 3);

                                %>
                                <%= val3%> </td>
                        </tr>
<!--                        copy-->
                        <tr>
                        <td colspan="10" align="center">
                            <%
                                int dvc = 0;
                                if (dinein.equals("home")) {

                                    for (int q = 0; q < al2.size(); q++) {
                                        dvc += al2.get(q).charges;
                                    }

                                }
                            %>
                            Delivery Charges: - <%=dvc%>
                        </td>
                    </tr>
                    <!--coppy-->
                        <tr>
                            <td colspan="10" align="center">Subtotal=
                                <%
                                    double cal2 = total2 + cal + dvc;

                                    session.setAttribute("total", cal2);

                                %>
                                <%=cal2%></td>
                        </tr>
                    </table>

                    <input type="hidden" name="notify_url" value="http://localhost:8084/tastybites/payment_success.jsp" />
                    <input type="hidden" name="cancel_return" value="http://localhost:8084/tastybites/payment_failure.jsp" />
                    <input type="hidden" name="return" value="http://localhost:8084/tastybites/payment_success.jsp" />




                    <input type="hidden" name="cmd" value="_cart" />
                    <input type="hidden" name="upload" value="1" />
                    <input type="hidden" name="business" value="inceptioneducation@gmail.com" />

                    <table align="center">
                        <tr>
                            <td><input id="Submit1" type="submit" value="Checkout using Paypal"/></td>
                    </tr>
                    </table>
                </form>
            </div>
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
