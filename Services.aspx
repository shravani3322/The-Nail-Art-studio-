<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="finalnailart05.Services" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Services</title>
    <link rel="stylesheet" href="styles.css" />
    <style>
        body { font-family: Arial, sans-serif; background: #f8f8f8; margin: 0; padding: 20px; }
        .services-container { display: flex; flex-wrap: wrap; justify-content: center; gap: 20px; }
        .service-card { width: 45%; background: #fff; padding: 15px; border-radius: 10px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); text-align: center; transition: 0.3s; }
        .service-card:hover { transform: scale(1.05); }
        .service-img { width: 100%; height: 200px; object-fit: cover; border-radius: 10px; }
        .btn-book { background: #ff5722; color: white; border: none; padding: 10px 15px; cursor: pointer; margin-top: 10px; transition: 0.3s; }
        .btn-book:hover { background: #e64a19; transform: scale(1.1); }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2 style="text-align:center;">Our Services</h2>
        <div class="services-container">
            <asp:Repeater ID="rptServices" runat="server">
                <ItemTemplate>
                    <div class="service-card">
<asp:Image ID="imgService" runat="server" ImageUrl='<%# ResolveUrl("~/" + Eval("image")) %>' Width="250px" Height="250px" />
     
                        <h3><%# Eval("service_name") %></h3>
                        <p><%# Eval("description") %></p>
                        <p class="price">Price: $<%# Eval("price") %></p>

                        <!-- Hidden fields to pass service data -->
                        <asp:HiddenField ID="hfServiceName" runat="server" Value='<%# Eval("service_name") %>' />
                        <asp:HiddenField ID="hfPrice" runat="server" Value='<%# Eval("price") %>' />

                        <asp:Button ID="btnBook" runat="server" Text="Book Now" CssClass="btn-book"
                            OnClick="BookService" CommandArgument='<%# Eval("id") %>' />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </form>
    
     <center>
     <a href="https://localhost:44316/Home.aspx" style="color: pink; text-decoration: none; font-weight: bold; transition: 0.3s;" 
   onmouseover="this.style.color='black'; this.style.background='pink'; this.style.padding='5px 10px'; this.style.borderRadius='5px';" 
   onmouseout="this.style.color='pink'; this.style.background=''; this.style.padding=''; this.style.borderRadius='';">
   ⬅ Back to Home</center>
</body>
</html>
