<%-- 
    Document   : checkout
    Created on : May 5, 2014, 1:19:03 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>proceed to checkout</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            function go()
            {
                //alert("hello");
                document.getElementById("address").style.display = "block";
            }
            function go2()
            {
                //alert("hello");
                document.getElementById("address").style.display = "none";
            }
        </script>
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
            <div id="main" align="center">
                <span class="headings">CHECKING OUT</span>
                
                <%@page import="java.sql.*" %>
                <%@page import="java.util.*" %>
                <%            
                ArrayList<inception.delivery> al2 = (ArrayList<inception.delivery>) (session.getAttribute("deliver"));
                    boolean flag = false;
                    if (session.getAttribute("deliver") != null) {
                        for (int k = 0; k < al2.size(); k++) {
                            if (al2.get(k).isDelivery) {
                                flag = true;
                                break;
                            }
                        }
                    }
                    if (flag) {

                        if (session.getAttribute("user") == null) {
                            response.sendRedirect("user_login.jsp?msg=to checkout please login");
                        } else {
                %>
                <form action="checkout2.jsp" method="post">
                    <div style="text-align: center;">
                        <h1> WELCOME <%=session.getAttribute("user")%></h1>

                        <h3 align="center">Choose Dining Option -</h3>
                        <table align="center">
                            <tr>
                                <td><input type="radio" value="takeaway" id="takeaway" name="del" onclick="go2()" checked style="align:center">take away<br></td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="radio" value="home" id="home" name="del" onclick="go()" >home delivery<br>

                                    <%
                                        String address;
                                        address = request.getParameter("address");

                                        Class.forName("com.mysql.jdbc.Driver");
                                        System.out.println("Driver loaded successfully");
                                        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                                        System.out.println("connection with database success");
                                        Statement stmt = conn.createStatement();
                                        ResultSet rs = stmt.executeQuery("select * from user where username=\'" + session.getAttribute("user") + "\' ");
                                        System.out.println("result set created");

                                        rs.next();
                                    %>



                            </tr>
                            <tr>
                                <td><textarea name="add" style="display: none;" id="address" required><%=rs.getString("address")%></textarea></td>
                            </tr>

                        </table>                             




                        <!--                <h3>Your total payment is - </h3>-->
                        <h3>Choose Payment Option - </h3>
                        <table align="center">
                            <tr>
                                <td><input type="radio" value="cash" name="pay" id="pay1">Cash on Delivery</td>
                            </tr>
                            <tr>
                                <td><input checked type="radio" value="card" name="pay" id="pay2">Credit Card</td>
                            </tr>
                            <tr>
                                <td colspan="2"><input type="submit" value="Proceed" id="login" /></td>
                            </tr>
                        </table>
                        <%
                            }
                        } else {
                        %>
                        <h2>
                            No order to be processed.
                        </h2>
                        <%
                            }
                        %>


                    </div>
                </form>
            </div>
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>

