<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NailArt.aspx.cs" Inherits="finalnailart05.NailArt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Nail Art Services - Nail Art Studio</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap');

        body {
            font-family: 'Poppins', sans-serif;
            background: #000;
            margin: 0;
            padding: 0;
            color: white;
        }

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
            background: pink;
            color: black;
        }

        .service-box img {
            width: 100%;
            border-radius: 10px;
        }

        .service-box h3 {
            margin-top: 10px;
            color: pink;
        }

        .book-btn {
            background: pink;
            color: black;
            border: none;
            padding: 10px 15px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            border-radius: 10px;
            transition: 0.3s;
        }

        .book-btn:hover {
            background: black;
            color: pink;
            border: 1px solid pink;
        }
    </style>
</head>
<body>

    <h1 style="text-align:center; margin-top:20px;">Nail Art Services</h1>

    <div class="services">
        <asp:Repeater ID="RepeaterNailArt" runat="server">
    <ItemTemplate>
        <div class="service-box">
            <img src='<%# Eval("image") %>' alt="Service Image">
            <h3><%# Eval("service_name") %></h3>
            <p>Price: ₹<%# Eval("price") %></p>
            <input type="checkbox" name="serviceCheckbox" value='<%# Eval("id") %>'> Select
            <br>
            <a href='<%# "BookAppointment.aspx?serviceId=" + Eval("id") + "&serviceName=" + Eval("service_name") + "&price=" + Eval("price") %>'>
                <button class="book-btn">Book Appointment</button>
            </a>
        </div>
    </ItemTemplate>
</asp:Repeater>

    </div>
    <a href="Home.aspx" style="color: pink; text-decoration: none; font-weight: bold; transition: 0.3s;" 
   onmouseover="this.style.color='black'; this.style.background='pink'; this.style.padding='5px 10px'; this.style.borderRadius='5px';" 
   onmouseout="this.style.color='pink'; this.style.background=''; this.style.padding=''; this.style.borderRadius='';">
   ⬅ Back to Home
</a>

</body>
</html>
