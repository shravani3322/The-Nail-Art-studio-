<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="finalnailart05.Gallery" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Gallery</title>

    <style>
        /* Google Font */
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f8f8;
            text-align: center;
            margin: 0;
            padding: 0;
        }

        .gallery-title {
            font-size: 2rem;
            margin: 20px 0;
            color: #333;
            text-transform: uppercase;
            font-weight: 600;
            letter-spacing: 2px;
        }

        /* Gallery Grid */
        .gallery {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1000px;
            margin: auto;
        }

        /* Individual Image Box */
        .gallery-item {
            position: relative;
            overflow: hidden;
            border-radius: 10px;
            cursor: pointer;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease-in-out;
            height: 250px; /* Fixed height for better alignment */
        }

        .gallery-item:hover {
            transform: scale(1.05);
        }

        /* Image Styling - Full Box Coverage */
        .gallery-item img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Ensures the image fully fills the box */
            display: block;
            transition: transform 0.4s ease-in-out;
        }

        /* Hover Zoom Effect */
        .gallery-item:hover img {
            transform: scale(1.2);
        }

        /* Overlay Effect */
        .overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
            text-align: center;
            padding: 10px;
            font-size: 1.2rem;
            opacity: 0;
            transform: translateY(100%);
            transition: all 0.4s ease-in-out;
        }

        .gallery-item:hover .overlay {
            opacity: 1;
            transform: translateY(0);
        }

    </style>
</head>
<body>

    <h2 class="gallery-title">Services Gallery</h2>

    <div class="gallery">
        <div class="gallery-item">
            <img src="img/f1.jpg" alt="Manicure">
            <div class="overlay">Glitters</div>
        </div>

        <div class="gallery-item">
            <img src="img/f2.jpg" alt="Pedicure">
            <div class="overlay">Delux</div>
        </div>

        <div class="gallery-item">
            <img src="img/f3.jpg" alt="Nail Gel">
            <div class="overlay">Nail Gel</div>
        </div>

        <div class="gallery-item">
            <img src="img/f4.jpg" alt="Nail Art">
            <div class="overlay">Nail Art</div>
        </div>

        <div class="gallery-item">
            <img src="img/ms.jpg" alt="Nail Extensions">
            <div class="overlay">Nail Extensions</div>
        </div>

        <div class="gallery-item">
            <img src="img/ps.jpg" alt="French Tips">
            <div class="overlay">French Tips</div>
        </div>
         <div class="gallery-item">
            <img src="img/gs.jpg" alt="Nail Art">
            <div class="overlay">Nail Art</div>
        </div>

        <div class="gallery-item">
            <img src="img/s1.jpg" alt="Nail Extensions">
            <div class="overlay">Nail Extensions</div>
        </div>

        <div class="gallery-item">
            <img src="img/s2.jpg" alt="French Tips">
            <div class="overlay">French Tips</div>
        </div>
          <div class="gallery-item">
            <img src="img/s3.jpg" alt="French Tips">
            <div class="overlay">French Tips</div>
        </div>
          <div class="gallery-item">
            <img src="img/m3.jpg" alt="French Tips">
            <div class="overlay">Manicure</div>
        </div>
          <div class="gallery-item">
            <img src="img/s5.jpg" alt="French Tips">
            <div class="overlay">French Tips</div>
        </div>
          <div class="gallery-item">
            <img src="img/s6.jpg" alt="French Tips">
            <div class="overlay">French Tips</div>
        </div>
          <div class="gallery-item">
            <img src="img/p2.jpg" alt="French Tips">
            <div class="overlay">French Tips</div>
        </div>
          <div class="gallery-item">
            <img src="img/p3.jpg" alt="French Tips">
            <div class="overlay">French Tips</div>
        </div>
    </div>
     <center>
     <a href="https://localhost:44316/Home.aspx" style="color: pink; text-decoration: none; font-weight: bold; transition: 0.3s;" 
   onmouseover="this.style.color='black'; this.style.background='pink'; this.style.padding='5px 10px'; this.style.borderRadius='5px';" 
   onmouseout="this.style.color='pink'; this.style.background=''; this.style.padding=''; this.style.borderRadius='';">
   ⬅ Back to Home</center>
</body>
</html>
