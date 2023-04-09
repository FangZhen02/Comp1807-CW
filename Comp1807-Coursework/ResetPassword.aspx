<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Comp1807_Coursework.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Reset Password</strong></h1>

    <div class="row">
        <div class="col-md-7">
            <div class="jumbotron">
                <div class ="container">
                    <div class="col-md-12">
                        <h3><strong>Temporary Password</strong></h3>
                        <asp:TextBox ID="txtTempoPassword" runat="server" CssClass="form-control mb-4" TextMode="Password"></asp:TextBox><br />
                    </div>
                    <div class="col-md-12">
                        <h3><strong>New Password</strong></h3>
                        <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control mb-4" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPassword" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNewPassword" 
                            ErrorMessage="Password must be at least 8 characters and contain at least one uppercase letter, one lowercase letter, and one number" 
                            ValidationExpression="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-12">
                        <h3><strong>Confirm New Password</strong></h3>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control mb-4" TextMode="Password"></asp:TextBox><br />
                    </div>
                </div>
                <div class="container" style="text-align:right">
                    <asp:Button ID="btnReset" runat="server" Text="Reset Password" CssClass="btn btn-primary" OnClick="btnReset_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
