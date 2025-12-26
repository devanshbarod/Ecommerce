<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<link rel="stylesheet" href="Registration.css">
<script>
    function validateForm() {
        const form = document.forms[0];

        const username = form["username"].value.trim();
        const fname = form["fname"].value.trim();
        const lname = form["lname"].value.trim();
        const password = form["password"].value;
        const confirmPassword = form["confirmPassword"].value;  // Confirm password field has no name!
        const email = form["email"].value.trim();
        const mobnumber = form["mobnumber"].value.trim();
        const gender = form["gender"];
        const dob = form["dob"].value;
        const address = form["address"].value.trim();
        const state = form["state"].value;
        const city = form["city"].value;
        const pin = form["pin"].value.trim();

        // Username
        if (!username) {
            alert("Please enter a username.");
            return false;
        }

        // First and last name
        if (!fname || !lname) {
            alert("Please enter both first and last names.");
            return false;
        }

        // Password
        if (!password || password.length < 6) {
            alert("Password must be at least 6 characters.");
            return false;
        }

        // Confirm Password (need to set proper name)
        if (!confirmPassword || confirmPassword !== password) {
            alert("Passwords do not match.");
            return false;
        }

        // Email
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            alert("Please enter a valid email address.");
            return false;
        }

        // Mobile number
        const phoneRegex = /^[0-9]{10}$/;
        if (!phoneRegex.test(mobnumber)) {
            alert("Please enter a valid 10-digit mobile number.");
            return false;
        }

        // Gender
        let genderSelected = false;
        for (let i = 0; i < gender.length; i++) {
            if (gender[i].checked) {
                genderSelected = true;
                break;
            }
        }
        if (!genderSelected) {
            alert("Please select a gender.");
            return false;
        }

        // DOB
        if (!dob) {
            alert("Please select your date of birth.");
            return false;
        }

        // Address
        if (!address) {
            alert("Please enter your address.");
            return false;
        }

        // State and City
        if (!state) {
            alert("Please select a state.");
            return false;
        }

        if (!city) {
            alert("Please select a city.");
            return false;
        }

        // Postal Code
        if (!/^[0-9]{5,6}$/.test(pin)) {
            alert("Please enter a valid postal code (5 or 6 digits).");
            return false;
        }

        return true; // Allow submission
    }
</script>
</head>
<body>
    <div class="container">
        <h1 id="head1">Registration</h1>
        <form onsubmit="return validateForm();" action="Registration" method="post">
        	<div class="d1">
                <input type="text" name="username" placeholder="UserName">
            </div>
            <div class="d1">
                <input type="text" name="fname" id="name1" placeholder="First Name">
                <input type="text" name="lname" id="v2" placeholder="Last Name"><br>
            
                <input type="password" name="password" id="password" placeholder="Password">
                <!-- Add name="confirmPassword" to enable validation -->
                <input type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password"><br>
                <%
                
	                
	                String email = (String) session.getAttribute("email");
                
                %>
                <input type="email" name="email" id="email1" value="<%= email %>" placeholder="Email" readonly>
                <input type="tel" name="mobnumber" id="number" placeholder="Mob. Number"><br>
            </div>
            <div class="d2"> 
                <label for="gender">Gender</label><br><br>
                <input type="radio" name="gender" value="Male">
                <label>Male</label>
                <input type="radio" name="gender" value="Female">  
                <label>Female</label>
                <input type="radio" name="gender" value="Other">  
                <label>Other</label><br>
            </div>
            <div class="d3">
                <label for="dob" class="dat1">DoB</label>
                <input type="date" name="dob">
            </div>
            <div class="caddress">
                <textarea name="address" id="address1" placeholder="Address"></textarea>
            </div>  
            <div class="d4">
                <label for="state">State</label>
                <label for="city" id="city1">City</label><br>
                <select name="state">
                    <option value="">Select</option>
                    <option value="Gujarat">Gujarat</option>
                    <option value="Rajasthan">Rajasthan</option>
                    <option value="Chhattisgarh">Chhattisgarh</option>
                    <option value="Madhya Pradesh">Madhya Pradesh</option>
                </select>
                <select name="city">
                    <option value="">Select</option>
                    <option value="Bhopal">Bhopal</option>
                    <option value="Indore">Indore</option>
                    <option value="Gwalior">Gwalior</option>
                    <option value="Ujjain">Ujjain</option>
                    <option value="Ahmedabad">Ahmedabad</option>
                    <option value="Surat">Surat</option>
                    <option value="Vadodara">Vadodara</option>
                    <option value="Rajkot">Rajkot</option>
                    <option value="Jaipur">Jaipur</option> 
                    <option value="Udaipur">Udaipur</option>
                    <option value="Jodhpur">Jodhpur</option>
                    <option value="Jaisalmer">Jaisalmer</option>
                    <option value="Raipur">Raipur</option>
                    <option value="Raigarh">Raigarh</option>
                    <option value="Bilaspur">Bilaspur</option>
                    <option value="Jagdalpur">Jagdalpur</option>
                </select>
            </div>
            <div class="d5">
                <label for="pin">Postal Code</label><br>
                <input type="number" name="pin" placeholder="Postal">
                <select name="role">
                    <option value="user">User</option>
                </select>
            </div>
            <input type="submit" class="sbtn" value="Submit" id="submit">
        </form>
        <span>Already have an account ?</span><a href="login.jsp">Log in</a>
    </div>
</body>
</html>
