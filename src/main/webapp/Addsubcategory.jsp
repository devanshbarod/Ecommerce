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
            box-shadow: 10px 10px 0px rgba(0,0,0,0.5);
            padding:2%;
            margin: 10% 30% 5% 30%;
        } 
        .contain h2{
            text-align: center;
        }
        form input{
            width: 100%;
            padding: 1%;
            margin-bottom: 2%;
            display: flex;
            align-items: center;
        }
        #b1{
            width: 40%;
            background-color:maroon;
            color: white;
            display: block;
            align-items: center;
            margin-left: 30%;
            cursor: pointer;
            font-weight: bold;
        }
        #b1:hover{
            background-color: rosybrown;
            color: black;
            transition-duration: 0.8s;
        }
        

    </style>
</head>
<body>
	<%
		int cid = Integer.parseInt(request.getParameter("cid"));
		String cname = request.getParameter("cname");
	%>
    <div class="contain">
        <h2>Add Sub category</h2>
        <form action="Addsubcategory" method="post">
            <input type="text" name="subcname" placeholder="Subcategory_Name" id=""><br>
            <input type="number" name="cid" placeholder="Category_ID" id="" value="<%= cid %>" readonly><br>
            <input type="text" name="cname" placeholder="" value="<%= cname %>" id="" readonly><br>
            <label for="">Product Image</label>
            <input type="file" name="proimage" id=""><br>
            <input type="submit" value="Add" name="" id="b1">
        </form>
    </div>
</body>
</html>