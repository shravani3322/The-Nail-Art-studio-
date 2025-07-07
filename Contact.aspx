<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="finalnailart05.Contact" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Contact Us</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #111;
            color: white;
            text-align: center;
            padding: 20px;
        }

        .contact-container {
            width: 40%;
            background: #222;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(255, 20, 147, 0.4);
            margin: auto;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            margin-bottom: 12px;
            border: 2px solid #ff1493;
            border-radius: 6px;
            background: #333;
            color: white;
            font-size: 16px;
            text-align: center;
        }

        .btn-submit {
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

        .btn-submit:hover {
            background: linear-gradient(135deg, #ff69b4, #ff1493);
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(255, 105, 180, 0.4);
        }
    </style>
</head>
<body>

    <h2 style="color: #ff1493;">Contact Us</h2>
    <form id="form1" runat="server">
        <div class="contact-container">
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Your Name"></asp:TextBox>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Your Email"></asp:TextBox>
            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" Placeholder="Your Message"></asp:TextBox>

            <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn-submit" OnClick="SubmitContact" />
        </div>
    </form>

</body>
      <center>
     <a href="https://localhost:44316/Home.aspx" style="color: pink; text-decoration: none; font-weight: bold; transition: 0.3s;" 
   onmouseover="this.style.color='black'; this.style.background='pink'; this.style.padding='5px 10px'; this.style.borderRadius='5px';" 
   onmouseout="this.style.color='pink'; this.style.background=''; this.style.padding=''; this.style.borderRadius='';">
   ⬅ Back to Home</center>
</html>
