<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerRegister.aspx.cs" Inherits="Comp1807_Coursework.CustomerRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Customer Register</h1>

            <div class="jumbotron">
                <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h3>First Name</h3>
                        <asp:TextBox ID="txtFirstName" runat="server" Height="37px" Width="1196px" CssClass="form-control mb-4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <h3>Last Name</h3>
                        <asp:TextBox ID="txtLastName" runat="server" Height="37px" Width="1196px" CssClass="form-control mb-4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        
                        <br />
                    </div>
                    <div class="col-md-6">
                        <h3>Email</h3>
                        <asp:TextBox ID="txtEmail" runat="server" Height="37px" Width="1196px" CssClass="form-control mb-4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblEmailExist" runat="server" ForeColor="Red" Text="Email already exist" Visible="False"></asp:Label>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Incorrect email format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </div>
                    <div class="col-md-6">
                        <h3>Contact Number</h3>
                        <asp:TextBox ID="txtContactNum" runat="server" Height="37px" Width="1196px" CssClass="form-control mb-4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtContactNum" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <h3>Password</h3>
                        <asp:TextBox ID="txtPassword" runat="server" Height="37px" Width="1196px" TextMode="Password" CssClass="form-control mb-4"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPassword" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                    </div>
                    <div class="col-md-6">
                        <h3>Confirm Password</h3>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" Height="37px" Width="1196px" CssClass="form-control mb-4" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtConfirmPassword" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:Label ID="lblVerifyPassword" runat="server" ForeColor="Red" Text="Password Mismatch" Visible="False"></asp:Label>
                        <br />
                    </div>
                </div>
                    <br />
                    <div class="container text-center">
                        <p>
                            <asp:Button ID="btnSubmit" runat="server" Text="Continue" CssClass="btn btn-primary btn-lg" Width="303px"/>
                        </p>
                    </div>
                </div>              
            </div>

</asp:Content>
