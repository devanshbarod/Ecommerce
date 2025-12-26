<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: #f5f7ff;
}

.container {
    padding: 15px;
}

/* Header */
.header{
 display: none;
 margin-bottom:5%;
}
.header h2 {
    margin: 0;
    font-size: 22px;
}
.header p {
    margin-top: 5px;
}
.blue {
    color: #0c5aff;
    font-weight: bold;
}

/* Top buttons */
.grid-menu {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    text-align: center;
    gap: 10px;
    margin: 10% 0;
}

.menu-box {
    background: white;
    padding: 15px 5px;
    border-radius: 12px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}

.menu-box img {
    width: 35px;
    height: 35px;
}
.menu-box p {
    margin: 8px 0 0;
    font-size: 14px;
    font-weight: 600;
}

/* Section Titles */
.section {
    margin-top: 20px;
}
.section h3 {
    font-size: 16px;
    color: #676767;
    margin-bottom: 8px;
}

/* List Items */
.item {
    background: white;
    padding: 14px;
    border-radius: 10px;
    margin-bottom: 8px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    position: relative;
}

.item small {
    display: block;
    font-size: 12px;
    color: #888;
    margin-top: 3px;
}

.item.arrow::after {
    content: ">";
    position: absolute;
    right: 15px;
    font-size: 18px;
    color: #888;
}

/* Bottom Navigation */
.bottom-nav {
    position: fixed;
    bottom: 0;
    width: 100%;
    display: flex;
    background: white;
    border-top: 1px solid #ddd;
}

.nav-box {
    flex: 1;
    text-align: center;
    padding: 10px;
    font-size: 13px;
    color: #666;
}

.nav-box.active {
    color: #0c5aff;
    font-weight: bold;
}

</style>
<body>
<%@include file="header.jsp" %>
	<div class="container">

    <div class="header">
        <h2></h2>
        <p><span class="blue"></span> </p>
    </div>

    <!-- Top Buttons -->
    <div class="grid-menu">
        <div class="menu-box">
            <a href="ShowOrder.jsp" class="btn btn-outline"><img src="https://cdn-icons-png.flaticon.com/512/3064/3064197.png">
            <p>Orders</p></a>
        </div>

        <div class="menu-box">
            <a href="ShowCart.jsp"><img src="https://cdn-icons-png.flaticon.com/512/1170/1170678.png" width="35">
            <p>Add to Cart</p></a>
        </div>

        <div class="menu-box">
            <a href="UserProfile?email=<%= newmail %>" class="btn"><i class="fa fa-user" style="font-size:32px; color:#000;"></i>
            <p>Profile</p></a>
        </div>

        <div class="menu-box">
            <a href="Help&Faq.jsp"><img src="https://cdn-icons-png.flaticon.com/512/1828/1828919.png">
            <p>Help Center</p></a>
        </div>
    </div>

    <!-- Credit Options -->
    <div class="section">
        <h3></h3>
        <div class="item">
            <span></span>
            <small></small>
        </div>
    </div>

    <!-- Account Settings -->
    <div class="section">
        <h3>Account Settings</h3>

        <div class="item arrow">
            <span><a href="ChangePasswordUser.jsp">Change Password</a></span>
        </div>

        <div class="item arrow">
            <span><a href="UserProfile?email=<%= newmail %>" class="btn">Edit Profile</a></span>
        </div>

        <div class="item arrow">
            <span>Saved Cards & Wallet</span>
        </div>

        <div class="item arrow">
            <span>Saved Addresses</span>
        </div>

        <div class="item arrow">
            <span>Select Language</span>
        </div>

        <div class="item arrow">
            <span>Notification Settings</span>
        </div>
    </div>

    <!-- My Activity -->
    <div class="section">
        <h3>My Activity</h3>

        <div class="item arrow">
            <span><a href="FeedbackForm.jsp">Reviews</a></span>
        </div>

        
    </div>

</div>


<%@include file="Footer.jsp" %>
</body>
</html>