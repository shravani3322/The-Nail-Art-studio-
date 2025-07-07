<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="finalnailart05.Signup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Sign Up</title>
    <style>
        body {
            margin: 0;
            width: 100vw;
            height: 100vh;
            background: #111;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Arial', sans-serif;
            overflow: hidden;
        }

        .container {
            width: 400px;
            padding: 25px;
            border-radius: 15px;
            background: #222;
            box-shadow: 0 10px 30px rgba(255, 20, 147, 0.4);
            text-align: center;
            animation: float 1.5s ease-in-out infinite alternate;
            border: 2px solid #ff1493;
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            100% { transform: translateY(-8px); }
        }

        h2 {
            color: #ff1493;
            font-size: 26px;
            font-weight: bold;
            margin-bottom: 10px;
            text-transform: uppercase;
        }

        /* White color for labels */
        label {
            display: block;
            font-weight: bold;
            margin-top: 10px;
            color: #ffffff;
            font-size: 14px;
        }

        input {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 2px solid #ff1493;
            border-radius: 8px;
            font-size: 16px;
            background: #333;
            color: white;
            transition: 0.3s;
            outline: none;
        }

        input:focus {
            border-color: #ff69b4;
            box-shadow: 0 0 15px rgba(255, 105, 180, 0.5);
        }

        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #ff1493, #ff69b4);
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s ease-in-out;
            text-transform: uppercase;
        }

        .btn:hover {
            background: linear-gradient(135deg, #ff69b4, #ff1493);
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(255, 105, 180, 0.4);
        }

        .link-container {
            margin-top: 15px;
        }

        /* White color for 'Already have an account?' */
        .link-container p {
            color: #ffffff;
            font-size: 14px;
        }

        a {
            color: #ff69b4;
            text-decoration: none;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        a:hover {
            color: #ff1493;
            text-decoration: underline;
        }

        .back-btn {
            display: inline-block;
            margin-top: 15px;
            padding: 10px 15px;
            background: #111;
            border: 2px solid #ff1493;
            color: #ff69b4;
            border-radius: 8px;
            font-weight: bold;
            transition: all 0.3s ease-in-out;
            text-transform: uppercase;
        }

        .back-btn:hover {
            background: #ff1493;
            color: white;
            transform: scale(1.1);
            box-shadow: 0 5px 15px rgba(255, 20, 147, 0.4);
        }
    </style>
</head>
<body>
    <form id="signupForm" runat="server">
        <div class="container">
            <h2>Sign Up</h2>

            <label for="nameInput">Name</label>
            <asp:TextBox ID="nameInput" runat="server" placeholder="Enter Your Name"></asp:TextBox>

            <label for="emailInput">Email</label>
            <asp:TextBox ID="emailInput" runat="server" placeholder="Enter Your Email" TextMode="Email"></asp:TextBox>

            <asp:Button ID="btnSignup" runat="server" Text="Register" CssClass="btn" OnClick="btnSignup_Click" />

            <div class="link-container">
                <p>Already have an account? <a href="Login.aspx">Login here</a></p>
            </div>

            <a href="Home.aspx" class="back-btn">⬅ Back to Home</a>
        </div>
    </form>
</body>
</html>
