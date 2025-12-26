<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Not Found</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: #f5f6fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background: #ffffff;
            width: 380px;
            padding: 30px;
            text-align: center;
            border-radius: 12px;
            box-shadow: 0px 5px 20px rgba(0,0,0,0.1);
        }

        .container img {
            width: 100px;
            margin-bottom: 20px;
        }

        h2 {
            color: #ff4d4d;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            font-size: 15px;
            margin-bottom: 25px;
        }

        .button {
            display: inline-block;
            padding: 12px 20px;
            background: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 6px;
            transition: 0.3s ease;
        }

        .button:hover {
            background: #0056b3;
        }

        .small-link {
            display: block;
            margin-top: 15px;
            color: #555;
            font-size: 14px;
            text-decoration: none;
        }

        .small-link:hover {
            text-decoration: underline;
        }

    </style>
</head>
<body>

    <div class="container">
        <img src="https://cdn-icons-png.flaticon.com/512/463/463612.png" alt="error icon">
        <h2>User Not Found</h2>
        <p>The UserName and Password you entered does not match any account.  
           Please check your credentials or create a new account.</p>

        <a href="login.jsp" class="button">Try Again</a>
        <a href="Emailverifyregi.jsp" class="small-link">Create New Account</a>
    </div>

</body>
</html>
