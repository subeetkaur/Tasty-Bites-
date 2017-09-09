<%-- 
    Document   : comment
    Created on : May 8, 2014, 12:02:10 PM
    Author     : LENOVO B560
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>comments</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript">
            var n = 0;
            function fill(obj)
            {
                var img = obj.src;
                var id = obj.id;
                var val = parseInt(id.substring(id.indexOf("_") + 1));
                var i;
                if (n == 0)
                {
                    i = 1;
                }
                else
                {
                    i = n + 1;
                }
                for (; i <= 5; i++)
                {
                    if (i <= val)
                    {
                        document.getElementById("rating_" + i).src = "rating/filled_star.png";

                    }
                    else
                    {
                        document.getElementById("rating_" + i).src = "rating/empty_star.png";
                    }
                }

            }
            function selected(obj)
            {
                var id = obj.id;
                var val = parseInt(id.substring(id.indexOf("_") + 1));
                n = val;
                document.getElementById("rate").value = n;
            }
            function unfill(obj)
            {
                var i;
                if (n == 0)
                {
                    i = 1;
                }
                else
                {
                    i = n + 1;
                }
                for (; i <= 5; i++)
                {
                    document.getElementById("rating_" + i).src = "rating/empty_star.png";
                }
            }
        </script>

    </head>
    <body>
        <div id="all">
            <%@include file="header.jsp"%>
            
            <div id="main">
                <h1><b> Welcome <%=session.getAttribute("user")%></b></h1>
                <%
                    String user;
                    user = request.getParameter("user");
                      
                    //jdbc code
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driver loaded successfully");
                    Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                    System.out.println("connection with database success");
                    Statement stmt1 = conn1.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
                    ResultSet rs1 = stmt1.executeQuery("select * from restaurant where username='" + user + "'");
                    System.out.println("result set created");

                    if (rs1.next()) {
                %>



                <table style="margin-top: 50px">
                    <tr align="center" >
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
                            </table></td>

                    </tr>   

                </table>

                <%
                    }
                %>
                <h1> Post a Comment--</h1>

                <form action="comment2.jsp?rest=<%=user%>" method="post">
                    <table border="1">
                        <tr>
                            <td>Comment</td>
                            <td><textarea placeholder="comment here" name="comment" id="comment"></textarea></td>
                        </tr>
                        <tr>
                            <td>Rating</td>
                            <td>
                                <input type="hidden" name="rate" id="rate" />

                                <table>
                                    <tr>
                                        <td>
                                            <img width="15" height="15" id="rating_1" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                        </td>
                                        <td>
                                            <img width="15" height="15" id="rating_2" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                        </td>
                                        <td>
                                            <img width="15" height="15" id="rating_3" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                        </td>
                                        <td>
                                            <img width="15" height="15" id="rating_4" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                        </td>
                                        <td>
                                            <img width="15" height="15" id="rating_5" src="rating/empty_star.png" onmouseover="fill(this)" onmouseout="unfill(this)" onclick="selected(this)">
                                        </td>
                                    </tr>
                                </table>
                            </td>

                        </tr>

                        <tr>
                            <%
                                if (session.getAttribute("user") == null) {
                                    // response.sendRedirect("user_login.jsp?msg=to post comment please login");

                            %>
                            <td colspan="2" align="center">To comment please <a href="user_login.jsp">Login</a></td>
                            <%                         } else {

                            %>
                            <td colspan="2"><input type="submit" value="COMMENT"/></td>
                                <%                                }
                                %>
                        </tr>

                    </table>  
                </form>
                <h3> Comments--</h3>
                <%@page import="java.sql.*" %>
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    System.out.println("Driver loaded successfully");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                    System.out.println("connection with database success");
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("select * from comments where restaurant='" + user + "' ");
                    System.out.println("result set created");
                %>
                <table width="600">
                <%       
                    while (rs.next())
                    {
                %>
                    <tr>
                        <td align="left"><span style="font-family: cursive; font-size: 20px"><%=rs.getString("user")%></span></td>
                        <td style="text-align: right;"><%=rs.getString("date")%></td>

                    </tr>    
                    <tr>
                        <td colspan="2" ><%=rs.getString("comment")%></td>
                    </tr>
                    <tr>
                        <td colspan="2" >
                            <table>
                                <tr>
                                    <%

                                        int n = Integer.parseInt(rs.getString("rating"));
                                        for (int i = 0; i < n; i++) {
                                    %>

                                    <td>
                                        <img width="15" height="15" id="rating_1" src="rating/filled_star.png" >
                                    </td>

                                    <%
                                        }
                                        for (int i = 0; i < 5 - n; i++) {
                                    %>

                                    <td>
                                        <img width="15" height="15" id="rating_1" src="rating/empty_star.png" >
                                    </td>


                                    <%
                                        }
                                    %>
                                </tr>
                            </table>

                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <%
                        }
                    %>
                </table>

            </div>
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
