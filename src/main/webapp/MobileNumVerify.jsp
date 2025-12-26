<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
<script>
        function sendOTP() {
            var mobile = document.getElementById('mobile').value;
            if(mobile === '') {
                alert('Please enter mobile number');
                return;
            }
            
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "GenerateMobileOTP", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    document.getElementById('otpSection').style.display = 'block';
                    alert('OTP sent to your mobile!');
                }
            };
            xhr.send("action=sendOTP&mobile=" + mobile);
        }
        
        function validateForm() {
            var otp = document.getElementById('otp').value;
            if(otp === '') {
                alert('Please enter OTP');
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
  <div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
  <div class="sm:mx-auto sm:w-full sm:max-w-sm">
    <h2 class="mt-30 text-center text-2xl/9 font-bold tracking-tight text-gray-900">Forgot password</h2>
  </div>
  <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
    <form action="OTPverifyMobile.jsp" method="POST" class="space-y-6" onsubmit="sendOTP()">
      <div>
        <label for="Moblie Number" class="block text-sm/6 font-medium text-gray-900">Mobile Number</label>
        <div class="mt-2">
          <input id="mobile" type="number" name="mobile" required autocomplete="mobile" class="block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-600 sm:text-sm/6" />
        </div>
      </div>
      <div>
        <button type="submit" class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm/6 font-semibold text-white shadow-xs hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Next</button>
      </div>
    </form>
  </div>
</div>

<script>
    // Get the form, input, and error message elements
    const form = document.getElementById('forgotPasswordForm');
    const mobileInput = document.getElementById('mobile');
    const mobileError = document.getElementById('mobileError');

    // Add an event listener for the form submission
    form.addEventListener('submit', function(event) {
      // Prevent the default form submission
      event.preventDefault();

      // Get the mobile number value and trim any whitespace
      const mobileNumber = mobileInput.value.trim();

      // Simple validation: check if the number is exactly 10 digits
      // The `^\d{10}$` regex checks for a string that starts (^) and ends ($) with exactly 10 digits (\d{10}).
      const isValid = /^\d{10}$/.test(mobileNumber);

      if (isValid) {
        // Validation passed
        mobileError.classList.add('hidden'); // Hide the error message
        mobileInput.classList.remove('input-error'); // Remove error style

        // In a real application, you would submit the form here
        // form.submit();

        
        console.log('Mobile number is valid. Submitting form...');
        // You would perform your server-side logic here.
        alert('Verification request sent to ' + mobileNumber);

      } else {
        // Validation failed
        mobileError.classList.remove('hidden'); // Show the error message
        mobileInput.classList.add('input-error'); // Add error style
        mobileInput.focus(); // Focus on the input for user convenience
      }
    });
  </script>


</body>
</html>