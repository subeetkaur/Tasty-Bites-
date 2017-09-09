
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>home page</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
            
                <%@page import="java.sql.*" %>
                <form action="home2.jsp" method="post">
                    <a href="home.jsp"></a>
                    <table align="center" style="margin:0px;">
                        <tr>
                            <td>Enter City</td>
                        <br>
                        <td><select name="city" id="city">
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
                            <%-- <td>Enter food</td>
                        <br>
                        <td><input type="text" required id="search" name="food"/></td>--%>

                        <td colspan="2"><input type="submit" id="submit" value="Find Restaurants" /></td>
                        </tr>

                    </table> 
                </form>

                <br>
                <br>
                <br>

                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driver loaded successfully");
                    Connection conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                    System.out.println("connection with database success");
                    Statement stmt2 = conn2.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs2 = stmt2.executeQuery("select * from food_category order by rand() limit 6 ");
                    System.out.println("result set created");
                %>

                <div style=" width: 900px; background-color: #781e19; border-radius: 15px; color: #fe8908; ">


                    <table >
                        <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Cuisines - </span></td>
                        <tr>
                            <%
                                while (rs2.next()) {
                            %>


                            <td style="text-align: center; width: 150px;">
                                <img style="border: solid 2px #fe8908; border-radius: 5px;" src="<%=rs2.getString("logo")%>" height="100" width="140"/>
                                <br>


                                <a style="color: #fe8908;" href="main_home.jsp?q=<%=rs2.getString("fc_name")%>"><%=rs2.getString("fc_name")%></a>
                            </td>


                            <%
                                }
                            %>
                        </tr>
                    </table>
                </div>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driver loaded successfully");
                    Connection conn3 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                    System.out.println("connection with database success");
                    Statement stmt3 = conn3.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs3 = stmt3.executeQuery("select * from restaurant order by rand() limit 5");
                    System.out.println("result set created");
                %>

                <br>
                <br>
                <div style=" width: 900px; background-color: #781e19; border-radius: 15px; color: #fe8908;">


                    <table style="width: 900px;">
                        <tr>
                            <td><span style="font-family: cursive; font-size: 16px; font-weight: bold;">Top Restaurants - </span></td>
                        </tr>
                        <tr>
                            <%
                                while (rs3.next()) {
                            %>


                            <td style="text-align: center; width: 180px;">
                                <img style="border: solid 2px #fe8908; border-radius: 5px;" src="<%=rs3.getString("logo")%>" height="100" width="170"/>
                                <br>


                                <a style="color: #fe8908;" href="home3.jsp?user=<%=rs3.getString("username")%>"><%=rs3.getString("username")%></a>
                            </td>


                            <%
                                }
                            %>
                        </tr>
                    </table>
                </div>

          v>
            <%@include file="footer.jsp"%>

        </div>

    </body>
</html>
