<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Help | The Ecart</title>

<!-- ✅ Bootstrap 5 Bundle -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<!-- ✅ Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- ✅ Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #dbeafe, #f3e8ff);
    min-height: 100vh;
    margin: 0;
    display: flex;
    flex-direction: column;
}

/* 🔹 Header */
header {
    width: 100%;
    background-color: #ffffff;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
    z-index: 100;
    position: sticky;
    top: 0;
}
.header-container {
    max-width: 1200px;
    margin: auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
}
.header-logo {
    font-size: 1.8rem;
    font-weight: 700;
    color: #6b21a8;
}
.header-links {
    display: flex;
    align-items: center;
    gap: 25px;
}
.header-links a {
    color: #4b5563;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s;
}
.header-links a:hover {
    color: #6b21a8;
}
.header-links a.active {
    color: #6b21a8;
    font-weight: 600;
}

/* 🔹 Navbar */
.navbar {
    background-color: #ffffffcc;
    backdrop-filter: blur(10px);
    border-top: 1px solid #e5e7eb;
    box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}
.navbar-nav .nav-link {
    color: #4b5563;
    font-weight: 500;
    transition: color 0.3s;
    display: inline-flex;
    align-items: center;
}
.navbar-nav .nav-link:hover,
.navbar-nav .nav-link.active {
    color: #6b21a8;
}
.navbar-nav .nav-link i {
    color: #6b21a8;
    margin-right: 12px;
    margin-left: 30px;
    font-size: 15px;
    transition: transform 0.2s;
}
.navbar-nav .nav-link:hover i {
    transform: scale(1.2);
}

/* 🔹 Help Section */
.help-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 80px 20px;
    flex: 1;
}
.help-box {
    background-color: #ffffff;
    border-radius: 25px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
    max-width: 1000px;
    width: 95%;
    padding: 60px 50px;
    text-align: center;
}
.help-title {
    color: #6b21a8;
    font-weight: 700;
    font-size: 36px;
    margin-bottom: 15px;
}
.help-subtitle {
    color: #4b5563;
    font-size: 16px;
    margin-bottom: 30px;
}

/* 🔹 Search Bar */
.search-bar {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 40px;
}
.search-bar input {
    width: 70%;
    max-width: 600px;
    padding: 12px 20px;
    border-radius: 25px;
    border: 2px solid #d8b4fe;
    outline: none;
    transition: 0.3s;
}
.search-bar input:focus {
    border-color: #6b21a8;
    box-shadow: 0 0 5px rgba(107, 33, 168, 0.2);
}

/* 🔹 Support Options */
.support-options {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    gap: 25px;
}
.support-card {
    background: #f3e8ff;
    border-radius: 20px;
    padding: 25px;
    width: 260px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    transition: 0.3s;
}
.support-card:hover {
    background: #e9d5ff;
    transform: translateY(-5px);
}
.support-card i {
    font-size: 35px;
    color: #6b21a8;
    margin-bottom: 10px;
}
.support-card h5 {
    font-weight: 600;
    color: #6b21a8;
    margin-bottom: 10px;
}
.support-card p {
    color: #4b5563;
    font-size: 15px;
}

/* 🔹 Footer */
footer {
    background-color: #1f2937;
    color: #f3f4f6;
    text-align: center;
    padding: 25px 0;
    width: 100%;
    font-size: 14px;
    margin-top: auto;
}
footer i {
    font-size: 20px;
    color: white;
    margin: 0 10px;
    transition: color 0.3s;
}
footer i:hover {
    color: #a78bfa;
}
</style>
</head>

<body>
<%@include file="header.jsp" %>
<!-- 🔹 Help Section -->
<div class="help-container">
  <div class="help-box">
    <h2 class="help-title">How Can We Help You?</h2>
    <p class="help-subtitle">Search for answers or get in touch with our customer support team.</p>

    <div class="search-bar">
      <input type="text" placeholder="Search for help topics...">
    </div>

    <div class="support-options">
      <div class="support-card">
        <i class="fa-solid fa-phone"></i>
        <h5>Call Us</h5>
        <p>+91 98765 43210<br>Mon–Sat, 9 AM–8 PM</p>
      </div>

      <div class="support-card">
        <i class="fa-solid fa-envelope"></i>
        <h5>Email Support</h5>
        <p>support@theecart.com<br>24×7 assistance</p>
      </div>

      <div class="support-card">
        <i class="fa-solid fa-comments"></i>
        <h5>Live Chat</h5>
        <p>Chat with our customer support<br>Available 9 AM–10 PM</p>
      </div>
    </div>
  </div>
</div>

<%@include file="Footer.jsp" %>

</body>
</html>