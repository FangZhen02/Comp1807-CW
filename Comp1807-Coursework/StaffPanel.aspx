<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffPanel.aspx.cs" Inherits="Comp1807_Coursework.StaffPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Select the service for customer</strong></h1>

    <div class="jumbotron">
        <div class="container">
        <div class="row">
            <asp:Hyperlink ID="localLink" runat="server" NavigateUrl="~\Service.aspx">
                <div class="col-md-2" style="text-align:center">
                    <asp:Image ID="local" runat="server" ImageUrl="~/Resource/car.png" Width="60" Height="60" />
                    <span style="display:block; text-align:center">Local</span><br />
                </div>
            </asp:Hyperlink>
            <asp:HyperLink ID="localLink2" runat="server" NavigateUrl="~\Service.aspx">
                <div class="col-md-3"style="text-align:center">
                    <asp:Image ID="rental" runat="server" ImageUrl="~/Resource/rent.png" Width="60" Height="60" />
                    <span style="display:block; text-align:center">Rental</span><br />
                </div>
            </asp:HyperLink>
            <asp:HyperLink ID="localLink3" runat="server" NavigateUrl="~\Service.aspx">
                <div class="col-md-2" style="text-align:center">
                    <asp:Image ID="airports" runat="server" ImageUrl="~/Resource/airport.png" Width="60" Height="60" />
                    <span style="display:block; text-align:center">Airports</span><br />
                </div>
            </asp:HyperLink>
            <asp:hyperlink ID="localLink4" runat="server" NavigateUrl="~/Service.aspx">
                <div class="col-md-3" style="text-align:center">
                    <asp:Image ID="hotelTransfer" runat="server" ImageUrl="~/Resource/hotel.png" Width="60" Height="60" />
                    <span style="display:block; text-align:center">Hotel Transfer</span><br />
                </div>
            </asp:hyperlink>
            <asp:HyperLink ID="localLink5" runat="server" NavigateUrl="~/Service.aspx">
                <div class="col-md-2" style="text-align:center">
                    <asp:Image ID="meetGreet" runat="server" ImageUrl="~/Resource/meet.png" Width="60" Height="60" />
                    <span style="display:block; text-align:center">Meet-Greet</span>
                </div>
            </asp:HyperLink>
            </div>
        </div>
    </div>
    <hr style="border: none; border-top: 2px solid black;" />

    <div class="jumbotron">
        <div class="container">
            <div class="row">
                <div class="col-md-6"style="text-align:center">
                    <asp:Image ID="driver" runat="server" ImageUrl="~/Resource/cabdriver.png" Width="100" Height="100" /><br /><br />
                    <asp:Button ID="btnAddDriver" runat="server" Text="Add new driver" CssClass="btn btn-primary btn-lg" Width="303px" />
                </div>

                <div class="col-md-5"style="text-align:center">
                    <asp:Image ID="taxi" runat="server" ImageUrl="~/Resource/taxi.png" Width="100" Height="100" /><br /><br />
                    <asp:Button ID="btnAddMinicab" runat="server" Text="Add new minicab" CssClass="btn btn-primary btn-lg" Width="303px" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
