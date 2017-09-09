
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>menu category of restaurant</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript">
            
            function go(obj)
            {
                var image = document.getElementById("ff").value;
                var name = document.getElementById("cname").value;
                var description= document.getElementById("desc").value;
                var ext = image.substring(image.lastIndexOf("."));
                if(ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext ==".JPG")
                {
                    obj.action = obj.action + "?image=" +image+"&name="+ name+"&desc="+description;
                    return true;
                }
                else
                {
                    alert("Upload Image Files only");
                    return false;
                }
            }
         </script>
    </head>
    <body>
        <div id="all">
            <%@include file="header_rest.jsp"%>
          
            <div id="main" align="center">
                <span class="headings"> Add menu category</span>
                <br>
        <h1> welcome <%=session.getAttribute("rest") %></h1>
        <form action="restaurant_menu_category2.jsp" method="post" enctype="multipart/form-data" onsubmit="return go(this)">
            <table align="center">
                <tr>
                    <td>Category Name</td>
                    <td><input type="text" required name="cname" id="cname" required/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea rows="5" cols="30" name="description" id="desc" required></textarea></td>
                </tr>
                <tr>
                    <td>Photo</td>
                    <td><input type="file" name="file" id="ff"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="add" /></td>
                </tr>
                
            </table>  
        </form>
        </div>
            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
