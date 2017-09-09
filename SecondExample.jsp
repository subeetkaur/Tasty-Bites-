

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
            var xmlhttp;
            var rollno;
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
                
                rollno = document.getElementById("rollno").value;
                
                xmlhttp.onreadystatechange=go2;
                xmlhttp.open("GET","./SecondServlet?rollno="+rollno,true);
                xmlhttp.send();
            }
            function go2()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    document.getElementById("studentinfo").innerHTML=xmlhttp.responseText;
                }
            }
        </script>
    </head>
    <body>
        <center>
            <label style="color: blue">Enter roll no :</label>
            <input type="text" required id ="rollno" />
            <input type="button" value="Get Student Info" onclick="go1()" /><br><br>
            <div id="studentinfo">User Info will display here</div>
        </center>
    </body>
</html>
