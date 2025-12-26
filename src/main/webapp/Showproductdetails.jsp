
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.*" %>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Product Detail Modal</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,500,700&display=swap" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
   <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f5f5f5;
      text-align: center;
    }

    .btn-back-to-top {
      position: fixed;
      bottom: 20px;
      right: 20px;
      background: #333;
      border-radius: 50%;
      padding: 10px;
      cursor: pointer;
    }

    .btn-back-to-top i {
      color: white;
      font-size: 20px;
    }

    .overlay-modal {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0,0,0,0.6);
      display: flex;
      justify-content: center;
      align-items: center;
      z-index: 1000;
    }

    .modal-container {
      background-color: white;
      width: 25%;
      max-width: 500px;
      border-radius: 8px;
      padding: 50px;
      display: flex;
      flex-wrap: wrap;
    }

    .modal-image {
      flex: 1 1 50%;
      padding: 10px;
    }

    .modal-image img {
      border-radius: 5px;
    }

    .modal-details {
      flex: 1 1 50%;
      padding: 10px;
    }

    .modal-details h4 {
      font-size: 24px;
      margin-bottom: 10px;
    }

    .modal-details span {
      display: block;
      font-size: 20px;
      color: #e74c3c;
      margin-bottom: 15px;
    }

    .modal-details p {
      font-size: 16px;
      color: #555;
      margin-bottom: 20px;
    }

    .quantity-section {
      align-items: center;
      margin-bottom: 20px;
      text-align: center;
    }

    .quantity-section label {
      margin-right: 10px;
    }

    .quantity-control {
      display: flex;
      align-items: center;
      border: 1px solid #ccc;
      border-radius: 4px;
      overflow: hidden;
      width: fit-content;
      margin-left:33%;
    }

    .quantity-control button {
      padding: 5px 10px;
      border: none;
      background-color: #eee;
      cursor: pointer;
      font-size: 16px;
    }

    .quantity-control input {
      width: 50px;
      text-align: center;
      border: none;
      outline: none;
    }

    .add-to-cart-btn {
      background-color: #000;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 14px;
    }

    @media (max-width: 768px) {
      .modal-container {
        flex-direction: column;
      }

      .modal-image, .modal-details {
        flex: 1 1 100%;
      }
    }
    .n1{
    display: none;
    }
    #amount{
    	display:none;
    }
    #buybtn{
    	text-align:center;
    	margin-left:200%;	
    }
    
  </style>
</head>
<body>

  <!-- Back to top -->
  <div class="btn-back-to-top" id="myBtn">
    <i class="fa fa-chevron-up"></i>
  </div>
	<%
	 Productget st2 = (Productget) session.getAttribute("pro");
	if(st2 != null){
        		
        	%>
        	<%
                	String newmail = (String) session.getAttribute("email");
            %>
  <!-- Product Detail Modal -->
  <div class="overlay-modal">
    <div class="modal-container">
     <form action="Addcart" method="post">
      <!-- Image section -->
      <div class="modal-image">
     
        <img src="img/<%= st2.getImage() %>"  width="300" height="300" alt="Product Image" />
      </div>
      
<input type="text" name="productid" class="n1" value="<%= st2.getProduct_id() %>">      
<input type="text" name="name" class="n1" value="<%= st2.getProduct_name() %>">
<input type="text" name="price" class="n1" value="<%= st2.getPrice() %>">
<input type="text" name="img" class="n1" value="<%= st2.getImage() %>">
<input type="text" name="email" class="n1" value="<%= newmail %>">
      <!-- Details section -->
      
      <div class="modal-details">
        <h4><%= st2.getProduct_name() %></h4>
        <span>Price: ₹<%= st2.getPrice() %></span>
        <p><%= st2.getDescription() %></p>

        
<button type="submit" class="add-to-cart-btn">Add to Cart</button>
        <!-- Add to Cart -->
        <!-- <input type="submit" class="add-to-cart-btn" value="Add to Cart"> -->
      </div>
      </form>
      <form id="paymentForm">
        <input type="number" name="amount" id="amount" value="<%= st2.getPrice() %>" readonly>
        <input type="text" name="productid" id="product_id" class="n1" value="<%= st2.getProduct_id() %>">      
        <button type="submit" class="add-to-cart-btn" id="buybtn">Buy</button>
    </form>
    </div>
  </div>
<%
	}else{
		out.print("No User found with the give ID");
	}
        %>
        
       <script>
        document.getElementById("paymentForm").addEventListener("submit", function (e) {
            e.preventDefault();

            const amount = document.getElementById("amount").value;
            const product_id = document.getElementById("product_id").value;

            fetch("createOrder", {
                method: "POST",
                headers: { "Content-Type": "application/x-www-form-urlencoded" },
                body: "amount=" + amount
            })
            .then(res => res.json())
            .then(order => {
                const options = {
                    key: "rzp_test_Rd8cnewTjhB38q", // Replace with your Key ID
                    amount: order.amount,
                    currency: "INR",
                    name: "E-Cart",
                    description: "Test Transaction",
                    order_id: order.id,
                    handler: function (response) {
                        alert("Payment successful! Payment ID: " + response.razorpay_payment_id);
                        window.location.href = "success.jsp?payment_id=" + response.razorpay_payment_id;
                    },
                    prefill: {
                        name: "Student User",
                        email: "student@example.com",
                        contact: "9999999999"
                    },
                    theme: { color: "#3399cc" }
                };
                const rzp = new Razorpay(options);
                rzp.open();
            })
            .catch(err => alert("Error creating order: " + err));
        });
    </script> 
</body>
</html>
