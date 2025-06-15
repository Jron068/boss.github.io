<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ELLE'S PATISSERIE PRODUCT</title>
    <!-- Tailwind CSS CDN for basic styling and responsiveness -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom styles from previous Canvas, adapted for new layout */
        body {
            font-family: 'Inter', sans-serif; /* Using Inter font as per instructions */
            background-color: #ff8040; /* Light grey background */
            display: flex; /* Use flexbox for body to arrange content */
            flex-direction: column; /* Stack header, title, and columns vertically */
            align-items: center; /* Center content horizontally */
            min-height: 100vh; /* Full viewport height */
            margin: 0; /* Remove default margin */
            padding: 0; /* Ensure no padding interferes with layout */
        }

        /* Styles for the header, adapted from your provided structure */
        .main-header {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2rem;
            background-color: #a0522d; /* Sienna-like color for the header */
            color: #ffffff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .main-header .logo {
            display: flex;
            align-items: center;
            font-weight: bold;
            font-size: 1.5rem;
        }

        .main-header .logo img {
            height: 40px; /* Adjust as needed */
            margin-right: 0.5rem;
            border-radius: 9999px; /* Make logo image circular */
            object-fit: cover;
        }

        .main-header .nav-links a {
            color: #ffffff;
            text-decoration: none;
            margin: 0 1rem;
            font-size: 1.1rem;
            transition: color 0.3s ease;
        }

        .main-header .nav-links a:hover {
            color: #ffcc99; /* Lighter color on hover */
        }

        .main-header .logout-form button {
            background-color: #ff8040; /* Orange color */
            color: white;
            border: none;
            padding: 0.75rem 1.25rem;
            border-radius: 0.5rem;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        .main-header .logout-form button:hover {
            background-color: #e66020; /* Darker orange on hover */
        }

        /* Styles for the head title */
        .head {
            color: #ff8040; /* Orange color */
            margin-top: 30px; /* Spacing from header */
            text-align: center; /* Center the text */
            padding: 10px 10px;
            font-family: Arial, sans-serif;
            font-size: 2.5rem; /* Larger font size */
            font-weight: bold;
        }

        .container {
            background-color: #a0522d; /* White background for the container */
            padding: 2.5rem; /* Large padding */
            border-radius: 1rem; /* Rounded corners */
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            max-width: 90%; /* Max width for responsiveness */
            width: 800px; /* Fixed width for larger screens */
            margin-top: 2rem; /* Spacing from the H1 title */
            margin-bottom: 2rem; /* Spacing at the bottom */
        }

        .column-header {
            font-weight: 700; /* Bold text */
            margin-top: 1rem; /* Spacing above header from image */
            margin-bottom: 0.75rem; /* Spacing below header */
            color: #333; /* Darker text for headers */
        }

        .column {
            background-color: #ff8040; /* Lighter background for each column */
            padding: 1.5rem; /* Padding inside columns */
            border-radius: 0.75rem; /* Rounded corners for columns */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05); /* Lighter shadow for columns */
            margin: 0.75rem; /* Margin around columns for spacing */
            flex: 1; /* Allows columns to grow and shrink equally */
            min-width: 280px; /* Minimum width before wrapping */
            display: flex; /* Use flexbox for column content */
            flex-direction: column; /* Stack content vertically */
            justify-content: flex-start; /* Align content to the top */
            align-items: center; /* Center items horizontally within the column */
            text-align: center; /* Center text within the column */
        }

        /* Styling for the images within the columns */
        .column img {
            width: 100px; /* Fixed width for icons */
            height: 100px; /* Fixed height for icons */
            object-fit: contain; /* Ensure the whole image is visible */
            border-radius: 50%; /* Make images circular */
            padding: 5px; /* Small padding inside the circle */
            background-color: #ffffff; /* White background for the circle */
            box-shadow: 0 2px 5px rgba(0,0,0,0.1); /* Subtle shadow for icons */
        }

        /* Responsive adjustments using Tailwind's breakpoints directly or custom media queries */
        @media (max-width: 768px) {
            .main-header {
                flex-direction: column;
                padding: 1rem;
            }
            .main-header .nav-links {
                margin-top: 1rem;
            }
            .main-header .nav-links a {
                margin: 0 0.5rem;
            }
            .container {
                padding: 1.5rem;
            }
            .column {
                margin: 0.5rem 0; /* Adjust margin for stacked columns */
            }
        }
    </style>
</head>
<body>

<header class="main-header">
    <div class="logo" tabindex="0" role="img" aria-label="Company Logo">
        <!-- Using a placeholder for logo.png, replace with your actual image path -->
        <img src="../images/logo.png" alt="Logo" />
        <span>ELLE'S PATISSERIE</span>
    </div>

    <nav class="nav-links">
        <a href="welcome.jsp">Home</a>
        <a href="Product.jsp">About</a>
        <a href="Contact.jsp">Contact</a>
    </nav>

    <form action="${pageContext.request.contextPath}/auth" method="post" class="logout-form">
        <input type="hidden" name="action" value="logout">
        <button type="submit">Logout</button>
    </form>
</header>

<h1 class="head">ELLE'S PATISSERIE PRODUCT</h1>

<div class="container">
    <h1 class="text-4xl font-bold text-center mb-8 text-gray-800">Our Socials and Contact</h1>

    <!-- The main flex container for columns -->
    <div class="flex flex-col md:flex-row flex-wrap justify-center items-stretch -m-3">
        <!-- Column 1: Facebook -->
        <div class="column">
            <img src="../images/facebook.jpg" onerror="this.src='https://placehold.co/100x100/4267B2/FFFFFF?text=FB';" alt="Facebook Icon" />
            <h2 class="text-xl column-header">FACEBOOK</h2>
            <!-- Adding a placeholder for content, or remove if not needed -->
            <p class="text-base column-content">Connect with us on Facebook for latest updates and offers!</p>
        </div>

        <!-- Column 2: Gmail -->
        <div class="column">
            <img src="../images/gmail.jpg" onerror="this.src='https://placehold.co/100x100/EA4335/FFFFFF?text=GM';" alt="Gmail Icon" />
            <h2 class="text-xl column-header">GMAIL</h2>
            <!-- Adding a placeholder for content, or remove if not needed -->
            <p class="text-base column-content">Email us directly for inquiries and support.</p>
        </div>

        <!-- Column 3: Contact -->
        <div class="column">
            <img src="../images/contact.jpg" onerror="this.src='https://placehold.co/100x100/34A853/FFFFFF?text=CALL';" alt="Contact Icon" />
            <h2 class="text-xl column-header">CONTACT</h2>
            <!-- Adding a placeholder for content, or remove if not needed -->
            <p class="text-base column-content">Reach out to us via phone for urgent requests.</p>
        </div>
    </div>
</div>

</body>
</html>
