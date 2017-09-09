
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
                
               
        <%@page import="java.sql.*" %>
        <div width="1000px" style="border: #000;">
            <table width="100%">
                
        <%
            String city, food;
            city = request.getParameter("city");
           // food = request.getParameter("food");

            //food = food.trim();
            //jdbc code
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded successfully");
            Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
            System.out.println("connection with database success");
            Statement stmt = conn.createStatement();
          //  ResultSet rs = stmt.executeQuery("select restaurant.* from restaurant inner join restaurant_menu_category "
          //          + " on restaurant.username=restaurant_menu_category.username inner join restaurant_menu_subcategory on  "
          //          + " restaurant_menu_category.rmid=restaurant_menu_subcategory.rm_id where city='"+city+"' and restaurant_menu_subcategory.sub_name='"+food+"'");
          //  System.out.println("result set created");
           // if (food.equals("")) {

               ResultSet rs = stmt.executeQuery("select distinct restaurant.* from restaurant inner join restaurant_menu_category "
                        + " where city='"+ city +"'");
           // }
            int i=0;
        %>
        
            <%
                while (rs.next()) {
                    if(i%3==0)
                    {
            %>
            </tr><tr>
            <%
                    }
                    i++;
                    
            %>
            <td>
                <table width="300px">
                    <tr align="center" >
                        <td colspan="2"><img src="<%=rs.getString("logo")%>" height="200" width="200" style="border: solid 2px #781e19;" <td>
                    </tr>
                    <tr align="center">
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
                        <td colspan="2"><a href="home3.jsp?user=<%=rs.getString("username")%>" >View Menu</a></td>
                    </tr>
                </table>
            </td>
            <%
                }
            %>
        
            </table>
        </div>
       </div>
       <%@include file="footer.jsp"%>
     </div>
    </div>
    </body>
</html>
