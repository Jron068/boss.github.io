<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // JSP logic for session management
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String username = (String) session.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ELLE'S PATISSERIE PRODUCT</title>
    <!-- Tailwind CSS CDN for basic styling and responsiveness -->
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Custom styles for body and overall layout */
        body {
            font-family: 'Inter', sans-serif; /* Using Inter font as per instructions */
            background-color: #ff8040; /* Light grey background */
            display: flex; /* Use flexbox for body to arrange content */
            flex-direction: column; /* Stack header, title, and sections vertically */
            align-items: center; /* Center content horizontally */
            min-height: 100vh; /* Full viewport height */
            margin: 0; /* Remove default margin */
            padding: 0; /* Ensure no padding interferes with layout */
        }

        /* Styles for the header */
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

        /* Styles for the welcome content container */
        .HContent {
            background-color: #fff;
            padding: 2rem;
            border-radius: 1rem;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 2rem;
            width: 90%;
            max-width: 600px;
            text-align: center;
            color: #333;
        }
        .HContent h2 {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 0.5rem;
            color: #ff8040;
        }
        .HContent p {
            font-size: 1.1rem;
            color: #555;
        }

        /* Styles for the 'ABOUT' content block */
        .content {
            position: relative; /* For absolute positioning of text-block */
            width: 90%;
            max-width: 800px;
            margin-top: 2rem;
            margin-bottom: 2rem;
            border-radius: 1rem;
            overflow: hidden; /* Ensures image and text-block are contained */
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
        }

        .content img {
            width: 100%;
            height: auto;
            display: block; /* Remove extra space below image */
            border-radius: 1rem; /* Match container border-radius */
            filter: brightness(60%); /* Darken image slightly for text readability */
        }

        .content .text-block {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%); /* Center horizontally and vertically */
            color: #ffffff;
            text-align: center;
            padding: 1.5rem;
            background-color: rgba(0, 0, 0, 0.4); /* Semi-transparent background for text */
            border-radius: 0.75rem;
            white-space: nowrap; /* Prevent text from wrapping unnecessarily */
        }

        .content .text-block h1 {
            font-size: 3rem; /* Large font size for About title */
            font-weight: bold;
            line-height: 1.1; /* Adjust line height for stacked titles */
            margin: 0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Text shadow for better visibility */
        }
        @media (max-width: 768px) {
            .content .text-block h1 {
                font-size: 2rem; /* Adjust font size for smaller screens */
            }
        }
        @media (max-width: 480px) {
            .content .text-block h1 {
                font-size: 1.5rem; /* Further adjust for very small screens */
            }
        }

        /* Styles for general section headers */
        .head {
            color: #333;
            margin-top: 30px;
            padding: 10px 10px;
            font-family: Arial, sans-serif;
            font-size: 2.5rem;
            font-weight: bold;
            text-align: center; /* Ensure text is centered */
            width: 100%; /* Take full width to center text */
        }

        /* Styles for the product image gallery */
        .image-gallery {
            display: flex;
            flex-direction: column;
            align-items: center; /* Center the rows horizontally */
            gap: 30px; /* Space between rows */
            width: 90%; /* Max width for the gallery */
            max-width: 1000px; /* Limit overall gallery width */
            margin-top: 2rem; /* Space from previous section */
            margin-bottom: 3rem; /* Space before next section */
        }

        .row-pair {
            display: flex;
            flex-direction: column; /* Stack groups on small screens */
            justify-content: center; /* Center groups when stacked */
            align-items: center; /* Center groups horizontally when stacked */
            width: 100%; /* Take full width of image-gallery */
            gap: 20px; /* Space between left and right groups when stacked */
        }
        @media (min-width: 768px) { /* On medium screens and up */
            .row-pair {
                flex-direction: row; /* Arrange groups in a row */
                justify-content: space-between; /* Distribute space between groups */
                align-items: flex-start; /* Align groups to the top */
                width: 90%; /* Narrower width for spacing between rows */
            }
        }

        .left-group, .right-group {
            display: flex;
            flex-wrap: wrap; /* Allow items to wrap */
            justify-content: center; /* Center items within group */
            align-items: flex-start; /* Align items to the top within group */
            gap: 20px; /* Space between product items */
            flex-basis: auto; /* Allow groups to size content */
            width: 100%; /* Take full width on small screens */
        }
        @media (min-width: 768px) {
            .left-group {
                justify-content: flex-end; /* Align to the right for left group on larger screens */
                flex: 3; /* Allocate more space to left group (3 items) */
            }
            .right-group {
                justify-content: flex-start; /* Align to the left for right group on larger screens */
                flex: 2; /* Allocate less space to right group (2 items) */
            }
        }

        .product-item {
            font-size: 15px;
            display: flex;
            flex-direction: column;
            align-items: center; /* Center image and text */
            text-align: center;
            width: 120px; /* Fixed width for each product item */
            color: #a0522d;
            padding-top: 15px; /* Adjust padding */
            margin: 0; /* Remove specific margins, rely on gap */
            flex-shrink: 0; /* Prevent items from shrinking too much */
        }

        .product-img {
            width:100px;
            height: 100px; /* Keep consistent height for circular images */
            object-fit: cover; /* Cover the area, cropping if necessary */
            border-radius: 50%; /* Make images circular */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .product-img:hover {
            transform: scale(1.05);
        }

        .product-name {
            margin-top: 0.5rem; /* Space between image and name */
            font-weight: bold;
        }

        /* Styles for the contact columns */
        .container {
            background-color: #ffffff; /* White background for the container */
            padding: 2.5rem; /* Large padding */
            border-radius: 1rem; /* Rounded corners */
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1); /* Subtle shadow */
            max-width: 90%; /* Max width for responsiveness */
            width: 800px; /* Fixed width for larger screens */
            margin-top: 2rem; /* Spacing from the previous section */
            margin-bottom: 2rem; /* Spacing at the bottom */
        }

        .column-header {
            font-weight: 700; /* Bold text */
            margin-top: 1rem; /* Spacing above header from image */
            margin-bottom: 0.75rem; /* Spacing below header */
            color: #333; /* Darker text for headers */
        }

        .column {
            background-color: #f8faff; /* Lighter background for each column */
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

        /* Styling for the images within the contact columns */
        .column img {
            width: 100px; /* Fixed width for icons */
            height: 100px; /* Fixed height for icons */
            object-fit: contain; /* Ensure the whole image is visible */
            border-radius: 50%; /* Make images circular */
            padding: 5px; /* Small padding inside the circle */
            background-color: #ffffff; /* White background for the circle */
            box-shadow: 0 2px 5px rgba(0,0,0,0.1); /* Subtle shadow for icons */
        }

        /* Responsive adjustments for overall layout */
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
            .container, .HContent, .content, .image-gallery {
                width: 95%; /* Adjust width for smaller screens */
                padding: 1rem;
            }
            .column {
                margin: 0.5rem 0; /* Adjust margin for stacked columns */
            }
            /* Adjust product item size for very small screens if necessary */
            .product-item {
                width: 100px;
            }
            .product-img {
                width: 80px;
                height: 80px;
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


<div>
    <h1 class="head">ELLE'S PATISSERIE PRODUCT</h1>
</div>

<%
    int totalImages = 15;
    int i = 1;

    // Optional: Just to simulate some names
    String[][] cookieNames = {
        {"Choco Chip", "Oatmeal", "Peanut Butter"},
        {"Sugar Cookie", "Ginger Snap", "Snickerdoodle"},
        {"Shortbread", "Macaron", "Biscotti"}
    };
    String[][] drinkNames = {
            {"Choco Chip", "Oatmeal"},
            {"Sugar Cookie", "Ginger Snap"},
            {"Shortbread", "Macaron"}
        };
    int cookieRow = 0;
    int drinkRow = 0;
%>

<div class="image-gallery">
<%
    while (i <= totalImages) {
%>
    <div class="row-pair">
        <div class="left-group">
            <%
                for (int c = 0; c < 3 && i <= totalImages; c++, i++) {
                    String name = (cookieRow < cookieNames.length && c < cookieNames[cookieRow].length)
                                  ? cookieNames[cookieRow][c]
                                  : "Cookie " + i;
            %>
                <div class="product-item">
				    <img src="../ProductImages/imgFood<%= i %>.png" onerror="this.src='https://placehold.co/100x100/F0E68C/8B4513?text=Food<%= i %>';" alt="<%= name %>" class="product-img" />
				    <p class="product-name"><%= name %></p>
				</div>
            <%
                }
                cookieRow++;
            %>
        </div>
        <div class="right-group">
            <%
                for (int d = 0; d < 2 && i <= totalImages; d++, i++) {
                	String name = (drinkRow < drinkNames.length && d < drinkNames[drinkRow].length)
                            ? drinkNames[drinkRow][d]
                            : "Drink " + i;
            %>
                <div class="product-item">
				    <img src="../DrinkImg/imgDrinks<%= i %>.png" onerror="this.src='https://placehold.co/100x100/ADD8E6/00008B?text=Drink<%= i %>';" alt="<%= name %>" class="product-img" />
				    <p class="product-name"><%= name %></p>
				</div>
            <%
                }
            	drinkRow++;
            %>
        </div>
    </div>
<%
    }
%>
</div>



</body>
</html>
