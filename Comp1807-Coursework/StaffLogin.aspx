<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StaffLogin.aspx.cs" Inherits="Comp1807_Coursework.StaffLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <hr style="border:none; border-top: 2px solid black;">
    <div class="jumbotron">
        <div class="container">
        <h1>Staff</h1>
            <div class="col-md-6" style="left: 0px; top: 0px; height: 133px">
                <h3>Staff Email</h3>
                <asp:TextBox ID="txtStaffEmail" runat="server" Height="35px" Width="1135px" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtStaffEmail" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtStaffEmail" ErrorMessage="Incorrect Email Format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="col-md-6">
                <h3>Password</h3>
                <asp:TextBox ID="txtStaffPassword" runat="server" Height="35px" Width="1135px" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtStaffPassword" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
            </div>
            <div class="container" >
            <asp:Button ID="btnStaffLogin" runat="server" Text="Continue" CssClass="btn btn-primary btn-lg" Width="100%" OnClick="btnStaffLogin_Click" />
            </div>
        </div>
        <asp:Label ID="lblIncorrectStaff" runat="server" ForeColor="Red" Text="Email and Password Mismatch" Visible="False"></asp:Label>
    </div>
</asp:Content>

