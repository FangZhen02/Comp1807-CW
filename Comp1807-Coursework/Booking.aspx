<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Comp1807_Coursework.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Booking</strong></h1>
    <div class="container" style="text-align: center; font-style:initial">
        <h2>Book Your Next Adventure</h2><br />
        <p>Discover and book your next adventure with ease using our convenient booking page.<br /> 
            Whether you're planning a relaxing beach getaway or an action-packed city break, <br />
            our user-friendly platform makes it easy to search, compare, and book your ideal accommodation, <br />
            flights, and activities all in one place. With a wide range of options to suit all budgets and preferences, start planning your dream trip today!</p>
    </div>
    <hr style="border: none; border-top: 2px solid black;" />
    <div class="container">
        <h1><strong>Ride Services</strong></h1><br />
        <div class="row">
            <div class="col-md-6" style="text-align:center">
                <asp:ImageButton ID="local" runat="server" ImageAlign="Middle" Height="40" Width="40" ImageUrl="~/Resource/car.png" OnClick="local_Click" />
                <span style="display:block; text-align:center">Travel</span><br />
            </div>
            <div class="col-md-4" style="text-align:center">
                <asp:ImageButton ID="rental" runat="server" ImageAlign="Middle" Height="40" Width="40" ImageUrl="~/Resource/rent.png" OnClick="rental_Click" />
                <span style="display:block; text-align:center">Rental</span><br />
            </div>
            <div class="col-md-6" style="text-align:center">
                <asp:ImageButton ID="airports" runat="server" ImageAlign="Middle" Height="40" Width="40" ImageUrl="~/Resource/airport.png" OnClick="airports_Click" />
                <span style="display:block; text-align:center">Airports</span><br />
            </div>
            <div class="col-md-4" style="text-align:center">
                <asp:ImageButton ID="hotelTransfer" runat="server" ImageAlign="Middle" Height="40" Width="40" ImageUrl="~/Resource/hotel.png" OnClick="hotelTransfer_Click" />
                <span style="display:block; text-align:center">Hotel Transfer</span><br />
            </div>
            <div class="col-md-6" style="text-align:center">
                <asp:ImageButton ID="meetGreet" runat="server" ImageAlign="Middle" Height="40" Width="40" ImageUrl="~/Resource/meet.png" OnClick="meetGreet_Click" />
                <span style="display:block; text-align:center">Meet-Greet</span><br />
            </div>
            
        </div>
    </div>

</asp:Content>
