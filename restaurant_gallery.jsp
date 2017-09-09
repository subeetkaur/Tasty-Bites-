

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Restaurant gallery</title>
        <link href="css1.css" type="text/css" rel="stylesheet">
        <script type="text/javascript">
            function go(obj)
            {
                var name = document.getElementById("ff").value;
                var ext = name.substring(name.lastIndexOf("."));
                if (ext == ".jpg" || ext == ".jpeg" || ext == ".png" || ext == ".JPG")
                {
                    var cap = document.getElementById("caption").value;
                    obj.action = obj.action + "?fn=" + name + "&cap=" + cap;
                    return true;
                }
                else
                {
                    alert("Upload Image Files only");
                    return false;
                }
            }
             var xmlhttp;
            
            function go1()
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
                xmlhttp.onreadystatechange=go2;
                xmlhttp.open("GET","./restaurant_gallery",true);
                xmlhttp.send();
            }
            function go2()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    document.getElementById("pic").innerHTML=xmlhttp.responseText;
                }
            }
            function delete23(ob)
            {
//                alert(ob);
                try
                {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP") // For Old Microsoft Browsers
                }
                catch(e)
                {
                    try
                    {
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP") //For Microsoft IE 6.0+
                    }
                    catch(e2)
                    {
                        xmlhttp = new XMLHttpRequest(); //For Mozilla, Opera Browsers
                    }
                }
                
                var flag = confirm("Are you sure you want to delete?");
                if(flag)
                {
                 xmlhttp.onreadystatechange=delete24;
                 xmlhttp.open("GET","./restaurant_gallery_delete?id="+ob,true);
                 xmlhttp.send();
                }
            }
            function delete24()
            {
//                alert(xmlhttp.responseText);
                 if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    go1();
                    //document.getElementById("pic").innerHTML=xmlhttp.responseText;
                }
            }
        </script>
    </head>
    
    <body onload="go1()">
        <div id="all">
            <%@include file="header_rest.jsp"%>
            
            <div id="main" align="center">
                <span class="headings">Restaurant Gallery</span>
                <br>
        
        <div id="pic">
            
        </div>
        
        <form action="restaurant_gallery2.jsp" method="post" enctype="multipart/form-data" onsubmit="return go(this);">
            <table>
                <tr>
                    <td>caption</td>
                    <td><input type="text" required name="caption" id="caption"/></td>
                </tr>
                <tr>
                    <td>select file</td>
                    <td><input type="file" name="file" id="ff"/></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="upload file"></td>
                </tr>
            </table>
        </form>
</div>
                            <%@include file="footer.jsp"%>
        </div>
    </body>
</html>
