<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Payment_details.aspx.cs" Inherits="Comp1807_Coursework.Payment_details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1><strong>Payment Details</strong></h1>
    <div class="row">
        <div class="col-md-8">
            <div class="jumbotron">
                <div class="container">
                    <div class="col-md-8">
                        <h3><strong>Pick Up</strong></h3>
                        <asp:Label ID="PickUp" runat="server" text="Pick Up Location"></asp:Label><br />
                    </div>
                    <div class="col-md-4">
                        <h3><strong>Destination</strong></h3>
                        <asp:Label ID="Destination" runat="server" Text ="Destination"></asp:Label><br />
                    </div>
                    <div class="col-md-8">
                        <h3><strong>Date</strong></h3>
                        <asp:Label ID="Date" runat="server" Text="Date"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <h3><strong>Time</strong></h3>
                        <asp:Label ID="Time" runat="server" Text="Time"></asp:Label>
                    </div>
                    <div class="col-md-8">
                        <h3><strong>Minicab</strong></h3>
                        <asp:Label ID="minicab" runat="server" Text="Seat size"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="jumbotron">
                <div class="container">
                    <div class="col-md-12">
                        <h3><strong>Total Amount</strong></h3>
                        <asp:Label ID="Amount" runat="server" Text="Date"></asp:Label><br />
                    </div>
                    <div class="col-md-12">
                        <h3><strong>Discount Given</strong></h3>
                        <asp:Label ID="Discount" runat="server" Text="Date"></asp:Label><br />
                    </div>
                    <div class="col-md-12">
                        <h3><strong>Total Price</strong></h3>
                        <asp:Label ID="Total" runat="server" Text="Date"></asp:Label><br />
                    </div>
                </div><br />

                <div class="container">
                    <div class="text-center">
                        <asp:Button ID="btnpay" runat="server" Text="Pay" CssClass="btn btn-primary" Width="100%"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
