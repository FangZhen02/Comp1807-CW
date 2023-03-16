<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Comp1807_Coursework.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Sign Up</h1>

            <div class="jumbotron">
                <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h3>First Name</h3>
                        <asp:TextBox ID="txtFirstName" runat="server" Height="37px" Width="1196px"></asp:TextBox>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <h3>Last Name</h3>
                        <asp:TextBox ID="txtLastName" runat="server" Height="37px" Width="1196px"></asp:TextBox>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <h3>Email</h3>
                        <asp:TextBox ID="txtEmail" runat="server" Height="37px" Width="1196px"></asp:TextBox>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <h3>Contact Number</h3>
                        <asp:TextBox ID="txtContactNum" runat="server" Height="37px" Width="1196px"></asp:TextBox>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <h3>Password</h3>
                        <asp:TextBox ID="txtPassword" runat="server" Height="37px" Width="1196px"></asp:TextBox>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <h3>Confirm Password</h3>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" Height="37px" Width="1196px"></asp:TextBox>
                        <br />
                    </div>
                </div>
                    <div class="container text-center">
                    <p>
                        <asp:Button ID="btnSubmit" runat="server" Text="Continue" CssClass="btn btn-primary btn-lg" Width="303px" OnClick="btnSubmit_Click" />
                    </p>
                        <strong>Have an account?&nbsp;</strong> <a href="Login.aspx">Login here</a>
                    </div>
                </div>              
            </div>
</asp:Content>
