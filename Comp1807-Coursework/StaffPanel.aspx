<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffPanel.aspx.cs" Inherits="Comp1807_Coursework.StaffPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Select the service for customer</strong></h1>

    <div class="jumbotron">
        <div class="container">
        <div class="row">
            <div class="col-md-6" style="text-align:center">
                <asp:ImageButton ID="local" runat="server" ImageAlign="Middle" Height="40" Width="40" ImageUrl="~/Resource/electric-car.png" OnClick="local_Click" />
                <span style="display:block; text-align:center">Travel</span><br />
            </div>
            <div class="col-md-4" style="text-align:center">
                <asp:ImageButton ID="rental" runat="server" ImageAlign="Middle" Height="40" Width="40" ImageUrl="~/Resource/car-rental.png" OnClick="rental_Click" />
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
    </div>
    <hr style="border: none; border-top: 2px solid black;" />

    <div class="jumbotron">
        <div class="container">
            <div class="row">
                <div class="col-md-6"style="text-align:center">
                    <asp:Image ID="driver" runat="server" ImageUrl="~/Resource/cabdriver.png" Width="60" Height="60" /><br /><br />
                    <asp:Button ID="btnAddDriver" runat="server" Text="Add new driver" CssClass="btn btn-primary btn-lg" Width="202px" OnClick="btnAddDriver_Click" /><br /><br />
                </div>

                <div class="col-md-6"style="text-align:center">
                    <asp:Image ID="taxi" runat="server" ImageUrl="~/Resource/taxi.png" Width="60" Height="60" /><br /><br />
                    <asp:Button ID="btnAddMinicab" runat="server" Text="Add new minicab" CssClass="btn btn-primary btn-lg" Width="202px" OnClick="btnAddMinicab_Click" /><br /><br />
                </div>

                <div class="col-md-6"style="text-align:center">
                    <asp:Image ID="register" runat="server" ImageUrl="~/Resource/add-user.png" Width="60" Height="60" /><br /><br />
                    <asp:Button ID="btnRegisterCustomer" runat="server" Text="Customer Register" CssClass="btn btn-primary btn-lg" Width="202px"/>
                </div>

                <div class="col-md-6"style="text-align:center">
                    <asp:Image ID="BookingStatus" runat="server" ImageUrl="~/Resource/status.png" Width="60" Height="60" /><br /><br />
                    <asp:Button ID="btnUpdateStatus" runat="server" Text="Update Status" CssClass="btn btn-primary btn-lg" Width="202px"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
