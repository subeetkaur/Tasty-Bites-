<%-- 
    Document   : add_restaurant
    Created on : Apr 10, 2014, 12:45:51 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>restaurant</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            function go()
            {
                var email = document.getElementById("email").value;
                var contact_no = document.getElementById("contactno").value;
                var delivery_in = document.getElementById("delivery_in").value;
                var min_order = document.getElementById("min_order").value;
                var delivery_charges = document.getElementById("delivery_charges").value;
                var free_delivery_above = document.getElementById("free_delivery_above").value;
                var email = document.getElementById("email").value;
                
           //     alert(contact_no + "  "+min_order + " " + delivery_charges + " " + delivery_in + "  "+ free_delivery_above);
                
                
                
                if (document.getElementById("password").value !== document.getElementById("conf_password").value)
                {
                    alert("new password and confirm password do not match");
                    return false;
                }
                else if (email.indexOf("@") === -1 || email.lastIndexOf(".") === -1 || email.indexOf("@") >= email.lastIndexOf("."))
                {
                    alert("Email incorrect");
                    return false;
                }
                
                
                if(isNaN(contact_no)) 
                {

                    alert("invalid phone number");
                    return false;
                }
                if(isNaN(delivery_in))
                {
                    alert("invalid delivery in");
                    return false;
                }
                if(isNaN(min_order))
                {
                    alert("invalid min order");
                    return false;
                }
                if(isNaN(delivery_charges))
                {
                    alert("invalid delivery charges");
                    return false;
                }
                if(isNaN(free_delivery_above))
                {
                    alert("invalid free delivery above");
                    return false;
                }
                else
                {
                    return true;
                }
            }

        </script>
    </head>

    <body>
        <div id="all">
            <%@include file="header.jsp"%>
          
            <div id="main" align="center">
                <span class="headings">Add Your Info</span>
                <br>
                <br>
        <%@page import="java.sql.*" %>
        <form action="add_restaurant2.jsp" method="post" onsubmit="return go()">
            <table align="center">
                <tr>
                    <td>Username</td>
                    <td><input type="text" required name="username" id="username" required/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td><input type="password" required name="password" id="password" required/></td>
                </tr>
                <tr>
                    <td>Confirm Password</td>
                    <td><input type="password" required name="conf_password" id="conf_password" required/></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" required name="name" id="name" required/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea name="description" id="description" required></textarea></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" required name="email" id="email" required/></td>
                </tr>
                <tr>
                    <td>Contactno</td>
                    <td><input type="text" required name="contactno" id="contactno" required/></td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td><textarea name="address" id="address" required/></textarea></td>
                </tr>
                <tr>
                    <td>City</td>
                    <td><select name="city">
                            <%
                                Class.forName("com.mysql.jdbc.Driver");
                                System.out.println("Driver loaded successfully");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                                System.out.println("connection with database success");
                                Statement stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                                ResultSet rs = stmt.executeQuery("select * from city");
                                System.out.println("result set created");

                                while (rs.next()) {
                            %>  
                            <option value="<%=rs.getString("city")%>"><%=rs.getString("city")%></option>
                            <%
                                }
                            %>      

                        </select></td>
                </tr>
                <tr>
                    <td>Security Question</td>
                    <td><select name="security_ques">
                            <option value="where were you born?">where were you born?</option>
                            <option value="your fav place?">your fav place?</option>
                            <option value="your fav dish?">your fav dish?</option>
                            <option value="your best friend?">your best friend?</option>
                        </select></td>

                </tr>
                <tr>
                    <td>Security Answer</td>
                    <td><input type="text" required name="security_ans" id="security_ans" required/></td>
                </tr>
                <tr>
                    <td>Latitude</td>
                    <td><input type="text" required name="latitude" id="latitude" required/></td>
                </tr>

                <tr>
                    <td>Longitude</td>
                    <td><input type="text" required name="longitude" id="longitude" required/></td>
                </tr>

                <tr>
                    <td>Delivery In</td>
                    <td><input type="text" required name="delivery_in" id="delivery_in" required/></td>
                </tr>

                <tr>
                    <td>Minimum order</td>
                    <td><input type="text" required name="min_order" id="min_order" required/></td>
                </tr>

                <tr>
                    <td>Delivery charges</td>
                    <td><input type="text" required name="delivery_charges" id="delivery_charges" required/></td>
                </tr>

                <tr>
                    <td>Free delivery above</td>
                    <td><input type="text" required name="free_delivery_above" id="free_delivery_above" required/></td>
                </tr>


                <tr>
                    <td align="center" colspan="2"><input type="submit" value="add" id="add" /></td>
                </tr>
            </table>
        </form>
                            </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
