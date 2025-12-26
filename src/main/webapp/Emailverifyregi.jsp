<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Email Verification</title>
  <style>
    /* Reset and base styles */
    *{
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      height: 100vh;
      display: flex;
      align-items: center;
      justify-content: center;
      background: linear-gradient(135deg, #74ebd5, #9face6);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .form-container {
      background-color: white;
      padding: 40px 30px;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      max-width: 400px;
      width: 100%;
      text-align: center;
      animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    .form-container h2 {
      margin-bottom: 25px;
      color: #333;
    }

    label {
      font-size: 14px;
      font-weight: 600;
      color: #444;
      display: block;
      text-align: left;
      margin-bottom: 8px;
    }

    input[type="email"] {
      width: 100%;
      padding: 12px 15px;
      font-size: 15px;
      border: 1px solid #ccc;
      border-radius: 8px;
      outline: none;
      transition: border-color 0.3s, box-shadow 0.3s;
    }

    input[type="email"]:focus {
      border-color: #6c63ff;
      box-shadow: 0 0 0 3px rgba(108, 99, 255, 0.2);
    }

    input[type="submit"] {
      margin-top: 20px;
      width: 100%;
      padding: 12px;
      font-size: 16px;
      background-color: #6c63ff;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
      background-color: #574dcf;
    }

    @media (max-width: 500px) {
      .form-container {
        padding: 30px 20px;
      }
    }
  </style>
</head>
<body>
  <div class="form-container">
    <h2>Email Verification</h2>
    <form action="Emailverifyregi" method="POST">
      <label for="email">Email Address</label>
      <input type="email" id="email" name="email" required placeholder="you@example.com">
      <input type="submit" value="Send Verification Code">
    </form>
  </div>
</body>
</html>