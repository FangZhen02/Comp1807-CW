<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Service.aspx.cs" Inherits="Comp1807_Coursework.Service" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Transport Service</strong></h1>
    <div class="row">
        <div class="col-md-6">
            <h2><strong>Details</strong></h2>
            <div class="jumbotron">
                <div class="col-md-6">
                    <h4>Pick up</h4>
                    <input type="text" class="form-control mb-4" id="slot1" name="slot1" required /><br />
                </div>
                <div class="col-md-6">
                    <h4>Destination</h4>
                    <input type="text" class="form-control mb-4" id="slot2" name="slot2" required /><br />
                </div>
                <div class="col-md-6">
                    <h4>Time</h4>
                    <input type="text" class="form-control mb-4" id="slot3" name="slot3" required /><br />
                </div>
                <div class="col-md-6">
                    <h4>Capacity</h4>
                    <input type="text" class="form-control mb-4" id="slot4" name="slot4" required /><br />
                </div>
                <div class="col-md-6">
                    <h4>Additional Remarks</h4>
                    <input type="text" class="form-control mb-4" id="slot5" name="slot5" required /><br />
                </div>
                <div class="col-md-6">
                    <h4>...</h4>
                    <input type="text" class="form-control mb-4" id="slot6" name="slot6" required /><br />
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
