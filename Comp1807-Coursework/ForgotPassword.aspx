<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="Comp1807_Coursework.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Forgot Password</strong></h1><br />
    
    <div class="row">
        <div class="col-md-7">
            <div class="jumbotron">
                <div class ="container">
                    <h3><strong>Confirm Email</strong></h3>
                    <asp:TextBox ID="txtConfirmEmail" runat="server" CssClass="form-control mb-4"></asp:TextBox>
                </div>
                <div class="container" style="text-align:right">
                    <asp:Label ID="lblInvalidEmail" runat="server" ForeColor="#CC0000" Text="Email doest not exist." Visible="False"></asp:Label>
                    <asp:Button ID="btnComfirm" runat="server" Text="Confirm" CssClass="btn btn-primary" OnClick="btnComfirm_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
