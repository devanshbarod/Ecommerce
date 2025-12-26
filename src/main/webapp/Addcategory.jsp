<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        .contain{
            border: 2px solid black;
            box-shadow: 10px 10px 0px rgba(0,0,0,0.8);
            margin: 5% 35% 10% 35%;
            padding:5%;
        }
        .contain h2{
            text-align: center;
        }
        form input{
            width: 100%;
            padding: 2%;
            margin-bottom: 5%;
        }
        #btn{
            background-color:blueviolet;
            color: white;
        }
    </style>
</head>
<body>
    <div class="contain">
        <h2>Add Category</h2>
        <form action="Addcategory" method="post">
            <input type="text" name="cname" placeholder="Category_Name" id=""><br>
            <input type="submit" value="Add" name="" id="btn">
        </form>
    </div>
</body>
</html>