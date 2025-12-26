<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body>
	<div class="flex min-h-full flex-col justify-center px-6 py-12 lg:px-8">
	  <div class="sm:mx-auto sm:w-full sm:max-w-sm">
	    <h2 class="mt-20 text-center text-2xl/9 font-bold tracking-tight text-gray-900">Change Password</h2>
	  </div>
	
	  <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
	    <form action="ChangePasswordUser" method="POST" class="space-y-6" id="passwordForm">
	      <div>
	        <div class="flex items-center justify-between">
	          <label for="password" class="block text-sm/6 font-medium text-gray-900">Password</label>
	        </div>
	        <div class="mt-2">
	          <input id="password" type="password" name="password" required autocomplete="current-password" class="block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-600 sm:text-sm/6" />
	        </div>
	      </div>
	
	      <div>
	        <div class="flex items-center justify-between">
	          <label for="password2" class="block text-sm/6 font-medium text-gray-900">Confirm Password</label>
	        </div>
	        <div class="mt-2">
	          <input id="password2" type="password" name="password2" required autocomplete="current-password" class="block w-full rounded-md bg-white px-3 py-1.5 text-base text-gray-900 outline-1 -outline-offset-1 outline-gray-300 placeholder:text-gray-400 focus:outline-2 focus:-outline-offset-2 focus:outline-indigo-600 sm:text-sm/6" />
	        </div>
	      </div>
	      <div>
	        <button type="submit" class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm/6 font-semibold text-white shadow-xs hover:bg-indigo-500 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">Sign in</button>
	      </div>
	    </form>
		  </div>
		</div>
		
		
		 <script>
    document.getElementById("passwordForm").addEventListener("submit", function (e) {
      const password = document.getElementById("password").value;
      const password2 = document.getElementById("password2").value;

      const errors = [];

      // Check length
      if (password.length < 8) {
        errors.push("Password must be at least 8 characters long.");
      }

      // Check if passwords match
      if (password !== password2) {
        errors.push("Passwords do not match.");
      }

      if (errors.length > 0) {
        e.preventDefault(); // Stop form submission
        alert(errors.join("\n"));
      }
    });
  </script>
		
</body>
</html>