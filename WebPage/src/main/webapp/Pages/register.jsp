<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elle's Patisserie - Register</title>
    <!-- Tailwind CSS CDN for basic styling and responsiveness -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Keep original stylesheet links if they contain other necessary global styles -->
    
    <style>
        /* Custom styles to match the ELLE'S PATISSERIE aesthetic */
        body {
            font-family: 'Inter', sans-serif; /* Consistent font */
            background-color: #a0522d; /* Light grey background */
            display: flex;
            justify-content: center; /* Center horizontally */
            align-items: center; /* Center vertically */
            min-height: 100vh; /* Full viewport height */
            margin: 0;
            padding: 20px; /* Add some padding around the body */
            box-sizing: border-box; /* Include padding in element's total width and height */
        }

        .register-container {
            background-color: #ffffff; /* White background */
            padding: 2.5rem; /* Large padding */
            border-radius: 1rem; /* Rounded corners */
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            max-width: 450px; /* Max width for the registration form */
            width: 95%; /* Responsive width */
            text-align: center; /* Center text within the container */
        }

        .register-container h2 {
            font-size: 2.5rem; /* Large font for heading */
            font-weight: bold;
            color: #a0522d; /* Sienna-like color for headings */
            margin-bottom: 2rem; /* Spacing below heading */
        }

        .register-form input[type="text"],
        .register-form input[type="password"],
        .register-form input[type="email"] { /* Added email input */
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1.25rem; /* Spacing between inputs */
            border: 1px solid #ccc;
            border-radius: 0.5rem; /* Rounded input fields */
            font-size: 1rem;
            outline: none;
            transition: border-color 0.2s ease;
        }

        .register-form input[type="text"]:focus,
        .register-form input[type="password"]:focus,
        .register-form input[type="email"]:focus { /* Added email input focus */
            border-color: #ff8040; /* Orange border on focus */
            box-shadow: 0 0 0 3px rgba(255, 128, 64, 0.2); /* Soft glow on focus */
        }

        .register-form label {
            display: block; /* Make labels appear on their own line */
            text-align: left; /* Align labels to the left */
            margin-bottom: 0.5rem; /* Space between label and input */
            color: #555;
            font-weight: bold;
        }

        .register-form input[type="submit"] {
            background-color: #ff8040; /* Orange color for button */
            color: white;
            border: none;
            padding: 0.85rem 1.75rem; /* Larger padding for button */
            border-radius: 0.5rem;
            cursor: pointer;
            font-size: 1.1rem;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.1s ease;
            width: 100%; /* Full width button */
            margin-top: 1rem; /* Space above button */
        }

        .register-form input[type="submit"]:hover {
            background-color: #e66020; /* Darker orange on hover */
            transform: translateY(-2px); /* Slight lift on hover */
        }

        .login-link { /* Changed from register-link to login-link */
            display: block; /* Make link appear on its own line */
            margin-top: 1.5rem; /* Spacing above link */
            color: #a0522d; /* Sienna-like color for link */
            text-decoration: none;
            font-size: 1rem;
            transition: color 0.3s ease;
        }

        .login-link:hover {
            color: #ff8040; /* Orange on hover */
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="register-container">
    <h2>Register</h2>
    <form action="${pageContext.request.contextPath}/auth" method="post" class="register-form">
        <input type="hidden" name="action" value="register">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <label for="confirm_password">Confirm Password:</label>
        <input type="password" id="confirm_password" name="confirm_password" required>

        <input type="submit" value="Register">
    </form>
    <a href="loginpage.jsp" class="login-link">Already have an account? Login</a>
</div>

</body>
</html>
