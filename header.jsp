
<%@page import="java.util.ArrayList"%>
<link rel="stylesheet" type="text/css" href="engine1/style.css" />
<link rel="stylesheet" type="text/css" href="styles.css" />
<script type="text/javascript" src="engine1/jquery.js"></script>
<div id="header">


    <table id="Table_01" width="1000" height="350" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <img src="images/header_01.jpg" width="264" height="70" alt=""></td>
            <td style="background-image: url('images/header_02.jpg') ; width: 736px; height: 70px;">
                <div id='cssmenu'>
                    <ul>
                       
                        <li><a href='home.jsp'><span>Home</span></a></li>
                        <%
                        if(session.getAttribute("user")!=null)
                        {
                         %><li><a href="change_user_password1.jsp"><span>Change Password</span></a></li>
                        <li><a href="logout.jsp"><span>Logout</span></a></li>
                        <%
                        }
                        else
                        {
                            
                        %>
                        <li><a href="adminlogin1.jsp"><span>Admin Login</span></a></li>
                        
                        
                        <li class='has-sub'><a href='#'><span>Restaurant</span></a>

                            <ul>
                                <li><a href='add_restaurant.jsp'><span>Restaurant Signup</span></a></li>
                                <li><a href="restaurantlogin1.jsp"><span>Restaurant Login</span></a></li>
                            </ul>
                        </li>
                        <li class='has-sub'><a href='#'><span>User</span></a>

                            <ul>
                                <li><a href="user_signup.jsp"><span>User Signup</span></a></li>
                                <li class='last'><a href="user_login.jsp"><span>User Login</span></a></li>
                            </ul>
                        </li>
                        
                        <%
                        }
                            int count = 0;
                            ArrayList<inception.cart> al_session = (ArrayList<inception.cart>) (session.getAttribute("cart"));
                            if(session.getAttribute("cart")!=null)
                            {
                                count = al_session.size();
                            }
                            
                        %>
                        <li><a href="view_cart.jsp"><span>My Cart(<%=count%>)</span></a></li>
                        <%
                        if(count>0)
                        {   
                            %><li><a href="checkout.jsp"><span>Check Out</span></a></li>
                        <%
                        }
                        %>
                    </ul>
                </div>

            </td>
        </tr>
        <tr>
            <td width="1000" height="280" colspan="2">

                <div id="wowslider-container1">
                    <div class="ws_images"><ul>
                            <li><img src="data1/images/399004.jpg" alt="399004" title="399004" id="wows1_0"/></li>
                            <li><img src="data1/images/405361.jpg" alt="405361" title="405361" id="wows1_1"/></li>
                            <li><img src="data1/images/409884.jpg" alt="409884" title="409884" id="wows1_2"/></li>
                            <li><img src="data1/images/427128_2.jpg" alt="427128 (2)" title="427128 (2)" id="wows1_3"/></li>
                            <li><img src="data1/images/429127.jpg" alt="429127" title="429127" id="wows1_4"/></li>
                            <li><img src="data1/images/chocolatemuffinsfood.jpg" alt="chocolate-muffins-food" title="chocolate-muffins-food" id="wows1_5"/></li>
                            <li><img src="data1/images/collages.jpg" alt="Collages" title="Collages" id="wows1_6"/></li>

                            <li><img src="data1/images/deliciousegyptianfoodhdwallpapers.jpg" alt="Delicious-Egyptian-Food-HD-Wallpapers" title="Delicious-Egyptian-Food-HD-Wallpapers" id="wows1_7"/></li>
                            <li><img src="data1/images/drinks20v.jpg" alt="drinks-20v" title="drinks-20v" id="wows1_8"/></li>
                            <li><img src="data1/images/excellentsummerdrinks.jpg" alt="excellent-summer-drinks" title="excellent-summer-drinks" id="wows1_9"/></li>
                            <li><img src="data1/images/foodwallpaper61080p.jpg" alt="food-wallpaper-6-1080p" title="food-wallpaper-6-1080p" id="wows1_10"/></li>
                            <li><img src="data1/images/foodwallpaper9freehd.jpg" alt="food-wallpaper-9-free-hd" title="food-wallpaper-9-free-hd" id="wows1_11"/></li>
                            <li><img src="data1/images/foodwallpaper14hdbackground.jpg" alt="food-wallpaper-14-hd-background" title="food-wallpaper-14-hd-background" id="wows1_12"/></li>
                            <li><img src="data1/images/foodwallpaper22widewallpaper.jpg" alt="food-wallpaper-22-wide-wallpaper" title="food-wallpaper-22-wide-wallpaper" id="wows1_13"/></li>
                            <li><img src="data1/images/ochinesenewyearrecipesfacebook.jpg" alt="o-CHINESE-NEW-YEAR-RECIPES-facebook" title="o-CHINESE-NEW-YEAR-RECIPES-facebook" id="wows1_14"/></li>
                            <li><img src="data1/images/starters.jpg" alt="Starters" title="Starters" id="wows1_15"/></li>
                        </ul></div>
                    <div class="ws_bullets"><div>
                            <a href="#" title="399004"><img src="data1/tooltips/399004.jpg" alt="399004"/>1</a>
                            <a href="#" title="405361"><img src="data1/tooltips/405361.jpg" alt="405361"/>2</a>
                            <a href="#" title="409884"><img src="data1/tooltips/409884.jpg" alt="409884"/>3</a>

                            <a href="#" title="427128 (2)"><img src="data1/tooltips/427128_2.jpg" alt="427128 (2)"/>4</a>
                            <a href="#" title="429127"><img src="data1/tooltips/429127.jpg" alt="429127"/>5</a>
                            <a href="#" title="chocolate-muffins-food"><img src="data1/tooltips/chocolatemuffinsfood.jpg" alt="chocolate-muffins-food"/>6</a>
                            <a href="#" title="Collages"><img src="data1/tooltips/collages.jpg" alt="Collages"/>7</a>
                            <a href="#" title="Delicious-Egyptian-Food-HD-Wallpapers"><img src="data1/tooltips/deliciousegyptianfoodhdwallpapers.jpg" alt="Delicious-Egyptian-Food-HD-Wallpapers"/>8</a>
                            <a href="#" title="drinks-20v"><img src="data1/tooltips/drinks20v.jpg" alt="drinks-20v"/>9</a>
                            <a href="#" title="excellent-summer-drinks"><img src="data1/tooltips/excellentsummerdrinks.jpg" alt="excellent-summer-drinks"/>10</a>
                            <a href="#" title="food-wallpaper-6-1080p"><img src="data1/tooltips/foodwallpaper61080p.jpg" alt="food-wallpaper-6-1080p"/>11</a>
                            <a href="#" title="food-wallpaper-9-free-hd"><img src="data1/tooltips/foodwallpaper9freehd.jpg" alt="food-wallpaper-9-free-hd"/>12</a>

                            <a href="#" title="food-wallpaper-14-hd-background"><img src="data1/tooltips/foodwallpaper14hdbackground.jpg" alt="food-wallpaper-14-hd-background"/>13</a>
                            <a href="#" title="food-wallpaper-22-wide-wallpaper"><img src="data1/tooltips/foodwallpaper22widewallpaper.jpg" alt="food-wallpaper-22-wide-wallpaper"/>14</a>
                            <a href="#" title="o-CHINESE-NEW-YEAR-RECIPES-facebook"><img src="data1/tooltips/ochinesenewyearrecipesfacebook.jpg" alt="o-CHINESE-NEW-YEAR-RECIPES-facebook"/>15</a>
                            <a href="#" title="Starters"><img src="data1/tooltips/starters.jpg" alt="Starters"/>16</a>
                        </div></div>
                    <span class="wsl"><a href="http://wowslider.com">jquery slider</a> by WOWSlider.com v5.4</span>
                    <div class="ws_shadow"></div>
                </div>

                <script type="text/javascript" src="engine1/wowslider.js"></script>
                <script type="text/javascript" src="engine1/script.js"></script>
            </td>
        </tr>
    </table>



</div>
