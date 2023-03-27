﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Airport.aspx.cs" Inherits="Comp1807_Coursework.Airport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Airport Service</strong></h1>
    <div class="row">
        <div class="col-md-6">
            <h2><strong>Details</strong></h2>
            <div class="jumbotron">
                <div class="col-md-6">
                    <h4>Pick up</h4>
                    <asp:TextBox ID="txtPickup" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                </div>
                <div class="col-md-6">
                    <h4>Destination</h4>
                    <asp:DropDownList ID="AirportOption" runat="server" CssClass="form-control mb-4">
                        <asp:ListItem Text="London Heathrow Airport (LHR)" Value="1"></asp:ListItem>
                        <asp:ListItem Text="London Gatwick Airport (LGW)"></asp:ListItem>
                        <asp:ListItem Text="London Stansted Airport (STN)"></asp:ListItem>
                        <asp:ListItem Text="London Luton Airport (LTN)"></asp:ListItem>
                        <asp:ListItem Text="London Sounthend Airport (SEN)"></asp:ListItem>
                        <asp:ListItem Text="London City Airport (LCY)"></asp:ListItem>
                    </asp:DropDownList><br />
                </div>
                <div class="col-md-6">
                    <h4>Date</h4>
                    <asp:TextBox ID="txtDate" type="date" runat="server" CssClass="form-control mb-4"></asp:TextBox><br /> <%-- need to add a new line of code for the calendar --%>
                </div>
                <div class="col-md-6">
                    <h4>Time</h4>
                    <asp:TextBox ID="txtTime" type="time" runat="server" CssClass="form-control mb-4"></asp:TextBox><br /> <%-- need to add a new line of code for the calendar --%>
                </div>
                <div class="col-md-6">
                    <h4>Total passenger</h4>
                    <asp:TextBox ID="txtCapacity" runat="server" CssClass="form-control mb-4"></asp:TextBox><br />
                </div>
                <div class="col-md-6">
                    <h4>Minicab</h4>
                    <asp:DropDownList ID="MinicabOption" runat="server" CssClass="form-control mb-4">
                        <asp:ListItem Text="Option 1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Option 2" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Option 3" Value="3"></asp:ListItem>
                    </asp:DropDownList><br />
                </div>
                <div class="container">
                    <div class="text-center">
                        <asp:Button ID="btnLogin" runat="server" Text="Continue" CssClass="btn btn-primary" Width="100%"/>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <asp:Image ID="loginImg" runat="server" ImageUrl="~\Resource\login-vector.jpg" AlternateText="Login image" />
        </div>
    </div>
</asp:Content>
