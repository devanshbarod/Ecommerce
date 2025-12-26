<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="com.dto.*" %>
<%@page import="com.dbs.*" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Successful</title>
    <style>
    	body {
    margin: 0;
    padding: 0;
    background: #f2f7ff;
    font-family: Arial, sans-serif;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.success-box {
    background: white;
    text-align: center;
    padding: 40px;
    width: 400px;
    border-radius: 18px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
}

.icon {
    font-size: 60px;
    color: #2ecc71;
    background: #e9ffe5;
    width: 90px;
    height: 90px;
    margin: 0 auto 20px;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
}

h1 {
    font-size: 28px;
    margin-bottom: 10px;
}

p {
    color: #555;
}

.order-info {
    background: #f8faff;
    padding: 15px;
    border-radius: 10px;
    margin: 20px 0;
    text-align: left;
}

.order-info p {
    margin: 5px 0;
    color: #333;
}

.home-btn,
.order-btn {
    display: block;
    text-decoration: none;
    padding: 12px;
    margin-top: 12px;
    border-radius: 8px;
    font-weight: bold;
}

.home-btn {
    background: #1d5dff;
    color: white;
}

.order-btn {
    background: #e9ecf9;
    color: #1d5dff;
}
.n1{
	display:none;
}
    	
    </style>
</head>
<body>

<div class="container">
    <div class="success-box">
	<%
          	String newmail = (String) session.getAttribute("email");
    %>
	 <%
		DataBaseConnection db1= new DataBaseConnection();
		ArrayList<Cartitemget> cartget=db1.showcart2(newmail);
		session.setAttribute("cartget",cartget);
		
	%>
	 
        <h1>Payment Successful!</h1>
        <p>Your payment has been processed successfully.</p>
        
        
        <form action="OrdersServletaddtocart" method="post">
        	<%
			ArrayList<Cartitemget> list = (ArrayList<Cartitemget>) session.getAttribute("cartget");
			if(list != null){
			    for(Cartitemget gt : list){
			%>
			
			    <input type="hidden" name="paymentid" value="<%= request.getParameter("payment_id") %>">
			    <input type="hidden" name="productid" value="<%= gt.getProductid() %>">
			    <input type="hidden" name="name" value="<%= gt.getName() %>">
			    <input type="hidden" name="price" value="<%= gt.getPrice() %>">
			    <input type="hidden" name="email" value="<%= newmail %>">
			    <input type="hidden" name="image" value="<%= gt.getImg() %>">
			<div class="order-info">
            <p><strong>Your payment ID is: </strong><%= request.getParameter("payment_id") %></p>
            <p><strong>Your Name is: </strong><%= gt.getName() %></p>
        </div>
			<% } } %>
			
			<button class="home-btn">Continue Shopping</button>
		</form>
    

    </div>
</div>

</body>
</html>
