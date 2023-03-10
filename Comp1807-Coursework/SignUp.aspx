<%@ Page Language="C#" MasterPageFile="~/Site.Master"  AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Comp1807_Coursework.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Sign Up</h1>
            <div class="jumbotron">
                <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <h3>First Name</h3>
                        <input type="text" class="form-control mb-4" id="first_name" name="first_name" required /><br />
                    </div>
                    <div class="col-md-6">
                        <h3>Last Name</h3>
                        <input type="text" class="form-control mb-4" id="last_name" name="last_name" required /><br />
                    </div>
                    <div class="col-md-6">
                        <h3>Email</h3>
                        <input type="text" class="form-control mb-4" id="email" name="email" required /><br />
                    </div>
                    <div class="col-md-6">
                        <h3>Contact Number</h3>
                        <input type="text" class="form-control mb-4" id="contact_number" name="contact_number" required /><br />
                    </div>
                    <div class="col-md-6">
                        <h3>Password</h3>
                        <input type="text" class="form-control mb-4" id="password" name="password" required /><br />
                    </div>
                    <div class="col-md-6">
                        <h3>Confirm Password</h3>
                        <input type="text" class="form-control mb-4" id="confirm_password" name="confirm_password" required /><br />
                    </div>
                </div>
                    <div class="container text-center">
                    <p>
                        <asp:Button ID="btnSubmit" runat="server" Text="Continue" CssClass="btn btn-primary btn-lg" Width="303px" />
                    </p>

                        <strong>Have an account?&nbsp;</strong> <a href="Login.aspx">Login here</a>
                    </div>
                </div>

                
            </div>

</asp:Content>
