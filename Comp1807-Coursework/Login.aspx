<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Comp1807_Coursework.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1><strong>Login</strong></h1>
    <div class="row">
        <div class="col-md-6">
            <div class="jumbotron">
                <div class="container">
                    <h1>Customer</h1>
                    <p>Email</p>
                    <asp:TextBox ID="txtEmail" runat="server" Height="39px" Width="1162px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Incorrect email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <br />
                    <p>Password</p>
                    <asp:TextBox ID="txtPassword" runat="server" Height="39px" TextMode="Password" Width="1162px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    <br />

                    <br />

                    <asp:Button ID="btnLogin" runat="server" Text="Continue" CssClass="btn btn-primary btn-lg" Width="303px" OnClick="btnLogin_Click" />&nbsp;&nbsp;
                    <br />
&nbsp;<br />
                    <asp:Label ID="lblIncorrect" runat="server" ForeColor="Red" Text="Username or password mismatch" Visible="False"></asp:Label>
                    <br />
                    <strong>
                    <br />
                    New? click here to</strong> <a href="SignUp.aspx">Sign Up</a>
                </div>
            </div>
            
        </div>

        <div class="col-md-6">
            <div>
                <asp:Image ID="loginImg" runat="server" ImageUrl="~\Resource\login-vector.jpg" AlternateText="Login image" />
            </div>
        </div>
    </div>
</asp:Content>