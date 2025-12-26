<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Feedback Form</title>
  <style>
    /* Reset and base styles */

    @keyframes gradientShift {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    .feedback-form {
      background: #ffffff;
      border-radius: 16px;
      padding: 50px; /* Increased padding */
      width: 100%;
      max-width: 700px; /* Increased width */
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      position: relative;
      z-index: 1;
      margin-bottom: 60px;
      margin-top:10%;
      margin-left:29%;
    }

    .feedback-form h2 {
      text-align: center;
      margin-bottom: 30px;
      font-size: 28px;
      color: #cf1111;
    }

    label {
      display: block;
      margin-bottom: 6px;
      font-weight: 500;
      color: #333;
    }

    input,
    select,
    textarea {
      width: 100%;
      padding: 14px 16px; /* Slightly larger input padding */
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 8px;
      background: #f9f9f9;
      color: #222;
      font-size: 16px;
      transition: 0.3s ease;
    }

    select {
      appearance: none;
    }

    input::placeholder,
    textarea::placeholder {
      color: #888;
    }

    input:focus,
    textarea:focus,
    select:focus {
      outline: none;
      border-color: #0b3d91;
      box-shadow: 0 0 6px rgba(11, 61, 145, 0.2);
      background: #fff;
    }

    .rating {
      display: flex;
      flex-direction: row-reverse;
      justify-content: flex-end;
      margin-bottom: 20px;
    }

    .rating input {
      display: none;
    }

    .rating label {
      font-size: 30px; /* slightly larger stars */
      color: #bbb;
      cursor: pointer;
      transition: color 0.2s;
    }

    .rating input:checked ~ label,
    .rating label:hover,
    .rating label:hover ~ label {
      color: #f1c40f;
    }

    button {
      background: #b80707;
      color: black;
      border: none;
      border-radius: 8px;
      padding: 16px;
      width: 100%;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: 0.3s;
    }

    button:hover {
      background: #f5473b;
      transform: scale(1.02);
    }

    @media (max-width: 768px) {
      .feedback-form {
        max-width: 90%;
        padding: 35px;
      }
    }

    @media (max-width: 480px) {
      .feedback-form {
        padding: 25px;
      }
      .rating label {
        font-size: 22px;
      }
    }
  </style>
</head>
<body>
	<%@include file="header.jsp" %>
  <form class="feedback-form" action="Feedback" method="post">
    <h2>The Ecart Feedback Form</h2>

    <label for="name">Full Name:</label>
    <input type="text" id="name" name="name" placeholder="Enter your full name" required>

    <label for="email">Email Address:</label>
    <input type="email" id="email" name="email" placeholder="Enter your email" required>

    <label for="experience">Overall Experience:</label>
    <select id="experience" name="experience" required>
      <option value="">Select your experience</option>
      <option value="excellent">Excellent</option>
      <option value="good">Good</option>
      <option value="average">Average</option>
      <option value="poor">Poor</option>
    </select>

    <label>Rate Our Website:</label>
    <div class="rating">
      <input type="radio" id="star5" name="rating" value="5" required><label for="star5">&#9733;</label>
      <input type="radio" id="star4" name="rating" value="4"><label for="star4">&#9733;</label>
      <input type="radio" id="star3" name="rating" value="3"><label for="star3">&#9733;</label>
      <input type="radio" id="star2" name="rating" value="2"><label for="star2">&#9733;</label>
      <input type="radio" id="star1" name="rating" value="1"><label for="star1">&#9733;</label>
    </div>

    <label for="usability">Was the website easy to use?</label>
    <select id="usability" name="usability" required>
      <option value="">Select an option</option>
      <option value="yes">Yes</option>
      <option value="partially">Partially</option>
      <option value="no">No</option>
    </select>

    <label for="design">Website Design:</label>
    <select id="design" name="design" required>
      <option value="">Select an option</option>
      <option value="excellent">Excellent</option>
      <option value="good">Good</option>
      <option value="average">Average</option>
      <option value="poor">Poor</option>
    </select>

    <label for="performance">Website Performance:</label>
    <select id="performance" name="performance" required>
      <option value="">Select an option</option>
      <option value="excellent">Excellent</option>
      <option value="good">Good</option>
      <option value="average">Average</option>
      <option value="poor">Poor</option>
    </select>

    <label for="suggestions">Suggestions:</label>
    <textarea id="suggestions" name="suggestions" placeholder="Your suggestions or ideas..." rows="4"></textarea>

    <button type="submit">Submit Feedback</button>
  </form>
  <%@include file="Footer.jsp" %>
</body>
</html>