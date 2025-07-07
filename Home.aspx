<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="finalnailart05.Home" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <title>Nail Art Studio - Home</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        /* Google Font */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        /* Global Styling */
        body {
            font-family: 'Poppins', sans-serif;
            background: #000; /* Black Background */
            margin: 0;
            padding: 0;
            color: white;
        }

        /* Navbar */
        nav {
            background: #111;
            padding: 15px 0;
            text-align: center;
            position: sticky;
            top: 0;
            width: 100%;
            box-shadow: 0px 4px 6px rgba(255, 20, 147, 0.5);
        }

        nav a {
            color: pink;
            text-decoration: none;
            font-size: 18px;
            font-weight: 500;
            padding: 12px 20px;
            margin: 0 10px;
            display: inline-block;
            transition: all 0.3s ease-in-out;
        }

        nav a:hover {
            color: black;
            background: pink;
            border-radius: 20px;
            padding: 12px 25px;
        }

        /* Hero Section with Animation */
        .hero {
            text-align: center;
            padding: 80px 20px;
            background: linear-gradient(to right, #ff1493, #ff69b4);
            color: black;
            font-weight: bold;
            border-bottom-left-radius: 50% 10%;
            border-bottom-right-radius: 50% 10%;
            opacity: 0;
            transform: translateY(50px);
            animation: fadeSlide 1.5s ease-out forwards;
        }

        @keyframes fadeSlide {
            0% {
                opacity: 0;
                transform: translateY(50px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .hero h1 {
            font-size: 50px;
            font-weight: 700;
        }

        .hero p {
            font-size: 20px;
            font-weight: 300;
            max-width: 600px;
            margin: 20px auto;
        }

        .hero button {
            background: black;
            color: pink;
            border: 2px solid pink;
            padding: 12px 20px;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
            border-radius: 25px;
        }

        .hero button:hover {
            background: pink;
            color: black;
        }

        /* Services Section */
        .services {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 50px 20px;
        }

        .service-box {
            background: black;
            padding: 20px;
            width: 250px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0px 4px 10px rgba(255, 20, 147, 0.5);
            transition: transform 0.3s ease-in-out;
            border: 1px solid pink;
        }

        .service-box:hover {
            transform: translateY(-10px);
            background: black;
            color:rosybrown;
        }

        .service-box img {
            width: 80%;
            border-radius: 10px;
        }

        .service-box h3 {
            margin-top: 10px;
            color: pink;
        }
          .search-container {
            text-align: center;
            margin: 20px;
        }

        .search-container input, .search-container select, .search-container button {
            padding: 10px;
            font-size: 16px;
            border: 2px solid pink;
            border-radius: 5px;
            margin: 5px;
        }

        .search-container button {
            background: pink;
            color: black;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .search-container button:hover {
            background: black;
            color: pink;
        }

        /* Search Results */
        #searchResults {
            text-align: center;
            margin: 20px auto;
            max-width: 600px;
            display: none;
        }

        .search-item {
            background: black;
            color: pink;
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
            border: 1px solid pink;
            transition: transform 0.3s;
        }

        .search-item:hover {
            transform: scale(1.05);
            background: pink;
            color: black;
        }
        /* Footer */
        footer {
            background: #111;
            padding: 40px 20px;
            text-align: center;
            color: pink;
            margin-top: 30px;
            font-weight: 500;
            box-shadow: 0px -4px 10px rgba(255, 20, 147, 0.5);
        }
        .gallery-btn {
        display: inline-block;
        background: pink;
        color: black;
        padding: 12px 20px;
        font-size: 18px;
        font-weight: bold;
        text-decoration: none;
        border-radius: 20px;
        transition: all 0.3s ease-in-out;
    }

    .gallery-btn:hover {
        background: black;
        color: pink;
    }

        footer h3 {
            margin-bottom: 20px;
            font-size: 24px;
            color: white }

        footer p {
            margin: 5px 0;
        }

        footer a {
            color: pink;
            text-decoration: none;
            font-weight: 600;
            padding: 5px 10px;
        }

        footer a:hover {
            color: black;
            background: pink;
            border-radius: 10px;
            padding: 5px 15px;
        }

        .footer-images {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            margin-top: 50px;
        }

        .footer-images img {
            width: 220px;
            height: 220px;
            margin: 0 10px;
            border-radius: 10px;
            transition: transform 0.3s;
        }

        .footer-images img:hover {
            transform: scale(1.2);
        }

        /* Address Section */
        .address {
            margin-top: 20px;
            font-size: 20px;
            color: white;
         text-shadow:red;
        }
       @keyframes fadeIn {
            0% { opacity: 0.5; transform: scale(1); }
            100% { opacity: 1; transform: scale(1.05); }
        }
    </style>

</head>
<body>

    <!-- Navigation Bar -->
    <nav>
            <!-- Dropdown & Search Bar -->
    <div class="search-container">
        <select id="serviceDropdown" onchange="redirectToService()">
      <option value>💅Select Service</option>
            <option value="Manicure.aspx">Manicure❤️‍🔥</option>
            <option value="Pedicure.aspx">Pedicure🌸</option>
            <option value="Nail Gel.aspx">Nail Gel🌷</option>
            <option value="Nail Art.aspx">Nail Art💅</option>
        </select>

   
   <script>
       function redirectToService() {
           var dropdown = document.getElementById("serviceDropdown");
           var selectedPage = dropdown.value;

           if (selectedPage) {
               window.location.href = selectedPage;
           }
       }
   </script>


        <a href="Home.aspx">🏠 Home</a>
        <a href="Services.aspx">💅All Services</a>
      
        <a href="Contact.aspx">📞 Contact</a>
        <a href="Login.aspx">🔑 Login</a>
        <a href="Signup.aspx">📝 Signup</a>
    </nav>

    <!-- Hero Section with Animation -->
    <div class="hero">
            <div class="address" style="text-align: center; font-size: 20px; color: white; animation: fadeIn 2s ease-in-out infinite alternate;">
<h1>The Nail Art Studio</h1>
<p>Experience luxury nail art services by professionals. Book now!</p></div>
        <a href="Gallery.aspx" class="gallery-btn">🖼️Visit Gallery</a>

    </div>
 <!-- Services Section -->
    <div class="services">
         <div class="service-box">
            <img src="img/ps.jpg" alt="Pedicure">
            <h3>Pedicure</h3>
            <p>Keep your feet soft and beautiful with our pedicure service.</p>
           <a href="Services.aspx" style="display: inline-block; padding: 10px 15px; background: pink; color: black; text-decoration: none; border-radius: 5px; font-weight: bold; transition: 0.3s;">View Details</a>

        </div>
        <div class="service-box">
            <img src="img/ms.jpg" alt="Manicure">
            <h3>Manicure</h3>
            <p>Gentle and stylish manicures for the perfect nails.</p>
           <a href="Services.aspx" style="display: inline-block; padding: 10px 15px; background: pink; color: black; text-decoration: none; border-radius: 5px; font-weight: bold; transition: 0.3s;">View Details</a>

        </div>
       
        <div class="service-box">
            <img src="img/gs.jpg" alt="Gel Nails">
            <h3>Gel Nails</h3>
            <p>Long-lasting, durable, and trendy gel nails just for you.</p>
            <a href="Services.aspx" style="display: inline-block; padding: 10px 15px; background: pink; color: black; text-decoration: none; border-radius: 5px; font-weight: bold; transition: 0.3s;">View Details</a>

        </div>
         </div>
    <center>   <div><a href="https://wa.me/9322831609" target="_blank" 
   style="display: inline-block; background-color: lightgreen; color: white; padding: 12px 20px; font-size: 18px; 
          font-weight: bold; text-decoration: none; border-radius: 25px; box-shadow: 2px 2px 10px rgba(0,0,0,0.3);
          transition: 0.3s;">
    💬 Chat with Us
</a></div></center> 
           
    <br>
  
    
    
   <!-- Footer -->
<footer>
   <h3 style="color: white; text-align: center;">💅 Follow Us on Social Media 💅</h3>
     <br>
   
    
<div style="text-align: center; margin-top: 20px;">
    <a href="https://www.instagram.com/shra_vani1205" target="_blank" 
       style="display: inline-block; background-color: lightpink; color: white; padding: 12px 20px; 
              font-size: 16px; font-weight: bold; text-decoration: none; border-radius: 20px;
              margin: 10px 20px; transition: 0.3s; box-shadow: 2px 2px 10px rgba(0,0,0,0.3);">
        🌸 Instagram
    </a>

    <a href="https://www.facebook.com/fakeaccount" target="_blank" 
       style="display: inline-block; background-color: lightpink; color: white; padding: 12px 20px; 
              font-size: 16px; font-weight: bold; text-decoration: none; border-radius: 20px;
              margin: 10px 20px; transition: 0.3s; box-shadow: 2px 2px 10px rgba(0,0,0,0.3);">
        🌟 Facebook
    </a>

    <a href="https://wa.me/9322831609" target="_blank" 
       style="display: inline-block; background-color: lightpink; color: white; padding: 12px 20px; 
              font-size: 16px; font-weight: bold; text-decoration: none; border-radius: 20px;
              margin: 10px 20px; transition: 0.3s; box-shadow: 2px 2px 10px rgba(0,0,0,0.3);">
        💬 Twitter
    </a>

    <a href="Review.aspx" target="_blank" 
       style="display: inline-block; background-color: lightpink; color: white; padding: 12px 20px; 
              font-size: 16px; font-weight: bold; text-decoration: none; border-radius: 20px;
              margin: 10px 20px; transition: 0.3s; box-shadow: 2px 2px 10px rgba(0,0,0,0.3);">
         Feedback 📩 
    </a>

</div>
     <br>
    <br>
     <br>
    <br>
    

    
    <!-- Footer Images with Spacing -->
    <div class="footer-images" style="margin-bottom: 20px; text-align: center;">
        <img src="img/p1.jpg" alt="Footer Image 1" style="margin: 0 35px;">
        <img src="img/p2.jpg" alt="Footer Image 2" style="margin: 0 35px;">
        <img src="img/p3.jpg" alt="Footer Image 3" style="margin: 0 35px;">
        <img src="img/p4.jpg" alt="Footer Image 4" style="margin: 0 35px;">
    </div>
    <br>
    <br>
    <br>
    
    <!-- Animated Address -->
    <div class="address" style="text-align: center; font-size: 20px; color: white; animation: fadeIn 2s ease-in-out infinite alternate;">
        <p>📍 Address: 123 Nail Art Studio,Baramati 413102</p>
        <p>📞 Phone: (932) 283-1609</p>
        <p>✉️ Email: navaleshravani42@gmail.com</p>
    </div>

    <!-- Inline CSS Animation -->
   
</footer>

</body>
</html>
