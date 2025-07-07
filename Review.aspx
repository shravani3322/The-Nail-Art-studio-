<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="finalnailart05.Review" %>

<!DOCTYPE html>
<html>
<head>
    <title>Submit Your Feedback</title>
    <style>
        body { 
            font-family: 'Poppins', sans-serif; 
            background: linear-gradient(135deg, #ff4a6b, #111);
            padding: 20px; 
            text-align: center; 
            color: white;
        }

        .review-container { 
            width: 40%; 
            background: #222; 
            padding: 20px; 
            border-radius: 12px; 
            box-shadow: 0 10px 30px rgba(255, 20, 147, 0.3); 
            margin: auto;
            transition: transform 0.3s ease-in-out;
            color: white;
        }

        .review-container:hover {
            transform: scale(1.03);
        }

        .form-control { 
            width: 100%; 
            padding: 12px; 
            margin-bottom: 12px; 
            border: 2px solid #ff4a6b; 
            border-radius: 8px; 
            font-size: 16px;
            background: #333;
            color: white;
            transition: 0.3s;
        }

        .form-control:focus {
            border-color: #ff0080;
            box-shadow: 0 0 10px rgba(255, 20, 147, 0.5);
            background: black;
        }

        .rating {
            display: flex;
            justify-content: center;
            margin-bottom: 15px;
        }

        .star {
            font-size: 30px;
            color: #555;
            cursor: pointer;
            transition: color 0.3s, transform 0.3s;
        }

        .star:hover, .star.active {
            color: #ff4a6b;
            transform: scale(1.2);
        }

        .btn-submit { 
            width: 100%; 
            background: linear-gradient(135deg, #ff4a6b, #ff0080); 
            color: white; 
            padding: 12px; 
            border: none; 
            cursor: pointer; 
            border-radius: 8px; 
            font-size: 18px;
            transition: 0.3s;
        }

        .btn-submit:hover { 
            background: linear-gradient(135deg, #ff0080, #ff4a6b); 
            transform: scale(1.05);
        }

        .success-message {
            color: #0f0;
            font-weight: bold;
            margin-top: 10px;
            display: none;
        }

        @media (max-width: 768px) {
            .review-container { width: 90%; }
        }
    </style>
    <script>
        function setRating(value) {
            var stars = document.getElementsByClassName("star");
            for (var i = 0; i < stars.length; i++) {
                stars[i].classList.remove("active");
            }
            for (var i = 0; i < value; i++) {
                stars[i].classList.add("active");
            }
            document.getElementById("hfRating").value = value;
        }
    </script>
</head>
<body>

    <h2> Submit Your Feedback </h2>
    <form id="form1" runat="server">
        <div class="review-container">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Your Name"></asp:TextBox>

            <div class="rating">
                <span class="star" onclick="setRating(1)">★</span>
                <span class="star" onclick="setRating(2)">★</span>
                <span class="star" onclick="setRating(3)">★</span>
                <span class="star" onclick="setRating(4)">★</span>
                <span class="star" onclick="setRating(5)">★</span>
            </div>
            <asp:HiddenField ID="hfRating" runat="server" />

            <asp:TextBox ID="txtComment" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Placeholder="Your Review"></asp:TextBox>

            <asp:Button ID="btnSubmit" runat="server" Text="💌 Submit Review" CssClass="btn-submit" OnClick="SubmitReview" />
            <p class="success-message" id="successMessage">✔ Review submitted successfully!</p>
        </div>
    </form>

    <center>
        <a href="Home.aspx" style="color: white; text-decoration: none; font-weight: bold; transition: 0.3s;" 
            onmouseover="this.style.color='black'; this.style.background='pink'; this.style.padding='5px 10px'; this.style.borderRadius='5px';" 
            onmouseout="this.style.color='white'; this.style.background=''; this.style.padding=''; this.style.borderRadius='';">
        ⬅ Go Back 
        </a>
    </center>

</body>
</html>
