<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@page import="com.dto.*" %>
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
        <div class="icon">✔</div>
		<%
	 		Productget st2 = (Productget) session.getAttribute("pro");
			if(st2 != null){
        		
        %>
        <h1>Payment Successful!</h1>
        <p>Your payment has been processed successfully.</p>

        <div class="order-info">
            <p><strong>Your payment ID is: </strong><%= request.getParameter("payment_id") %></p>
            <p><strong>Your Name is: </strong><%= st2.getProduct_name() %></p>
            <p><strong>Your Price is: </strong><%= st2.getPrice() %></p>
        </div>
        <form action="OrdersServlet" method="post">
        	<input type="text" name="paymentid" class="n1" value="<%= request.getParameter("payment_id") %>"> 
        	<input type="text" name="productid" class="n1" value="<%= st2.getProduct_id() %>">      
			<input type="text" name="name" class="n1" value="<%= st2.getProduct_name() %>">
			<input type="text" name="price" class="n1" value="<%= st2.getPrice() %>">
			<input type="text" name="email" class="n1" value="<%= newmail %>">
			<input type="text" name="image" class="n1" value="<%= st2.getImage() %>">
			<button class="home-btn">Continue Shopping</button>
		</form>
    	<%
			}else{
				out.print("No User found with the give ID");
			}
        %>

    </div>
</div>

</body>
</html>
