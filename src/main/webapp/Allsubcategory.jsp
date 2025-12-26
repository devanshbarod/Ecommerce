<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="com.dto.*" %>
<%@page import="com.dbs.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="css/home.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    </head>
<style>
       
        .newbtn a{
            border: 2px solid black;
            background-color: blue;
            color: white;
            text-decoration: none;
            padding: 15px;
            border-radius: 20px;
            font-weight: bold;
            margin-left: 0%;
        }
        table{
            border: 2px solid;
            
        }
        table th{
            border-bottom: 2px solid;
            width: 200px;
            text-align: left;
            padding: 8px;
            background-color:darkblue;
            color: white;
            text-align:center;
        }
        table td{
            padding: 8px;
            text-align: left;
            background-color:lightyellow;
            text-align:center;
        }
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
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap');

        :root {
            --light-grey: #f0f2f5;
            --medium-grey: #dcdde1;
            --dark-blue: #2c3e50;
            --blue: #3498db;
            --blue-hover: #2980b9;
            --red: #e74c3c;
            --red-hover: #c0392b;
            --box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .container {
            width: 100%;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            box-sizing: border-box;
        }

        .header {
            display: grid;
            grid-template-columns: 1fr 1.5fr 1fr 1.5fr 1fr;
            gap: 10px;
            padding: 1rem 0;
            font-weight: 600;
            color: var(--dark-blue);
            border-bottom: 2px solid var(--medium-grey);
            font-size: 0.9rem;
        }

        .data-row {
            display: grid;
            grid-template-columns: 1fr 1.5fr 1fr 1.5fr 1fr;
            gap: 10px;
            align-items: center;
            padding: 1rem 0;
            border-bottom: 1px solid var(--medium-grey);
            font-size: 0.85rem;
            color: #555;
            transition: background-color 0.3s ease;
        }

        .data-row:hover {
            background-color: rgba(0, 0, 0, 0.03);
        }

        .data-row:last-child {
            border-bottom: none;
        }

        .cell, .header > div {
            text-align: left;
            padding-left: 10px;
        }

        .button-group {
            display: flex;
            justify-content: flex-end;
            padding-right: 100px;
        }

        .delete-btn {
            padding: 8px 20px;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            border: none;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: var(--red);
            color: white;
        }

        .delete-btn:hover {
            background-color: var(--blue-hover);
            transform: translateY(-2px);
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
                    <a href="Adminhome.jsp">
                        <i class='bx bx-grid-alt'></i>
                        <span class="links_name">Dashboard</span>
                    </a>
                </li>
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
                    <a href="Allquerys.jsp">
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
		DataBaseConnection db = new DataBaseConnection();
		ArrayList showsubcategory = db.showAllsubcategory();
		session.setAttribute("showsubcategory", showsubcategory);
	%>
	 <div class="container">
        <div class="header">
            <div>Sub_C_ID</div>
            <div>Sub_C_Name</div>
            <div>Category_ID</div>
            <div>Category Name</div>
            <div>Button</div>
        </div>
	
    
            <%
	        	ArrayList al = (ArrayList)session.getAttribute("showsubcategory");
	        	if(al!=null){
        		for(int i=0;i<al.size();i++){
        			Allsubcategoryget st = (Allsubcategoryget)al.get(i);
        		
        	%>
        <div class="data-row">
            <div class="cell"><%= st.getSubid() %></div>
            <div class="cell"><%= st.getSubcategory_name()%></div>
            <div class="cell"><%= st.getCid() %></div>
            <div class="cell"><%= st.getCategoryname()%></div>
            <div class="button-group">
            <a class="delete-btn" href="Subcategorydelete?subid=<%=st.getSubid()%>">Delete</a>
            </div>
        </div>
            
             <%
        		}
        	}
        %>
        </div>
        </div>
    </div>
</body>
</html>