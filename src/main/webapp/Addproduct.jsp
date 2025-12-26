<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        #ip1{
			 margin-bottom: 3%;
        }
        #in1{
        	width: 92%;
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
    <div class="main">
        <h2>Add PRODUCT</h2>
        <form action="AddProduct" method="post">
            <div class="fields">
                <label for="" >Product Name</label><br>
                <input type="text" name="pname" placeholder="Product_Name" id="in1" ><br><br>
                <div id="ip1">
                    <label for="">Price</label>
                    <label for="" id="b1">Category</label><br>
                     <input type="text" name="price" placeholder="Price" id="">
                     <input type="text" name="subcategory" placeholder="Sub_Category" id=""><br>
                </div>
                <textarea name="disc" placeholder="Description" id="desc"></textarea><br>
               <div id="ip2">
                    <label for="">Brand</label>
                    <label for="" id="b1">Quantity</label><br>
                    <input type="text" name="brand" placeholder="Brand" id="">
                    <input type="number" name="qty" placeholder="Quantity" id=""><br><br>
               </div>
                <div id="ip3">
                     <label for="">Total</label>
                     <label for="" id="b1">Subtotal</label><br>
                     <input type="number" name="total" placeholder="Total" id="">
                     <input type="number" name="subtotal" placeholder="Subtotal" id=""><br><br>
                </div>
               <label for="">Images</label>
               <input type="file" name="proimage" id="">
               <input type="submit" value="ADD" id="btn">
            </div>
        </form>
    </div>
</body>
</html>