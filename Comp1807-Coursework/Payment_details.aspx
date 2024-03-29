﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment_details.aspx.cs" Inherits="Comp1807_Coursework.Payment_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Payment Details</strong></h1>
    <div class="row">
        <div class="col-md-8">
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
                        <h3><strong>Time</strong></h3>
                        <asp:Label ID="Date" runat="server" Text="-"></asp:Label>
                    </div>
                    
                    <div class="col-md-5">
                        <h3><strong>Minicab</strong></h3>
                        <asp:Label ID="minicab" runat="server" Text="-"></asp:Label>
                    </div>
                    <div class="col-md-7">
                        <h3><strong>Distance</strong></h3>
                        <asp:Label ID="lblDistance" runat="server" Text="Distance testing"></asp:Label>
                    </div>
                    <div class="col-md-5">
                        <h3><strong>Flight number</strong></h3>
                        <asp:Label ID="lblFlight" runat="server" Text="-"></asp:Label>
                    </div>
                    <br />
                    <div class="col-md-12" style="text-align: right;">
                        <asp:LinkButton ID="changeLink" runat="server" OnClick="changeLink_Click">Modify</asp:LinkButton>
                    </div>
                </div>
                <hr style="border: none; border-top: 2px solid black;" />
                <div class="container">
                    <div class="col-md-7">
                        <h3><strong>Total Amount</strong></h3>
                        <asp:Label ID="lblTotalAmount" runat="server" Text="-"></asp:Label><br />
                    </div>
                    <div class="col-md-5">
                        <h3><strong>Discount Given</strong></h3>
                        <asp:Label ID="lblDiscount" runat="server" Text="15%"></asp:Label><br />
                    </div>
                    <div class="col-md-7">
                        <h3><strong>Total Price</strong></h3>
                        <asp:Label ID="lblGrandTotal" runat="server" Text="-"></asp:Label><br />
                    </div>
                </div><br />
            </div>
        </div>

        <div class="col-md-4">
            <div class="jumbotron">
                <div class="container">
                    <h3><strong>Payment Method</strong></h3>
                    <asp:RadioButtonList ID="radioPayMethod" runat="server">
                        <asp:ListItem>Visa</asp:ListItem>
                        <asp:ListItem>Master Card</asp:ListItem>
                        <asp:ListItem>Paypal</asp:ListItem>
                    </asp:RadioButtonList>
                </div><br />

                <div class="container">
                    <div class="text-center">
                        <asp:Button ID="btnpay" runat="server" Text="Pay" CssClass="btn btn-primary" Width="100%" OnClick="btnpay_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
