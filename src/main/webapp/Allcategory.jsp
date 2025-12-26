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
            margin-left: 2%;
            
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

    .card {
      background: #fff;
      box-shadow: 0 4px 12px rgba(0,0,0,0.15);
      border-radius: 8px;
      padding: 20px;
      display: flex;
      align-items: center;
      gap: 20px;
      max-width: 1000px;
      margin: auto;
    }

    .avatar {
      width: 60px;
      height: 60px;
      border-radius: 50%;
      border: 2px solid black;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 30px;
      font-weight: bold;
      background-color: white;
    }

    .name {
      font-weight: bold;
      font-size: 18px;
    }

    .info {
      color: gray;
      margin-left: 150px;
       margin-right: 50px;
    }

    .user-content {
      display: flex;
      flex-direction: column;
    }

    .user-row {
      display: flex;
      align-items: center;
      gap: 30px;
      flex-wrap: wrap;
      flex: 1;
    }

    .btn-link {
      border: 1px solid #007bff;
      color: #007bff;
      background: white;
      padding: 6px 12px;
      border-radius: 6px;
      text-decoration: none;
      transition: background 0.2s ease;
     
    }

    .btn-link:hover {
      background: #007bff;
      color: white;
    }
     .col {
      min-width: 150px;
      white-space: nowrap;
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
            <div class="newbtn">
        		<a href="Addcategory.jsp">Add Category</a><br><br><br>
    		</div>
        <div class="overview-boxes">
       	
    <%
		DataBaseConnection db = new DataBaseConnection();
		ArrayList showcategory = db.showAllcategory();
		session.setAttribute("showcategory", showcategory);
	%>
    <div class="container">
        		<div class="card">
				    <div class="user-row">
		                <div class="col">C_ID</div>
		                <div class="col">Category Name</div>
		                <div class="col">Button</div>
		             </div>
		        </div>

            <%
	        	ArrayList al = (ArrayList)session.getAttribute("showcategory");
	        	if(al!=null){
        		for(int i=0;i<al.size();i++){
        			Allcategoryget st = (Allcategoryget)al.get(i);
        		
        	%>
        	
        
         		<div class="card">
				    <div class="user-row">
				      <div class="name"><%= st.getCid() %></div>
				      <div class="info"><%= st.getCategory_name()%></div>
				    </div>
				    <a class="btn-link" href="Categorydelete?cid=<%= st.getCid()%>">Delete</a>
				    <a class="btn-link" href="Addsubcategory.jsp?cid=<%= st.getCid()%>&cname=<%= st.getCategory_name() %>">Add SubCategory</a>
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