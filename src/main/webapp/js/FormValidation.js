/**
 * 
 */
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