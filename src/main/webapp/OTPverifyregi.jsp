<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>OTP Verification</title>
  <style>
    body {
      height: 100vh;
      margin: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      background: linear-gradient(135deg, #74ebd5, #9face6);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .otp-container {
      background-color: #fff;
      padding: 40px 30px;
      border-radius: 15px;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      text-align: center;
      max-width: 400px;
      width: 100%;
      animation: fadeIn 0.5s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    h2 {
      margin-bottom: 20px;
      color: #333;
    }

    p {
      margin-bottom: 25px;
      color: #666;
      font-size: 14px;
    }

    .otp-inputs {
      display: flex;
      justify-content: space-between;
      gap: 10px;
    }

    .otp-inputs input {
      width: 45px;
      height: 50px;
      font-size: 24px;
      text-align: center;
      border: 1px solid #ccc;
      border-radius: 8px;
      transition: border-color 0.3s, box-shadow 0.3s;
    }

    .otp-inputs input:focus {
      border-color: #6c63ff;
      box-shadow: 0 0 0 3px rgba(108, 99, 255, 0.2);
      outline: none;
    }

    input[type="submit"] {
      margin-top: 25px;
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
  </style>
</head>
<body>

  <div class="otp-container">
    <h2>Verify OTP</h2>
    <p>Please enter the 4-digit code sent to your email.</p>
    <form action="OTPverifyregi" method="POST" id="otpForm">
      <div class="otp-inputs">
        <input type="text" name="otp1" maxlength="1" required>
        <input type="text" name="otp2" maxlength="1" required>
        <input type="text" name="otp3" maxlength="1" required>
        <input type="text" name="otp4" maxlength="1" required>
        <input type="text" name="otp5" maxlength="1" required>
        <input type="text" name="otp6" maxlength="1" required>
      </div>
      <input type="submit" value="Verify">
    </form>
  </div>

  <script>
    const inputs = document.querySelectorAll('.otp-inputs input');

    inputs.forEach((input, index) => {
      input.addEventListener('input', () => {
        if (input.value.length === 1 && index < inputs.length - 1) {
          inputs[index + 1].focus();
        }
      });

      input.addEventListener('keydown', (e) => {
        if (e.key === 'Backspace' && !input.value && index > 0) {
          inputs[index - 1].focus();
        }
      });
    });
  </script>
</body>
</html>