

<%@page contentType="text/html" pageEncoding="UTF-8"%>^
<!DOCTYPE html>
<html>
    <head>

        <title>add menu</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script>
            function go(obj)
            {
                var image = document.getElementById("ff").value;
                var item = document.getElementById("item").value;
                var desc = document.getElementById("desc").value;
                var price = document.getElementById("price").value;
               
                var category = document.getElementById("category").value;
                var subcat = document.getElementById("subcat").value;
                var ext = image.substring(image.lastIndexOf("."));
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".PNG" || ext == ".JPG" || ext == ".JPEG")
                {
                    obj.action = obj.action + "?image=" + ext + "&item=" + item + "&desc=" + desc +"&price=" + price  +"&cat=" + category+"&subcat=" + subcat;
                    return true;
                }
                else
                {
                    alert("upload image files only");
                    return false;
                }
            }

            function go1()
            {
                var price = document.getElementById("price").value;
                if (isNaN(phone_no))
                {
                    alert("invalid phone number");
                    return false;
                }
                else
                {
                    return true;
                }
            }
            
            
            //33333333333333333333333333333333333333333333333333333333333333333333333333333333333
            
            
             var xmlhttp;
            function go2()
            {
                 var id = document.getElementById("category").value;

              
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



                xmlhttp.onreadystatechange = go3;
                xmlhttp.open("GET", "./menu?id=" + id, true);
                xmlhttp.send();
            }
            function go3()
            {
               
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200)
                {
                    
                    document.getElementById("subcat").innerHTML = xmlhttp.responseText;
                }
            }
            
            
        </script>
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
           
            <div id="main">
        <%@page import="java.sql.*" %>
        <%
            String msg=request.getParameter("msg");
            if(msg!=null)
            {
        %>
        <span style="color: blue"><h1><%=msg%></h1></span>
        <%
          }
%>  
        <form action="add_menu2.jsp" method="post" enctype="multipart/form-data" onsubmit="return go(this)" >
            <h1 align="center"> add menu  </h1>
            <table align="center">
                
                <tr>
                    <td>name</td>
                    <td><input type="text" required name="item" id="item" required=""></td>
                </tr>
                <tr>
                    <td>description</td>
                    <td><textarea name="desc" id="desc" required=""></textarea></td>
                </tr>

                <tr>
                    <td>select image</td>
                    <td><input type="file" name="file" id="ff" ></td>
                </tr>
                <tr>
                    <td>price</td>
                    <td><input type="text" required name="price" id="price" required=""/></td>
                </tr>    

                <tr>
                    <td>category (to which food belongs)</td>
                    <td><select name="category" id="category" onchange="go2();">
                            <option value="select">select</option>
                            <%

                                Class.forName("com.mysql.jdbc.Driver");
                                System.out.println("Driver loaded successfully");
                                Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/tastybites", "root", "system");
                                System.out.println("connection with daabase success");
                                Statement stmt = conn.createStatement();
                                ResultSet rs = stmt.executeQuery("select * from restaurant_menu_category where username=\'" + session.getAttribute("rest") + "\' ");
                                System.out.println("result set created");
                                System.out.println(session.getAttribute("rest"));
                                while (rs.next()) {
                            %>  
                            <option value="<%=rs.getInt("rmid")%>"><%=rs.getString("name")%></option>
                            <%
                                }
                            %>      

                        </select></td>
                </tr>
                <tr>
                    <td>select sub category</td>
                    <td><select name="subcat" id="subcat" >
                            <option value="select">select</option>
                        </select> 
                </tr>
                <tr>
                    
                    <td align="center" colspan="2"><input type="submit" value="add" name="submit"></td>
                </tr>
            </table>
           </div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
