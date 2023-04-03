<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookingConfirm.aspx.cs" Inherits="Comp1807_Coursework.BookingConfirm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Booking Confirmation</strong></h1>

    <div class="jumbotron">
        <div class="container">
            <div class="col-md-7">
                <h3><strong>Service Type</strong></h3>
                <asp:Label ID="lblService" runat="server" text="-"></asp:Label><br />
            </div>
            <div class="col-md-5">
                <h3><strong>Passenger name</strong></h3>
                <asp:Label ID="lblPassengerName" runat="server" text="-"></asp:Label><br />
            </div>
            <div class="col-md-7">
                <h3><strong>Pick Up</strong></h3>
                <asp:Label ID="PickUp" runat="server" text="-"></asp:Label><br />
            </div>
            <div class="col-md-5">
                <h3><strong>Destination</strong></h3>
                <asp:Label ID="Destination" runat="server" Text ="-"></asp:Label><br />
            </div>
            <div class="col-md-7">
                <h3><strong>Date</strong></h3>
                <asp:Label ID="Date" runat="server" Text="-"></asp:Label>
            </div>
            <div class="col-md-5">
                <h3><strong>Time</strong></h3>
                <asp:Label ID="Time" runat="server" Text="-"></asp:Label>
            </div>
                    
            <div class="col-md-7">
                <h3><strong>Minicab</strong></h3>
                <asp:Label ID="minicab" runat="server" Text="-"></asp:Label>
            </div>
            <div class="col-md-5">
                <h3><strong>Distance</strong></h3>
                <asp:Label ID="lblDistance" runat="server" Text="Distance testing"></asp:Label>
            </div>
            <div class="col-md-12">
                <h3><strong>Flight number</strong></h3>
                <asp:Label ID="lblFlight" runat="server" Text="-"></asp:Label>
            </div>
        </div>
        <hr style="border: none; border-top: 2px solid black;" />
        <div class="container">
            <div class="col-md-7">
                <h3><strong>Driver Name</strong></h3>
                <asp:Label ID="lblDriver" runat="server" Text="-"></asp:Label>
            </div>
            <div class="col-md-5">
                <h3><strong>Minicab Model</strong></h3>
                <asp:Label ID="lblMinicab" runat="server" Text="-"></asp:Label>
            </div>
            <div class="col-md-7">
                <h3><strong>Minicab Color</strong></h3>
                <asp:Label ID="lblMiniColor" runat="server" Text="-"></asp:Label>
            </div>
            <div class="col-md-5">
                <h3><strong>Number plate</strong></h3>
                <asp:Label ID="lblMiniNumber" runat="server" Text="-"></asp:Label>
            </div>
        </div>
        <hr style="border: none; border-top: 2px solid lightgray;" />
        <div class="container">
            <div class="col-md-12">
                <h3><strong>Total Price</strong></h3>
                <asp:Label ID="lblTotal" runat="server" Text="-"></asp:Label>
            </div>
        </div>
        <div class="container">
            <div class="col-md-12" style="text-align:center">
                <asp:Button ID="btnPrint" runat="server" CssClass="btn btn-primary" Width="100px" Text="Print" OnClick="btnPrint_Click" />
            &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnHistory" runat="server" CssClass="btn btn-primary" Width="100px" Text="History" OnClick="btnHistory_Click" />
            </div>
        </div>
    </div>
</asp:Content>
