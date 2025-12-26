<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.*" %>
<%@page import="com.dbs.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Summary</title>
    <style>
    	* {
		    margin: 0;
		    padding: 0;
		    box-sizing: border-box;
		    font-family: Arial, sans-serif;
		}
		
		body {
		    background: #f4f6f9;
		    padding: 30px;
		}
		
		.container2 {
		    max-width: 700px;
		    margin: 10% 10% 10% 20%;
		}
		
		h2 {
		    margin-bottom: 20px;
		    text-align: center;
		    color: #333;
		}
		
		.order-card {
		    background: #fff;
		    padding: 20px;
		    border-radius: 10px;
		    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
		    margin-bottom: 20px;
		}
		
		.order-header {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    border-bottom: 1px solid #eee;
		    padding-bottom: 10px;
		    margin-bottom: 15px;
		}
		
		.order-header h3 {
		    color: #333;
		}
		
		.date {
		    color: #777;
		    font-size: 14px;
		}
		
		.status {
		    padding: 6px 12px;
		    border-radius: 20px;
		    font-size: 13px;
		    font-weight: bold;
		    text-transform: uppercase;
		}
		
		.delivered {
		    background: #d4edda;
		    color: #2e7d32;
		}
		
		.processing {
		    background: #fff3cd;
		    color: #b58105;
		}
		
		.item {
		    display: flex;
		    margin-bottom: 15px;
		}
		
		.item img {
		    width: 80px;
		    height: 80px;
		    border-radius: 8px;
		    margin-right: 15px;
		    object-fit: cover;
		}
		
		.details h4 {
		    color: #444;
		}
		
		.details p {
		    color: #666;
		    font-size: 14px;
		}
		
		.order-footer {
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    margin-top: 15px;
		    border-top: 1px solid #eee;
		    padding-top: 10px;
		}
		
		.track-btn {
		    background: #007bff;
		    color: white;
		    padding: 8px 16px;
		    border: none;
		    border-radius: 5px;
		    cursor: pointer;
		    transition: 0.2s;
		}
		
		.track-btn:hover {
		    background: #0056b3;
		}
		    	
    </style>
</head>
<body>
<%@include file="header.jsp" %>

    <div class="container2">
        <h2>Order Summary</h2>

        <div class="order-card">
            <div class="order-header">
                <div>
                    <h3>Orders</h3>
                   
                </div>
                <span class="status delivered">Delivered</span>
            </div>
			 <%
				DataBaseConnection db1= new DataBaseConnection();
				ArrayList<Orderget> orderget=db1.showOrder(newmail);
				session.setAttribute("orderget",orderget);
				
			%>
			 <%
					ArrayList al1=(ArrayList)session.getAttribute("orderget");
				if(al1 !=null)
				{
					for(int i=0; i<al1.size(); i++)
					{
						Orderget gt =(Orderget)al1.get(i);
			%>
			
            <div class="item">
                <img src="img/<%=gt.getImage() %>" alt="IMG" />
                <div class="details">
                    <h4><%=gt.getProduct_name() %></h4>
                     <p class="date">Placed on:  <%=gt.getCreatedDate() %></p>
                    <p>Price: <%=gt.getPrice() %></p>
                </div>
            </div>
       
         <% 
                  
			}
			} 
	%>
	 </div>
    </div>
<%@include file="Footer.jsp" %>
</body>
</html>
    