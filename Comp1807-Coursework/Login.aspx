<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Comp1807_Coursework.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Login</strong></h1>
    <div class="row">
        <div class="col-md-6">
            <div class="jumbotron">
                <div class="container">
                    <h1>Customer</h1>
                    <p>Email</p>
                    <input type="text" class="form-control mb-4" id="email" name="email" required /><br />
                    <p>Password</p>
                    <input type="text" class="form-control mb-4" id="password" name="password" required /><br />

                    <asp:RadioButton ID="terms" runat="server" />&nbsp;I agree to the terms and conditions<br />

                    <asp:Button ID="btnLogin" runat="server" Text="Continue" CssClass="btn btn-primary btn-lg" Width="303px" /><br />
                    <strong>New? click here to</strong> <a href="SignUp.aspx">Sign Up</a>
                </div>
            </div>
            
        </div>
        <div class="col-md-6">
            <div>
                <asp:Image ID="loginImg" runat="server" ImageUrl="~\Resource\login-vector.jpg" AlternateText="Login image" />
            </div>
        </div>
    </div>
    <div class="jumbotron">
        <div class="container">
        <h1>Staff</h1>
            <div class="col-md-6">
                <h3>Staff ID</h3>
                <input type="text" class="form-control mb-4" id="staffID" name="staffID" required /><br />
            </div>
            <div class="col-md-6">
                <h3>Password</h3>
                <input type="text" class="form-control mb-4" id="staffPassword" name="staffPassword" required /><br />
            </div>
            <div class="container" >
            <asp:Button ID="btnStaffLogin" runat="server" Text="Continue" CssClass="btn btn-primary btn-lg" Width="100%" />
            </div>
        </div>
    </div>
</asp:Content>
