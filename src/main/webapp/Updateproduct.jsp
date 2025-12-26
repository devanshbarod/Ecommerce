<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .main{
            box-shadow: 0 0  10px rgba(0,0,0, 0.8);
            margin: 5% 28% 10% 28%;
            padding: 2% 2% 2% 4%;
            align-items: center;
            
        }
        .main h2{
        
            align-items: center;
            margin-left: 35%;
        }
        .fields input{
            width: 43%;
            padding: 2%;
         
        }
        .fields label{
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            
        }
        #b1{
            margin-left: 43%;
        }
        #b5{
            margin-left: 36%;
        }
        #ip1{
			 margin-bottom: 3%;
        }
        #desc{
            width: 92%;
            margin-bottom: 3%;
            padding: 2%;
            font-family: Arial, Helvetica, sans-serif;

        }
        #btn{
            color:white ;
            background-color: navy;
            margin-left: 25%;
        }
    </style>
</head>
<body>
<%
			 Productget p = (Productget) session.getAttribute("pro");
			if(p != null){
	%>
    <div class="main">
        <h2>Add PRODUCT</h2>
        <form action="Productupdate" method="post">
            <div class="fields">
                <label for="">Product ID</label>
                <label for="" id="b5">Product Name</label><br>
                <input type="number" name="pid" placeholder="Product_ID" id="" value=<%= p.getProduct_id() %>>
                <input type="text" name="pname" placeholder="Product_Name" id="" value=<%= p.getProduct_name() %>><br><br>
                <div id="ip1">
                    <label for="">Price</label>
                    <label for="" id="b1">Category</label><br>
                     <input type="text" name="price" placeholder="Price" id="" value=<%= p.getPrice() %>>
                     <input type="text" name="subcategory" placeholder="Sub_Category" id="" value=<%= p.getCategory() %>><br>
                </div>
                <textarea name="disc" placeholder="Description" id="desc" ><%= p.getDescription() %></textarea><br>
               <div id="ip2">
                    <label for="">Brand</label>
                    <label for="" id="b1">Quantity</label><br>
                    <input type="text" name="brand" placeholder="Brand" id="" value=<%= p.getBrand() %>>
                    <input type="number" name="qty" placeholder="Quantity" id="" value=<%= p.getQty() %>><br><br>
               </div>
               
                <div id="ip3">
                     <label for="">Total</label>
                     <label for="" id="b1">Subtotal</label><br>
                     <input type="number" name="total" placeholder="Total" id="" value=<%= p.getTotal() %>>
                     <input type="number" name="subtotal" placeholder="Subtotal" id="" value=<%= p.getSubtotal() %>><br><br>
                </div>
               <label for="">Images</label>
               <input type="file" name="proimage" id="" value=<%= p.getImage() %>>
                <input type="submit" value="ADD" id="btn">
            </div>
        </form>
         <%
		}else{
			out.print("No User found with the give ID");
		}
    %>
    </div>
</body>
</html>