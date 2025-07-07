<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bill.aspx.cs" Inherits="finalnailart05.Bill" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Invoice</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #111;
            text-align: center;
            padding: 20px;
            color: white;
        }

        .invoice-container {
            width: 50%;
            margin: 50px auto;
            padding: 25px;
            background: #222;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(255, 20, 147, 0.4);
            border: 2px solid #ff1493;
            animation: float 1.5s ease-in-out infinite alternate;
        }

        @keyframes float {
            0% { transform: translateY(0px); }
            100% { transform: translateY(-8px); }
        }

        .invoice-header {
            font-size: 28px;
            font-weight: bold;
            color: #ff1493;
            text-transform: uppercase;
        }

        .invoice-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .invoice-table td {
            padding: 12px;
            border-bottom: 1px solid #ff1493;
            font-size: 16px;
        }

        .status-completed {
            color: #28a745;
            font-weight: bold;
        }

        .btn-print {
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
            margin-top: 20px;
        }

        .btn-print:hover {
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

    <div class="invoice-container">
        <div class="invoice-header">Payment Invoice</div>
        <p><strong>Date:</strong> <span id="lblDate"></span></p>
        
        <table class="invoice-table">
            <tr>
                <td><strong>Transaction ID</strong></td>
                <td><asp:Label ID="lblTransactionId" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><strong>Service</strong></td>
                <td><asp:Label ID="lblServiceName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><strong>Amount Paid</strong></td>
                <td><asp:Label ID="lblAmount" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td><strong>Payment Status</strong></td>
                <td><asp:Label ID="lblStatus" runat="server" CssClass="status-completed"></asp:Label></td>
            </tr>
        </table>

        <button class="btn-print" onclick="printInvoice()">Print Invoice</button>
    </div>

    <script>
        function showCoins() {
            for (let i = 0; i < 25; i++) {
                let coin = document.createElement("img");
                coin.src = "coin.jpg";
                coin.className = "coin";
                coin.style.left = Math.random() * window.innerWidth + "px";
                coin.style.animationDuration = (1 + Math.random() * 1.5) + "s";
                document.body.appendChild(coin);

                setTimeout(() => { coin.remove(); }, 3000);
            }
        }

        function printInvoice() {
            showCoins();
            setTimeout(() => { window.print(); }, 1800);
        }
    </script>

    <a href="https://localhost:44316/Home.aspx" class="back-btn">⬅ Go Back</a>
</body>
</html>
