<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookAppointment.aspx.cs" Inherits="finalnailart05.BookAppointment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Appointment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #111;
            text-align: center;
            padding: 20px;
            color: white;
        }

        .container {
            width: 50%;
            margin: auto;
            background: #222;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(255, 20, 147, 0.4);
            border: 2px solid #ff1493;
            animation: float 1.5s ease-in-out infinite alternate;
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            100% { transform: translateY(-8px); }
        }

        h2 {
            color: #ff1493;
            font-size: 26px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .form-control {
            width: 90%;
            padding: 12px;
            margin: 10px;
            border: 2px solid #ff1493;
            border-radius: 8px;
            font-size: 16px;
            background: #333;
            color: white;
            transition: 0.3s;
            outline: none;
        }

        .form-control:focus {
            border-color: #ff69b4;
            box-shadow: 0 0 15px rgba(255, 105, 180, 0.5);
        }

        .btn-submit {
            width: 90%;
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
            text-decoration: none;
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
    <form id="form1" runat="server">
        <div class="container">
            <h2>Book Your Appointment</h2>

            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Enter Name" required></asp:TextBox><br />
            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" Placeholder="Enter Phone Number" required></asp:TextBox><br />
            <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" Placeholder="Select Date" TextMode="Date" required></asp:TextBox><br />
            <asp:TextBox ID="txtService" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox><br />
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox><br />

            <asp:HiddenField ID="hfServiceId" runat="server" />

            <asp:Button ID="btnSubmit" runat="server" Text="Confirm Booking" CssClass="btn-submit" OnClick="ConfirmAppointment" />
        </div>
    </form>

    <a href="Services.aspx" class="back-btn">⬅ Cancel Appointment or Go Back</a>
</body>
</html>
