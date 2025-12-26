<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.dto.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/home.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    </head>
<style>
		a{
            box-shadow: 10px 10px 10px rgba(0, 0, 0, 0.2);
            border: 1px solid;
            border-radius: 10px;
            padding: 5px;
            text-decoration: none;
            color:black;
        }
        a:hover{
            background-color: blue;
            color: white;
            transition: all 0.8s;
        }
</style>
    <body>
        <div class="sidebar">
            <div class="logo-details">
                
                <pre><span class="logo_name">      E-Cart</span></pre>
            </div>
            <ul class="nav-links">
            
            <%
                	String newmail = (String) session.getAttribute("email");
                %>
                
                <li>
                    <a href="Adminprofile?email=<%= newmail %>" class="active">
                        <i class='bx bx-box'></i>
                        <span class="links_name">Profile</span>
                    </a>
                </li>
                <li>
                    <a href="allusers">
                        <i class='bx bx-list-ul'></i>
                        <span class="links_name">All Users</span>
                    </a>
                </li>
                <li>
                    <a href="Allcategory">
                        <i class='bx bx-list-ul'></i>
                        <span class="links_name">All Category</span>
                    </a>
                </li>
                <li>
                    <a href="Allsubcategory.jsp">
                        <i class='bx bx-list-ul'></i>
                        <span class="links_name">All Sub Category</span>
                    </a>
                </li>
                <li>
                    <a href="Product">
                        <i class='bx bx-list-ul'></i>
                        <span class="links_name">All Product</span>
                    </a>
                </li>
                <li>
                    <a href="AllOrders.jsp">
                        <i class='bx bx-list-ul'></i>
                        <span class="links_name">All Orders</span>
                    </a>
                </li>
                <li>
                    <a href="AllFeedback.jsp">
                        <i class='bx bx-heart'></i>
                        <span class="links_name">Feedback</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i class='bx bx-cog'></i>
                        <span class="links_name">Queries</span>
                    </a>
                </li>
                <li class="log_out">
                    <a href="Logout.jsp">
                        <i class='bx bx-log-out'></i>
                        <span class="links_name">Log out</span>
                    </a>
                </li>
            </ul>
        </div>

        <section class="home-section">
            <nav>
                <div class="sidebar-button">
                    <i class='bx bx-menu sidebarBtn'></i>
                    <span class="dashboard">Dashboard</span>
                </div>
                <div class="search-box">
                    <input type="text" placeholder="Search...">
                    <i class='bx bx-search'></i>
                </div>
                
                <%
                	String newmail2 = (String) session.getAttribute("email");
                %>
                
                <div class="profile-details">
                    <img src="https://t4.ftcdn.net/jpg/00/97/00/09/360_F_97000908_wwH2goIihwrMoeV9QF3BW6HtpsVFaNVM.jpg"
                        alt="profile">
                    <span class="admin_name"><%=newmail2 %></span>
                    <i class='bx bx-chevron-down'></i>
                </div>
            </nav>
            <div class="home-content">
        <div class="overview-boxes">
        
        <%
    // Database connection parameters
    String url = "jdbc:mysql://localhost:3306/electronic";
    String username = "root";
    String password = "devansh@64";

    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    int userCount = 0;
    int productCount = 0;
    int adminCount = 0;
    int CategoryCount = 0;
    int SubCategoryCount = 0;
    int OrderCount = 0;
    int FeedbackCount = 0;
    int QueryCount = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection(url, username, password);
        stmt = con.createStatement();

        // Count all users
        rs = stmt.executeQuery("SELECT COUNT(username) AS totalUsers FROM registration WHERE role='user'");
        if (rs.next()) {
            userCount = rs.getInt("totalUsers");
        }

        // Count all products
        rs = stmt.executeQuery("SELECT COUNT(product_id) AS totalProducts FROM product");
        if (rs.next()) {
            productCount = rs.getInt("totalProducts");
        }

        // Count all admins
        rs = stmt.executeQuery("SELECT COUNT(username) AS totalAdmins FROM registration WHERE role='admin'");
        if (rs.next()) {
            adminCount = rs.getInt("totalAdmins");
        }
        rs = stmt.executeQuery("SELECT COUNT(cid) AS totalCategory FROM category");
        if (rs.next()) {
            CategoryCount = rs.getInt("totalCategory");
        }
        rs = stmt.executeQuery("SELECT COUNT(subid) AS totalSubCategory FROM subcategory");
        if (rs.next()) {
            SubCategoryCount = rs.getInt("totalSubCategory");
        }
        rs = stmt.executeQuery("SELECT COUNT(order_id) AS totalOrder FROM orders");
        if (rs.next()) {
            OrderCount = rs.getInt("totalOrder");
        }
        rs = stmt.executeQuery("SELECT COUNT(fid) AS totalFeedback FROM feedback");
        if (rs.next()) {
            FeedbackCount = rs.getInt("totalFeedback");
        }
        rs = stmt.executeQuery("SELECT COUNT(cid) AS totalQuery FROM contact");
        if (rs.next()) {
            QueryCount = rs.getInt("totalQuery");
        }

    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } 
%>
        
        
        
            <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Users</div>
                    <div class="number">
                        <%= userCount %>
                        </div>
                        <div class="indicator">
                            <i class='bx bx-up-arrow-alt'></i>
                            <span class="text">Up to date</span>
                        </div>
                    </div>
                    
                </div>
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Total Product</div>
                        <div class="number">
                        	<%= productCount %>
                        </div>
                        <div class="indicator">
                            <i class='bx bx-up-arrow-alt'></i>
                            <span class="text">Up to date</span>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Total Admins</div>
                        <div class="number">
                        	<%= adminCount %>
                        </div>
                        <div class="indicator">
                            <i class='bx bx-up-arrow-alt'></i>
                            <span class="text">Up to date</span>
                        </div>
                    </div>
                </div>
                <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Category</div>
                    <div class="number">
                        <%= CategoryCount %>
                        </div>
                        <div class="indicator">
                            <i class='bx bx-up-arrow-alt'></i>
                            <span class="text">Up to date</span>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Total Feedback</div>
                        <div class="number">
                        	<%= FeedbackCount %>
                        </div>
                        <div class="indicator">
                            <i class='bx bx-up-arrow-alt'></i>
                            <span class="text">Up to date</span>
                        </div>
                    </div>
                </div>
                <div class="box">
                <div class="right-side">
                    <div class="box-topic">Total Query</div>
                    <div class="number">
                        <%= QueryCount %>
                        </div>
                        <div class="indicator">
                            <i class='bx bx-up-arrow-alt'></i>
                            <span class="text">Up to date</span>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Total SubCategory</div>
                        <div class="number">
                        	<%= SubCategoryCount %>
                        </div>
                        <div class="indicator">
                            <i class='bx bx-up-arrow-alt'></i>
                            <span class="text">Up to date</span>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="right-side">
                        <div class="box-topic">Total Orders</div>
                        <div class="number">
                        	<%= OrderCount %>
                        </div>
                        <div class="indicator">
                            <i class='bx bx-up-arrow-alt'></i>
                            <span class="text">Up to date</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>