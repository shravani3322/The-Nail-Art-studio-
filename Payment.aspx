<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="finalnailart05.Payment" %>

<!DOCTYPE html>
<html>
<head>
    <title>Make Payment</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            background: #111; 
            padding: 20px; 
            text-align: center; 
            color: white;
        }

        .payment-container { 
            width: 40%; 
            background: #222; 
            padding: 25px; 
            border-radius: 12px; 
            box-shadow: 0 10px 30px rgba(255, 20, 147, 0.4); 
            border: 2px solid #ff1493;
            animation: float 1.5s ease-in-out infinite alternate;
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            100% { transform: translateY(-8px); }
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

        .form-control::placeholder {
            color: #ff69b4;
        }

        .btn-pay { 
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
            margin-top: 15px;
        }

        .btn-pay:hover { 
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

        /* Coins Animation */
        .coin {
            position: fixed;
            top: -50px;
            width: 40px;
            height: 40px;
            animation: fall ease-in-out infinite;
            z-index: 9999;
        }

        @keyframes fall {
            0% { transform: translateY(-50px) rotate(0deg); opacity: 1; }
            100% { transform: translateY(100vh) rotate(360deg); opacity: 0; }
        }
    </style>
</head>
<body>
    <center>

    <h2 style="color: #ff1493; text-transform: uppercase;">Make a Payment</h2>
    <form id="form1" runat="server">
        <div class="payment-container">
            <asp:HiddenField ID="hfUserId" runat="server" />
            <asp:HiddenField ID="hfServiceId" runat="server" />

            <asp:TextBox ID="txtAmount" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
            <asp:TextBox ID="txtTransactionId" runat="server" CssClass="form-control" placeholder="Transaction ID (Auto-generated)" ReadOnly="true"></asp:TextBox>

            <asp:Button ID="btnPay" runat="server" Text="Confirm Payment" CssClass="btn-pay" OnClick="ConfirmPayment" />
        </div>
    </form>

    <a href="https://localhost:44316/Home.aspx" class="back-btn">⬅ Go Back</a>

</body>
    </center>
</html>
