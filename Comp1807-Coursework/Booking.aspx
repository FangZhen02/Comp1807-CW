<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Comp1807_Coursework.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Booking</strong></h1>
    <div class="container" style="text-align: right;">
        <h2>Title</h2><br />
        <p>Add a little bit of body text</p>
    </div>
    <hr style="border: none; border-top: 2px solid black;" />
    <div class="container">
        <h1><strong>Ride Services</strong></h1><br />
        <div class="row">
            <asp:Hyperlink ID="localLink" runat="server" NavigateUrl="~\Service.aspx">
                <div class="col-md-6" style="text-align:center">
                    <asp:Image ID="local" runat="server" ImageUrl="~/Resource/car.png" Width="40" Height="40" />
                    <span style="display:block; text-align:center">Local</span><br />
                </div>
            </asp:Hyperlink>
            <asp:HyperLink ID="localLink2" runat="server" NavigateUrl="~\Service.aspx">
                <div class="col-md-4"style="text-align:center">
                    <asp:Image ID="rental" runat="server" ImageUrl="~/Resource/rent.png" Width="40" Height="40" />
                    <span style="display:block; text-align:center">Rental</span><br />
                </div>
            </asp:HyperLink>
            <asp:HyperLink ID="localLink3" runat="server" NavigateUrl="~\Service.aspx">
                <div class="col-md-6" style="text-align:center">
                    <asp:Image ID="airports" runat="server" ImageUrl="~/Resource/airport.png" Width="40" Height="40" />
                    <span style="display:block; text-align:center">Airports</span><br />
                </div>
            </asp:HyperLink>
            <asp:hyperlink ID="localLink4" runat="server" NavigateUrl="~/Service.aspx">
                <div class="col-md-4" style="text-align:center">
                    <asp:Image ID="hotelTransfer" runat="server" ImageUrl="~/Resource/hotel.png" Width="40" Height="40" />
                    <span style="display:block; text-align:center">Hotel Transfer</span><br />
                </div>
            </asp:hyperlink>
            <asp:HyperLink ID="localLink5" runat="server" NavigateUrl="~/Service.aspx">
                <div class="col-md-6" style="text-align:center">
                    <asp:Image ID="meetGreet" runat="server" ImageUrl="~/Resource/meet.png" Width="40" Height="40" />
                    <span style="display:block; text-align:center">Meet-Greet</span>
                </div>
            </asp:HyperLink>
        </div>
    </div>

</asp:Content>
