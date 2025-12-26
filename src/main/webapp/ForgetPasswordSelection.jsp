<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<style>
			/* Basic Reset and Global Styles */
		body {
		    font-family: 'Roboto', sans-serif;
		    background-color: #f0f2f5;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    min-height: 100vh;
		    margin: 0;
		}
		
		/* Main Container Styling */
		.forgot-password-container {
		    background-color: #fff;
		    padding: 40px;
		    border-radius: 12px;
		    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
		    width: 100%;
		    max-width: 450px;
		    text-align: center;
		}
		
		.forgot-password-container h1 {
		    color: #333;
		    margin-bottom: 10px;
		    font-weight: 700;
		}
		
		.forgot-password-container p {
		    color: #666;
		    margin-bottom: 30px;
		}
		
		/* Verification Method Selection Cards */
		.method-selection {
		    display: flex;
		    gap: 15px;
		    margin-bottom: 25px;
		}
		
		.radio-card {
		    flex: 1;
		    border: 2px solid #ddd;
		    border-radius: 8px;
		    padding: 15px;
		    cursor: pointer;
		    transition: all 0.2s ease-in-out;
		    display: block; /* Make the label fill the flex item */
		    text-align: left;
		    position: relative;
		}
		
		.radio-card:hover {
		    border-color: #007bff;
		    background-color: #f8faff;
		}
		
		.radio-card input[type="radio"] {
		    /* Hide the default radio button */
		    opacity: 0;
		    position: absolute;
		}
		
		/* Style for the selected card */
		.radio-card input[type="radio"]:checked + .card-content {
		    background-color: #e6f0ff; /* Light blue background for selected */
		    border-color: #007bff;
		    border-radius: 6px; /* Match inner radius to outer card */
		}
		
		/* Apply active/checked state styling to the card itself (the label) */
		.radio-card input[type="radio"]:checked ~ .card-content {
		    border: 1px solid #007bff;
		    background-color: #e6f0ff;
		}
		
		.radio-card input[type="radio"]:checked {
		    border-color: #007bff; /* Highlight border on check */
		    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.3);
		}
		
		.card-content {
		    display: flex;
		    flex-direction: column;
		    align-items: flex-start;
		    gap: 5px;
		    padding: 10px;
		    border-radius: 6px;
		    transition: background-color 0.2s;
		}
		
		.card-content a{
			text-decoration: none;
		}
		
		.card-content span {
		    font-size: 24px;
		    margin-bottom: 5px;
		}
		
		.card-content p {
		    margin: 0;
		    color: #333;
		    font-weight: 700;
		    font-size: 16px;
		}
		
		.card-content small {
		    font-size: 12px;
		    color: #888;
		    line-height: 1.3;
		}
		
		/* Input Field Styling */
		.input-group {
		    text-align: left;
		    margin-bottom: 25px;
		}
		
		.input-group label {
		    display: block;
		    margin-bottom: 8px;
		    color: #333;
		    font-weight: 500;
		}
		
		#recovery_input {
		    width: 95%;
		    padding: 12px;
		    border: 1px solid #ccc;
		    border-radius: 6px;
		    font-size: 16px;
		    transition: border-color 0.2s;
		}
		
		#recovery_input:focus {
		    border-color: #007bff;
		    outline: none;
		    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.1);
		}
		
		/* Button Styling */
		.submit-btn {
		    width: 100%;
		    padding: 12px;
		    background-color: #007bff;
		    color: white;
		    border: none;
		    border-radius: 6px;
		    font-size: 16px;
		    font-weight: 700;
		    cursor: pointer;
		    transition: background-color 0.2s;
		    margin-bottom: 20px;
		}
		
		.submit-btn:hover {
		    background-color: #0056b3;
		}
		
		/* Back Link */
		.back-link a {
		    color: #007bff;
		    text-decoration: none;
		    font-size: 14px;
		}
		
		.back-link a:hover {
		    text-decoration: underline;
		}
</style>
<body>
    <div class="forgot-password-container">
        <h1>Forgot Password?</h1>
        <p>Select your preferred verification method to reset your password.</p>

        <form class="verification-form">
            <div class="method-selection">
           
                <label class="radio-card">
                    <input type="radio" name="recovery_method" value="email" checked>
                     
                    <div class="card-content">
                    <a href="EmailVarify.jsp">
                        <span>📧</span>
                        <p>Verify via **Email**</p>
                        <small>Send a link to your registered email.</small>
                        </a>
                    </div>
                            
                </label>
     

                <label class="radio-card">
                    <input type="radio" name="recovery_method" value="mobile">
                    <div class="card-content">
                    <a href="MobileNumVerify.jsp">
                        <span>📱</span>
                        <p>Verify via **Mobile**</p>
                        <small>Send a code to your registered mobile number.</small>
                        </a>
                    </div>
                </label>
            </div>
        </form>
        
        <div class="back-link">
            <a href="login.jsp">← Back to Login</a>
        </div>
    </div>
</body>
</html>