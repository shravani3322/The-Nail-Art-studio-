<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="finalnailart05.Invoice" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Invoice</title>
    <link rel="stylesheet" href="styles.css"> 
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            text-align: center;
            margin: 50px;
        }
        .invoice-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: auto;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .btn-print {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
        }
        .btn-print:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="invoice-container">
        <h2>Payment Invoice</h2>
        <p><b>Date:</b> <%= DateTime.Now.ToString("MM/dd/yyyy, hh:mm tt") %></p>
        
        <table>
            <tr>
                <td><b>Customer Name</b></td>
                <td><%= customerName %></td>
            </tr>
            <tr>
                <td><b>Service</b></td>
                <td><%= serviceName %></td>
            </tr>
            <tr>
                <td><b>Amount Paid</b></td>
                <td>₹ <%= amount %></td>
            </tr>
            <tr>
                <td><b>Payment Status</b></td>
                <td><b style="color: green;">Paid</b></td>
            </tr>
        </table>

        <button class="btn-print" onclick="window.print()">Print Invoice</button>
    </div>
</body>
</html>
